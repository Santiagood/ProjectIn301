<?php

namespace App\Exports;

use App\Models\UserPermission;
use Maatwebsite\Excel\Concerns\FromCollection;

class PermissionsExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return UserPermission::all();
    }
}
