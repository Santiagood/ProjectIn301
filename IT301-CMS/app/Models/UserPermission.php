<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPermission extends Model
{
    use HasFactory;
    protected $fillable = [
        'role',
        'route_name',
    ];

    /**
     * The list of routes when authenticated
     *
     * @return void
     */
    public static function routeNameList() {
        return [
            'dashboard',
            'pages',
            'navigation-menus',
            'users',
            'user-permissions',
        ];
    }

    /**
     * Check if the current user has acccess to a specific route
     *
     * @param  mixed $userRole
     * @param  mixed $routeName
     * @return void
     */
    public static function isRoleHasRightToAccess($userRole, $routeName) {
        try {
            $model = static::where('role', $userRole)
            ->where('route_name', $routeName)
            ->first();

            return $model ? true : false;

        } catch (\Throwable $th) {
            return false;
        }
    }
}
