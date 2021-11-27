<?php

namespace App\Http\Livewire;

use App\Models\Page;
use Livewire\Component;
use Illuminate\Support\Facades\DB;

class Frontpage extends Component
{
    public $title;
    public $content;
    public $dateUpdated;

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
        $this->dateUpdated = $data->updated_at;

    }

    /**
     * Get all the sidebar links
     *
     * @return void
     */
    private function sideBarLinks() {
        return DB::table('navigation_menus')
        ->where('type', '=', 'SidebarNav')
        ->orderBy('sequence', 'asc')
        ->orderBy('created_at', 'asc')
        ->get();
    }

    /**
     * Get all the top nav links
     *
     * @return void
     */
    private function topNavLinks() {
        return DB::table('navigation_menus')
        ->where('type', '=', 'TopNav')
        ->orderBy('sequence', 'asc')
        ->orderBy('created_at', 'asc')
        ->get();
    }

    private function BlogsLinks() {
        return DB::table('pages')
        ->where('slug', '!=', 'home')
        ->Where('slug', '!=', 'about-us')
        ->Where('slug', '!=', 'error-404')
        ->Where('slug', '!=', 'contact-us')
        ->Where('slug', '!=', 'announcements')
        ->orderBy('updated_at', 'desc')
        ->latest()
        ->get();
    }

    /**
     * The livewire render function
     *
     * @return void
     */
    public function render()
    {
        return view('livewire.frontpage',[
            'sideBarLinks' => $this -> sideBarLinks(),
            'topNavLinks'  => $this -> topNavLinks(),
            'BlogsLinks'   => $this ->BlogsLinks(),
        ])->layout('layouts.frontpage');
    }
}
