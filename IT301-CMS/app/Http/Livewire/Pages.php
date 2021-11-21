<?php

namespace App\Http\Livewire;

use App\Models\Page;
use Illuminate\Validation\Rule;
use Livewire\Component;

use function Livewire\str;

class Pages extends Component
{
    // NOTE: this are the variables that we can assign are values in using
    // the wire:model
    public $modalFormVisible = false;
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
            'slug' => ['required', Rule::unique('pages', 'slug')],
            'content' => 'required',
        ];
    }


    /**
     *
     * NOTE: this function will be executed in the pages.blade.php in livewire folder.
     * shows the form modal of create function.
     * @return void
     */
    public function createShowModal() {
        $this -> modalFormVisible = true;
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
     * resets all the variables
     * to null
     *
     * @return void
     */
    public function resetVars() {
        $this -> title = null;
        $this -> content = null;
        $this -> slug = null;
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
        return view('livewire.pages');
    }
}
