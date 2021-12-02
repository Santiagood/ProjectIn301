<?php

namespace App\Http\Livewire;

use App\Models\NavigationMenu;
use Livewire\Component;
use Livewire\WithPagination;
use App\Exports\NavigationMenusExport;
use Maatwebsite\Excel\Facades\Excel;

class NavigationMenus extends Component
{
    use WithPagination;

    public $modalFormVisible;
    public $modalConfirmDeleteVisible;

    public $search;
    public $modelId;
    public $label;
    public $slug;
    public $sequence = 1;
    public $type = 'SidebarNav';




    /**
     * The validation rules
     *
     * @return void
     */
    public function rules() {
        return [
            'label' => 'required',
            'slug' => 'required',
            'sequence' => 'required',
            'type' => 'required',
        ];
    }

    public function exportExcel()
    {
        return Excel::download(new NavigationMenusExport, 'navigation.xlsx');
    }

    public function exportPDF()
    {
        return Excel::download(new NavigationMenusExport, 'navigation.xlsx');
    }


    /**
     * the create function
     *
     * @return void
     */
    public function create() {
        $this-> validate();
        NavigationMenu::create($this->modelData());
        $this->reset();
        $this->modalFormVisible = false;
    }


    /**
     * Shows the delete confirmation modal
     *
     * @param  mixed $id
     * @return void
     */
    public function deleteShowModal($id) {
        $this -> modelId = $id;
        $this -> modalConfirmDeleteVisible = true;

    }

    public function delete() {
        NavigationMenu::destroy($this->modelId);
        $this->modalConfirmDeleteVisible = false;
        $this->resetPage();
    }

    /**
     * Show the create modal
     *
     * @return void
     */


    /**
     * NOTE: The read function
     *
     * @return void
     */
    public function read($search) {

        if(empty($search)) {
            return NavigationMenu::paginate(5);
        }
        else {
            return NavigationMenu::where('type', 'LIKE', '%' . $search . '%')->paginate(5);
        }
    }

    /**
     * createShowModal shows the create modal
     *
     * @return void
     */
    public function createShowModal() {
        $this->resetValidation();
        $this->reset();
        $this->modalFormVisible = true;
    }


    /**
     * Shows the form modal in update mode
     *
     * @param  mixed $id
     * @return void
     */
    public function updateShowModal($id) {
        $this->resetValidation();
        $this->reset();
        $this->modalFormVisible = true;
        $this->modelId = $id;
        $this->loadModel();
    }


    /**
     * Loads the model data of this
     * component
     * @return void
     */
    public function loadModel() {
        $data = NavigationMenu::find($this->modelId);
        $this->label = $data->label;
        $this->slug = $data->slug;
        $this->type = $data->type;
        $this->sequence = $data->sequence;
    }

    /**
     * The update function
     *
     * @return void
     */
    public function update() {
        $this -> validate();
        NavigationMenu::find($this->modelId)->update($this->modelData());
        $this -> modalFormVisible = false;
    }

    /**
     * The data for the model, mapped in this component
     *
     * @return void
     */
    public function modelData() {
        return [
            'label' => $this->label,
            'slug' => $this->slug,
            'sequence' => $this->sequence,
            'type' => $this->type
        ];
    }


    public function render()
    {
        return view('livewire.navigation-menus',[
            'data' => $this -> read($this->search),
        ]);
    }
}
