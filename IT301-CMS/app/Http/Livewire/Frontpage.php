<?php

namespace App\Http\Livewire;

use App\Models\Page;
use Livewire\Component;

class Frontpage extends Component
{
    public $title;
    public $content;

    /**
     * the livewire mount function
     *
     * @param  mixed $urlslug
     * @return void
     */
    public function mount($urlslug){
        $this->retrieveContent($urlslug);
    }

    /**
     * this is the same as select where you
     * use the id to retrieve a very specific
     * record
     *
     * @param  mixed $urlslug
     * @return void
     */
    public function retrieveContent($urlslug) {
        $data = Page::where('slug', $urlslug)->first();
        $this->title = $data->title;
        $this->content = $data->content;
    }

    /**
     * The livewire render function
     *
     * @return void
     */
    public function render()
    {
        return view('livewire.frontpage')->layout('layouts.frontpage');
    }
}
