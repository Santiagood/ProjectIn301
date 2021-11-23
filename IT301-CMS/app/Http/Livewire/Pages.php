<?php

namespace App\Http\Livewire;

use App\Models\Page;
use Illuminate\Validation\Rule;
use Livewire\Component;
use Livewire\WithPagination;
use Livewire\resetPage;
use Illuminate\Support\Str;

use function Livewire\str;

class Pages extends Component
{

    use WithPagination;
    // NOTE: this are the variables that we can assign are values in using
    // the wire:model
    public $modalFormVisible = false;
    public $modalConfirmDeleteVisible = false;
    public $modelId;
    public $slug;
    public $title;
    public $content;
    public $isSetToDefaultHomePage;
    public $isSetToDefaultNotFoundPage;

    /**
     * The validation rules
     *
     * @return void
     */
    public function rules() {
        return [
            'title' => 'required',
            'slug' => ['required', Rule::unique('pages', 'slug')->ignore($this->modelId)],
            'content' => 'required',
        ];
    }

    public function mount() {
        $this -> resetPage();
    }

    public function updatedIsSetToDefaultHomePage() {
        $this->isSetToDefaultNotFoundPage = null;
    }

    public function updatedIsSetToDefaultNotFoundPage() {
        $this->isSetToDefaultHomePage = null;
    }



    /**
     *
     * NOTE: this function will be executed in the pages.blade.php in livewire folder.
     * shows the form modal of create function.
     * @return void
     */
    public function createShowModal() {
        $this ->resetValidation();
        $this -> reset();
        $this -> modalFormVisible = true;
    }

    /**
     * updateShowModal will show the form modal
     * in update mode.
     *
     * @param  mixed $id
     * @return void
     */
    public function updateShowModal($id) {
        $this -> resetValidation();
        $this -> reset();
        $this -> modelId = $id;
        $this ->modalFormVisible = true;
        $this -> loadModel();
    }

    /**
     * NOTE: load model is the same as retrieving the data
     * from the database using select
     *
     * @return void
     */
    public function loadModel() {
        $data = Page::find($this -> modelId);
        $this->title = $data->title;
        $this->slug = $data->slug;
        $this->content = $data->content;
        $this->isSetToDefaultHomePage = !$data->is_default_home ? null:true;
        $this->isSetToDefaultNotFoundPage = !$data->is_default_not_found ? null:true;
    }

    /**
     * shows the delete confirmation modal
     *
     *
     * @param  mixed $id
     * @return void
     */
    public function deleteShowModal($id) {
        $this -> modelId = $id;
        $this -> modalConfirmDeleteVisible = true;
        $this -> resetPage();
    }


    /**
     * The data for the model mapped
     * in this component
     *
     * @return void
     */
    public function modelData() {
        return [
            'title' => $this -> title,
            'content' => $this -> content,
            'slug' => $this -> slug,
            'is_default_home' => $this -> isSetToDefaultHomePage,
            'is_default_not_found' => $this -> isSetToDefaultNotFoundPage,
        ];
    }

    /**
     * The create function
     *
     * @return void
     */
    public function create() {
        $this -> validate();
        $this -> unassignDefaultHomePage();
        $this -> unassignDefaultNotFoundPage();
        Page::create($this -> modelData());
        $this -> modalFormVisible = false;
        $this -> reset();
    }

    /**
     * The read function
     *
     * @return void
     */
    public function read() {
        return Page::paginate(5);
    }

    /**
     * update the data of the information in database
     * according to its modelId
     *
     * @return void
     */
    public function update() {
        $this -> validate();
        $this -> unassignDefaultHomePage();
        $this -> unassignDefaultNotFoundPage();
        Page::find($this->modelId)->update($this->modelData());
        $this -> modalFormVisible = false;

    }

    /**
     * deletes the page record in the
     * database according to its modelId
     *
     * @return void
     */
    public function delete() {
        Page::destroy($this -> modelId);
        $this -> modalConfirmDeleteVisible = false;
    }



    /**
     * updatedTitle will change your slug value
     *  depending on the value of your title
     * @param  mixed $value
     * @return void
     */
    public function updatedTitle($value) {
        $this->slug = Str::slug($value);
    }


    /**
     * unassign the default home page in the database table
     *
     * @return void
     */
    private function unassignDefaultHomePage() {
        if ($this->isSetToDefaultHomePage != null) {
            Page::where('is_default_home', true)->update([
                'is_default_home' => false,
            ]);
        }
    }

    /**
     * unassign the Default Not Found Page in the database table
     *
     * @return void
     */
    private function unassignDefaultNotFoundPage() {
        if ($this->isSetToDefaultNotFoundPage != null) {
            Page::where('is_default_not_found', true)->update([
                'is_default_not_found' => false,
            ]);
        }
    }


    /**
     * The livewire render function
     *
     * @return void
     */
    public function render()
    {
        return view('livewire.pages',[
            'data' => $this -> read()
        ]);
    }
}
