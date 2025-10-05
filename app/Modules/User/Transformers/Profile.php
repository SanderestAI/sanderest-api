<?php

namespace App\Modules\User\Transformers;

use App\Modules\Base\Transformers\BaseTransformer;
use App\Modules\User\Domain\Profile as ProfileModel;

class Profile extends BaseTransformer
{

    /**
     * The resource instance.
     *
     * @var mixed|ProfileModel
     */
    public $resource;

    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {

        return array_merge(parent::toArray($request), [
            'description' => $this->description,
            'details' => $this->details,
            'avatar' => $this->avatar,
            'referred_code' => $this->referred_code,
            'referred_code_from' => $this->referred_code_from,
        ]);
    }
}
