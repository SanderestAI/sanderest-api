<?php

namespace App\Modules\Base\Infrastructure\Controller;

use App\Exceptions\ForbiddenException;
use App\Exceptions\NotFoundException;
use App\Exceptions\ServerErrorException;
use App\Exceptions\ValidationErrorException;
use App\Http\Controllers\Controller;
use App\Modules\Base\Domain\BaseDomain;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Throwable;
use App\Modules\Base\Domain\BulkUpload;

abstract class ResourceController extends Controller
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function getNameParameter(): string
    {
        return 'name';
    }

    protected function getParentIdentificator()
    {
        return null;
    }

    /**
     * Return a list of request fields that should be added as exact-match ID filters.
     * Example: ['id_producto', 'id_categoria']
     * Child controllers can override to enable one or more ID filters.
     */
    protected function getIdFilterFields(): array
    {
        return [];
    }

    public function formatExceptionError(Throwable $e)
    {

        $message = $e->getMessage();

        if ($e instanceof NotFoundException) {
            $status = 404;
        } else if ($e instanceof ForbiddenException) {
            $status = 403;
        } else if ($e instanceof ServerErrorException) {
            $status = 500;
        } else if ($e instanceof ValidationErrorException) {
            $status = 422;
        } else {
            $status = 500;
        }

        return response()->json([
            "message" => $message,
            "status" => $status
        ], $status);
    }

    protected function getData(Request $request, $withoutLimit = false)
    {
        // Query parameters
        $rules = [
            // The page number. Example: 3
            'page'    => 'nullable|integer|min:0',
            // The limit items. Example: 1
            'limit'   => 'nullable|integer|min:1|max:100',
            // Filter items.
            'filter'  => 'nullable|string|max:255',
            // Sorting items. Example: desc
            'sorting' => 'nullable|string',
            // The parent resource of items. Example: 6
            'parent_id' => 'nullable|integer'
        ];
        // Dynamically add ID filter fields rules (nullable integers)
        foreach ($this->getIdFilterFields() as $idField) {
            $rules[$idField] = 'nullable|integer';
        }

        $validator = Validator::make($request->all(), $rules);

        // Check for validation errors and return a custom JSON response if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $validated = $validator->valid();

        // Retrieve query parameters and set defaults
        $page = $validated['page'] ?? 0;
        $limit = $validated['limit'] ?? 5;
        $filter = $validated['filter'] ?? '';
        $parent_id = $validated['parent_id'] ?? null;
        $sorting = $validated['sorting'] ?? 'created_at:desc';
        list($sortColumn, $sortDirection) = explode(':', $sorting);

        // The main model query
        $query = ($this->getModelClass())::orderBy($sortColumn, $sortDirection);

        // Apply parent id
        if ($this->getParentIdentificator() && is_numeric($parent_id)) {
            $query = $query->where($this->getParentIdentificator(), '=', $parent_id);
        }

        // Apply filtering
        if (!empty($filter)) {
            // If filter contains ":", use "field:value" pattern; otherwise, use default name parameter
            if (strpos($filter, ':') !== false) {
                [$field, $value] = explode(':', $filter, 2);
                $field = trim($field);
                $value = trim($value);

                if ($field !== '' && $value !== '') {
                    $query = $query->where($field, 'like', '%' . $value . '%');
                } else {
                    // Fallback to default behavior if field or value is empty after trimming
                    $query = $query->where($this->getNameParameter(), 'like', '%' . $filter . '%');
                }
            } else {
                $query = $query->where($this->getNameParameter(), 'like', '%' . $filter . '%');
            }
        }

        // Apply dynamic ID filters
        $validated = $validated; // keep reference name
        foreach ($this->getIdFilterFields() as $idField) {
            if (isset($validated[$idField]) && $validated[$idField] !== null && $validated[$idField] !== '') {
                $query = $query->where($idField, '=', $validated[$idField]);
            }
        }

        // Get the total count
        $totaData = $query->count();

        // Apply pagination
        if (!$withoutLimit) {
            $query = $query->skip($page * $limit)->take($limit);
        }
        $paginated = $query->get();

        $return = new \stdClass();
        $return->data = ($this->getTransformerClass())::collection($paginated);
        $return->metadata = new \stdClass();
        $return->metadata->page = $page;
        $return->metadata->limit = $limit;
        $return->metadata->totaData = $totaData;
        $return->metadata->filter = $filter;
        $return->metadata->sorting = $sorting;

        return $return;
    }

    /**
     * Display a listing of the resource.
     *
     * - Requires manager role
     *
     * @return JsonResponse
     */
    public function index(Request $request)
    {
        /** @var \stdClass|JsonResponse $data */
        $data = $this->getData($request);

        if ($data instanceof JsonResponse) {
            return $data;
        }

        // Return transformed and paginated results
        return response()->json($data);
    }

    /**
     * Display a listing of the resource in csv or json.
     *
     *  - Requires manager role
     *
     * @return JsonResponse|StreamedResponse
     */
    public function download(Request $request)
    {
        $rules = [
            // File type (csv or json). Example: json
            'type' => 'string'
        ];

        // Query parameters
        $validator = Validator::make($request->all(), $rules);

        // Check for validation errors and return a custom JSON response if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $validated = $validator->valid();

        /** @var \stdClass|JsonResponse $data */
        $data = $this->getData($request, true);

        if ($data instanceof JsonResponse) {
            return $data;
        }
        /** @var \stdClass $data */

        if ($validated['type'] == 'csv') {
            $instance = new \stdClass();
            if (!empty($data->data)) {
                $instance = $data->data->first();
            }
            $arrayRepresentation = $instance->toArray($request);
            $headers = array_keys($arrayRepresentation);

            // Return transformed and paginated results
            return response()->streamDownload(function () use ($data, $headers, $request) {
                $output = fopen('php://output', 'w');
                fputcsv($output, $headers);

                foreach ($data->data as $row) {
                    $dataRow = $row->toArray($request);
                    array_walk($dataRow, function(&$value) {
                        if (is_array($value) || is_object($value)) {
                            $value = json_encode($value);
                        }

                        $value = str_replace(['"',','], ['\\"','*-*'], $value);
                    });
                    fputcsv($output, $dataRow);
                }

                fclose($output);
            }, 'list-' . str_replace(['/','\\'], '_', strtolower($this->getModelName())) . '.csv');
        }
        //elseif ($validated['type'] == 'json') {

        return response()->json($data->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     *  - Requires manager role
     *
     * @return JsonResponse
     * @throws
     */
    public function store()
    {
        try {
            $modelClass = $this->getModelClass();
            $transformerClass = $this->getTransformerClass();
            /** @var BaseDomain $model */
            $model = new $modelClass();

            // Query parameters
            $validator = Validator::make(request()->all(), $model->getValidationContext());

            if ($validator->fails()) {
                throw ValidationException::withMessages($validator->errors()->toArray());
            }

            $model = new $modelClass(request()->all());
            $model->save();
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }

        return response()->json(new $transformerClass($model));
    }

    /**
     * Display the specified resource.
     *
     *  - Requires manager role
     *
     * @param  string  $account
     * @param  int  $id
     * @return JsonResponse
     */
    public function show($account, $id)
    {
        try {
            $transformerClass = $this->getTransformerClass();
            $model = ($this->getModelClass())::findOrFail($id);
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }

        return response()->json(new $transformerClass($model));
    }

    /**
     * Update the specified resource in storage.
     *
     *  - Requires manager role
     *
     * @param  string  $account
     * @param  int  $id
     * @return JsonResponse
     * @throws
     */
    public function update($account, $id)
    {
        try {
            $transformerClass = $this->getTransformerClass();

            /** @var BaseDomain $model */
            $model = ($this->getModelClass())::findOrFail($id);

            // Query parameters
            $validator = Validator::make(request()->all(), $model->getValidationContext());

            if ($validator->fails()) {
                throw ValidationException::withMessages($validator->errors()->toArray());
            }

            $model->update(request()->all());
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }

        return response()->json(new $transformerClass($model));
    }

    /**
     * Remove the specified resource from storage.
     *
     *  - Requires manager role
     *
     * @param  string  $account
     * @return JsonResponse
     */
    public function destroy($account, Request $request)
    {
        $id = $request->route('id') ?? $request->input('id') ?? $request->query('id');

        try {
            if (!is_array($id)) {
                $id = [$id];
            }
            $response = [];
            foreach ($id as $idValue) {
                /** @var BaseDomain $model */
                $model = ($this->getModelClass())::findOrFail($idValue);

                $response[] = $model->remove();
            }
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }

        return response()->json($response);
    }

    abstract protected function getModelName(): string;

    protected function getModelClass(): string
    {
        $modelName = $this->getModelName();
        $lastModelName = explode('\\', $modelName);
        $lastModelName = array_pop($lastModelName);

        return '\\App\\Modules\\' . $modelName . '\\Domain\\' . $lastModelName;
    }

    protected function getTransformerClass(): string
    {
        $modelName = $this->getModelName();
        $lastModelName = explode('\\', $modelName);
        $lastModelName = array_pop($lastModelName);

        return '\\App\\Modules\\' . $modelName . '\\Transformers\\' . $lastModelName;
    }

    /**
     * Upload a CSV file for bulk processing
     *
     *  - Requires manager role
     *
     * @param string $account
     * @bodyParam file
     * @bodyParam header_mapping
     * @return JsonResponse
     */
    public function upload($account)
    {
        try {
            $request = request();

            // Query parameters
            $validator = Validator::make($request->all(), [
                // File. Max 1MB
                'file' => 'required|file|mimes:csv,txt|max:1024', // Max 1MB
                // Array of headers mapping resource fields
                'header_mapping' => 'required',
            ]);

            if ($validator->fails()) {
                throw ValidationException::withMessages($validator->errors()->toArray());
            }

            $file = $request->file('file');
            $headerMapping = $request->input('header_mapping');

            // Get model name for the resource
            $modelName = $this->getModelName();
            $modelClassName = $this->getModelClass();
            $resourceNameToUploadDir = str_replace('\\', '_', $modelName);
            $resourceName = str_replace('\\', '_', $modelClassName);

            // Create upload directory if it doesn't exist
            $uploadDir = 'uploads/' . $account . '/' . $resourceNameToUploadDir;
            if (!Storage::exists($uploadDir)) {
                Storage::makeDirectory($uploadDir);
            }

            // Generate unique filename
            $filename = time() . '_' . $file->getClientOriginalName();
            $filePath = $uploadDir . '/' . $filename;

            // Store file
            Storage::putFileAs($uploadDir, $file, $filename);

            // Count total rows in CSV (excluding header)
            $totalRows = 0;
            if (($handle = fopen(Storage::path($filePath), 'r')) !== false) {
                // Skip header row
                fgetcsv($handle);

                while (fgetcsv($handle) !== false) {
                    $totalRows++;
                }
                fclose($handle);
            }

            // Create bulk upload record
            $bulkUpload = new BulkUpload();
            $bulkUpload->account = $account;
            $bulkUpload->resource_name = $resourceName;
            $bulkUpload->file_path = $filePath;
            $bulkUpload->original_filename = $file->getClientOriginalName();
            $bulkUpload->header_mapping = $headerMapping;
            $bulkUpload->status = 'pending';
            $bulkUpload->total_rows = $totalRows;
            $bulkUpload->save();

            return response()->json([
                'message' => 'File uploaded successfully and queued for processing',
                'upload_id' => $bulkUpload->id,
                'total_rows' => $totalRows,
            ]);

        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }
    }

    /**
     * Get the status of a bulk upload
     *
     *  - Requires manager role
     *
     * @param string $account
     * @return JsonResponse
     */
    public function uploadStatus($account)
    {
        try {
            // Get model name for the resource
            $modelClassName = $this->getModelClass();
            $resourceName = str_replace('\\', '_', $modelClassName);

            $bulkUploads = BulkUpload::where('account', $account)
                ->where(function ($query) {
                    $query->where('status', 'pending')
                        ->orWhere('status', 'processing');
                })
                ->where('resource_name', $resourceName)
                ->get();

            return response()->json(\App\Modules\Base\Transformers\BulkUpload::collection($bulkUploads));
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }
    }

    /**
     * Delete a bulk upload
     *
     *  - Requires manager role
     *
     * @param string $account
     * @param int $id
     * @return JsonResponse
     */
    public function deleteUpload($account, $id)
    {
        try {
            $bulkUpload = BulkUpload::where('account', $account)
                ->where('id', $id)
                ->firstOrFail();

            // Delete the file if it exists
            if (Storage::exists($bulkUpload->file_path)) {
                Storage::delete($bulkUpload->file_path);
            }

            // Delete the record
            $bulkUpload->delete();

            return response()->json([
                'message' => 'Bulk upload deleted successfully'
            ]);

        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }
    }

    /**
     * List the fields of the domain model
     *
     *  - Requires manager role
     *
     * @param string $account
     * @return JsonResponse
     */
    public function fields($account)
    {
        try {
            $modelClass = $this->getModelClass();
            $model = new $modelClass();

            // Get table columns using Schema
            $table = $model->getTable();
            $columns = \Schema::getColumnListing($table);

            $fields = [];
            foreach ($columns as $column) {
                $type = \Schema::getColumnType($table, $column);
                $fields[$column] = [
                    'name' => $column,
                    'type' => $type
                ];
            }

            // Add fillable property if defined
            if (property_exists($model, 'fillable') && is_array($model->fillable)) {
                foreach ($model->fillable as $fillable) {
                    if (isset($fields[$fillable])) {
                        $fields[$fillable]['fillable'] = true;
                    }
                }
            }

            return response()->json([
                'model' => class_basename($modelClass),
                'table' => $table,
                'fields' => $fields
            ]);

        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }
    }

    /**
     * Retrieve multiple resources by IDs with optional field selection.
     *
     * Request parameters supported:
     * - id or ids: single ID, comma-separated IDs, or array of IDs
     * - fields: comma-separated list of fields to include in the response
     *
     * Returns items in the same order as the provided IDs. Unknown IDs are ignored.
     * Fields not present in the resource transformer output are ignored.
     */
    public function getByIds(Request $request)
    {
        try {
            // Accept both 'id' and 'ids' from route, body, or query
            $idsParam = $request->route('id') ?? $request->input('ids') ?? $request->input('id') ?? $request->query('ids') ?? $request->query('id');

            if ($idsParam === null || $idsParam === '') {
                return response()->json(['message' => 'The ids parameter is required'], 400);
            }

            // Normalize IDs into an array of integers
            if (is_string($idsParam)) {
                $ids = array_filter(array_map('trim', explode(',', $idsParam)), function ($v) {
                    return $v !== '';
                });
            } elseif (is_array($idsParam)) {
                $ids = $idsParam;
            } else {
                $ids = [$idsParam];
            }

            $ids = array_values(array_unique(array_map(function ($v) {
                return (int) $v;
            }, $ids)));

            if (empty($ids)) {
                return response()->json([]);
            }

            // Optional fields parameter
            $fieldsParam = $request->input('fields') ?? $request->query('fields');
            $requestedFields = null;
            if (is_string($fieldsParam) && trim($fieldsParam) !== '') {
                $requestedFields = array_values(
                    array_unique(
                        array_filter(
                            array_map('trim', explode(',', $fieldsParam))
                        )
                    )
                );
            } elseif (is_array($fieldsParam)) {
                $requestedFields = array_values(
                    array_unique(
                        array_filter(
                            array_map('trim', $fieldsParam)
                        )
                    )
                );
            }

            // Fetch models
            $modelClass = $this->getModelClass();
            $models = $modelClass::whereIn('id', $ids)->get();

            // Index models by ID for order preservation
            $modelsById = [];
            foreach ($models as $m) {
                $modelsById[$m->id] = $m;
            }

            $transformerClass = $this->getTransformerClass();
            $response = [];

            foreach ($ids as $wantedId) {
                if (!isset($modelsById[$wantedId])) {
                    continue; // skip missing IDs
                }
                $resource = new $transformerClass($modelsById[$wantedId]);
                $data = $resource->toArray($request);

                if (is_array($requestedFields) && !empty($requestedFields)) {
                    // Filter to requested fields that exist in transformer output
                    $data = array_intersect_key($data, array_flip($requestedFields));
                }

                $response[] = $data;
            }

            return response()->json($response);
        } catch (\Throwable $th) {
            return $this->formatExceptionError($th);
        }
    }
}
