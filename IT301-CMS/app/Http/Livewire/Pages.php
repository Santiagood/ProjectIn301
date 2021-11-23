<?php

namespace App\Http\Livewire;

use App\Models\Page;
use Illuminate\Validation\Rule;
use Livewire\Component;
use Livewire\WithPagination;
use Livewire\resetPage;

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


    /**
     *
     * NOTE: this function will be executed in the pages.blade.php in livewire folder.
     * shows the form modal of create function.
     * @return void
     */
    public function createShowModal() {
        $this ->resetValidation();
        $this -> resetVars();
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
        $this -> resetVars();
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
        ];
    }

    /**
     * The create function
     *
     * @return void
     */
    public function create() {
        $this -> validate();
        Page::create($this -> modelData());
        $this -> modalFormVisible = false;
        $this -> resetVars();
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
     * resets all the variables
     * to null
     *
     * @return void
     */
    public function resetVars() {
        $this -> title = null;
        $this -> content = null;
        $this -> slug = null;
        $this -> modelId = null;
    }

    /**
     * updatedTitle will change your slug value
     *  depending on the value of your title
     * @param  mixed $value
     * @return void
     */
    public function updatedTitle($value) {
        $this -> generateSlug($value);
    }


    /**
     * generateSlug will generate the slug name
     * for us by reading the value then
     * replacing all of the spaces into dashes
     *
     * @param  mixed $value
     * @return void
     */
    private function generateSlug($value) {
        $process1 = str_replace(" ", "-", $value);
        $process2 = strtolower($process1);
        $this -> slug = $process2;
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
