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
    public function mount($urlslug = null){
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

        // NOTE: Get home page if the slug is empty
        if (empty($urlslug)) {
            $data = Page::where('is_default_home', true)->first();
        }

        else {
            // NOTE: Get the page according to the slug value
            $data = Page::where('slug', $urlslug)->first();

            // NOTE: If we can't retrieve anything in the database,
            // let's get the dafault 404 not found page
            if (!$data) {
                $data = Page::where('is_default_not_found', true)->first();
            }
        }

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
