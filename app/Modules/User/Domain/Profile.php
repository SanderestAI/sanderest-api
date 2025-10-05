<?php

namespace App\Modules\User\Domain;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    const VALIDATION_COTNEXT = [
    ];

    protected $fillable = [
        'user_id',
        'description',
        'details',
        'avatar',
        'referred_code',
        'referred_code_from',
    ];

    // RELATIONS

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // GETTERS

    public function getValidationContext(): array
    {
        return self::VALIDATION_COTNEXT;
    }

    public function getIcon(): string
    {
        return 'user';
    }

    // Others

    public function remove(): bool
    {
        return $this->delete();
    }
}
