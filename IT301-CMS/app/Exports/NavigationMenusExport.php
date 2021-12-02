<?php

namespace App\Exports;

use App\Models\NavigationMenu;
use Maatwebsite\Excel\Concerns\FromCollection;

class NavigationMenusExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return NavigationMenu::all();
    }
}
