<?php

namespace App\Modules\User\Transformers;

use App\Modules\Base\Transformers\BaseTransformer;
use App\Modules\Event\Transformers\Event;
use App\Modules\User\Domain\AccountSetting;
use App\Modules\User\Domain\User as UserModel;

class User extends BaseTransformer
{

    /**
     * The resource instance.
     *
     * @var mixed|UserModel
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
        $accountSettings = AccountSetting::all()->first();
        $pgbs_used = 10;
        $pgbs_total = 10;
        if ($accountSettings) {
            $pgbs_used = $accountSettings->page_builder_sessions_used;
            $pgbs_total = $accountSettings->page_builder_sessions_total;
        }

        return [
            $this->merge(parent::toArray($request)),
            'own_events' => Event::collection($this->ownEvents),
            'assigned_events' => Event::collection($this->assignedEvents),
            'eth_wallet' => $this->eth_wallet,
            'ip' => $this->ip,
            'email' => $this->email,
            'name' => $this->name,
            'page_builder_sessions_used' => $pgbs_used,
            'page_builder_sessions_total' => $pgbs_total,
        ];
    }
}
