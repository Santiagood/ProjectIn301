<div class="divide-y divide-gray-800" x-data="{show: false}">
    <nav class="bg-gray-900 px-3 py-2 flex items-center shadow-lg">
        <div>
            <button @click="show =! show" class="block h-8 mr-3 text-gray-400 items-center hover:text-gray-200
            focus:text-gray-200 focus:outline-none sm:hidden">
                <svg class="w-8 fill-current" viewBox="0 0 24 24">
                    <path x-show="!show"fill-rule="evenodd" d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"/>
                    <path x-show="show" fill-rule="evenodd" d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"/>
                </svg>
            </button>
        </div>
        <div class="h-12 w-full bg-gray-900 flex item-center">
            <a href="{{ url('/') }}" class="w-full">
                <img class="h-full" src="{{ url('/images/logo.png') }}"/>
            </a>
        </div>
        <div class="flex justify-end sm:w-8/12">
            {{-- Top navigation --}}
            <ul class="hidden sm:flex sm:text-left text-gray-200 text-xs">
                @if ($currentUser)
                    <a href="{{ url('/dashboard') }}">
                        <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $currentUser }}</li>
                    </a>
                    @foreach ($topNavLinksForActiveUser as $item)
                        <a href="{{ url('/'. $item->slug) }}">
                            <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                        </a>
                    @endforeach
                @else
                    @foreach ($topNavLinks as $item)
                        <a href="{{ url('/'. $item->slug) }}">
                            <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                        </a>
                    @endforeach
                @endif
                {{-- <a href="{{ url('/login') }}"><li class="cursor-pointer px-4 py-2 hover:underline">Login</li></a> --}}
            </ul>
        </div>
    </nav>
    <div class="sm:flex sm:min-h-screen">
        <aside class="bg-gray-900 text-gray-700 divide-y divide-gray-700 divide-dashed sm:w-4/12 md:w-3/12 lg:w-2/12">
            {{-- Desktop web view --}}
            <ul class="hidden sm:block text-gray-200 text-xs sm:text-left">
                @foreach ($sideBarLinks as $item)
                    <a href="{{ url('/'. $item->slug) }}">
                        <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                    </a>
                @endforeach
            </ul>
            {{-- Mobile web view --}}
            <div :class="show ? 'block' : 'hidden'" class="pb-3 divide-y divide-gray-800 block sm:hidden">
                <ul class="text-gray-200 text-xs">
                    @foreach ($sideBarLinks as $item)
                        <a href="{{ url('/'. $item->slug) }}">
                            <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                        </a>
                    @endforeach
                </ul>
                {{-- Top Nav Mobile web view --}}
                <ul class="text-gray-200 text-xs">
                    {{-- <a href="{{ url('/login') }}"><li class="cursor-pointer px-4 py-2 hover:bg-gray-800">Login</li></a> --}}
                    @if ($currentUser)
                        <a href="{{ url('/dashboard') }}">
                            <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $currentUser }}</li>
                        </a>
                        @foreach ($topNavLinksForActiveUser as $item)
                            <a href="{{ url('/'. $item->slug) }}">
                                <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                            </a>
                        @endforeach
                    @else
                        @foreach ($topNavLinks as $item)
                            <a href="{{ url('/'. $item->slug) }}">
                                <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                            </a>
                        @endforeach
                    @endif
                </ul>
            </div>
        </aside>
        <main class="bg-gray-100 p-10 min-h-screen sm:w-8/12 md:w-9/12 lg:w-10/12">
                @if (Request::is('home'))
                    <section class="divide-y text-gray-900">
                        <div class="flex bg-gray-100" style="height:500px;">
                            <div class="flex items-center text-center lg:text-left px-8 md:px-12 lg:w-1/2">
                                <div>
                                    <h2 class="text-3xl font-semibold text-gray-800 md:text-4xl">Welcome to  <span class="text-yellow-400"> BITS </span>Announcement Portal</h2>
                                    <p class="mt-2 text-sm text-gray-500 md:text-base">{{ $content }}</p>
                                    <div class="flex justify-center lg:justify-start mt-6">
                                        <a class="px-4 py-3 bg-gray-900 text-gray-200 text-xs font-semibold rounded hover:bg-gray-800" href="https://www.facebook.com/bits.wccqc">Follow Us on Facebook</a>
                                    </div>
                                </div>
                            </div>
                            <div class="hidden lg:block lg:w-1/2" style="clip-path:polygon(10% 0, 100% 0%, 100% 100%, 0 100%)">
                                <div class="h-full object-cover" style="background-image: url(https://image.freepik.com/free-vector/boy-student-sitting-stack-books-with-laptop-flat-icon-illustration_1284-64037.jpg)">
                                    <div class="h-full bg-black opacity-10"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                        {{-- Request::is('about-us') --}}
                @elseif ($url == 'about-us')
                    <section class="text-blueGray-700 bg-white m-2 rounded-2xl shadow-2xl">
                        <div class="container flex flex-col items-center px-5 py-12 mx-auto md:flex-row lg:px-28 rounde">
                            <div class="flex flex-col items-start mb-16 text-left lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 md:mb-0">
                                <h1 class="mb-8 text-2xl font-black tracking-tighter text-black md:text-5xl title-font"> {{ $title }} </h1>
                                <p class="mb-8 text-base leading-relaxed text-left text-blueGray-600 ">{{ $content }}</p>
                                <div class="flex flex-col justify-center lg:flex-row">
                                    <p class="mt-2 text-sm text-left text-blueGray-600 md:ml-1 md:mt-0"> Visit our Facebook Group. <br class="hidden lg:block">
                                    <a href="https://www.facebook.com/bits.wccqc" class="inline-flex items-center font-semibold text-blue-600 md:mb-2 lg:mb-0 hover:text-black " title="read more"> Brilliant Information Technology Society » </a>
                                    </p>
                                </div>
                            </div>
                            <div class="w-full lg:w-50 lg:max-w-lg md:w-1/2">
                                <img class="object-cover object-center rounded-lg shadow-2xl" alt="hero" src="{{ url('/images/BITS.jpg') }}">
                            </div>
                        </div>
                    </section>

                    {{-- Request::is('contact-us') --}}
                @elseif ($url == 'contact-us')
                    {{-- <h1 class="text-3xl font-bold">{{ $title }}</h1>
                    <article>
                        <div class="mt-5 text-sm">
                            <p class="text-lg font-bold">{{ $content }}</p>
                        </div>
                    </article> --}}
                    <section>
                        <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
                            <div class="mt-8 overflow-hidden">
                                <div class="grid grid-cols-1 md:grid-cols-2">
                                    <div class="p-6 mr-2 bg-gray-100 dark:bg-gray-800 sm:rounded-lg">
                                        <h1 class="text-4xl sm:text-5xl text-black dark:text-white font-extrabold tracking-tight mb-5">
                                            Contact Us
                                        </h1>
                                        <p class="text-normal text-lg sm:text-2xl font-medium text-gray-600 dark:text-gray-400 mt-2">
                                            {!! $content !!}
                                        </p>

                                        <div class="flex items-center mt-8 text-gray-600 dark:text-gray-400">
                                            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                            </svg>
                                            <div class="ml-4 text-md tracking-wide font-semibold w-40">
                                                960 Aurora Blvd, Project 4, Quezon City, Metro Manila
                                            </div>
                                        </div>

                                        <div class="flex items-center mt-4 text-gray-600 dark:text-gray-400">
                                            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                                            </svg>
                                            <div class="ml-4 text-md tracking-wide font-semibold w-40">
                                                09123456789
                                            </div>
                                        </div>

                                        <div class="flex items-center mt-2 text-gray-600 dark:text-gray-400">
                                            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                                            </svg>
                                            <div class="ml-4 text-md tracking-wide font-semibold w-40">
                                                BITS@bits.org
                                            </div>
                                        </div>
                                    </div>

                                    <form action="https://api.web3forms.com/submit" method="POST" class="p-6 flex flex-col justify-center">
                                        <input type="hidden" name="apikey" value="f69d55fa-ccdc-42bf-a36d-b90506d8b0a3">
                                        <div class="flex flex-col">
                                            <label for="name" class="hidden">Full Name</label>
                                            <input type="name" name="name" id="name" placeholder="Full Name" class="w-100 mt-2 py-3 px-3 rounded-lg bg-white dark:bg-gray-800 border border-gray-400 dark:border-gray-700 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none" required>
                                        </div>

                                        <div class="flex flex-col mt-2">
                                            <label for="email" class="hidden">Email</label>
                                            <input type="email" name="email" id="email" placeholder="Email" class="w-100 mt-2 py-3 px-3 rounded-lg bg-white dark:bg-gray-800 border border-gray-400 dark:border-gray-700 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none" required>
                                        </div>

                                        <div class="flex flex-col mt-2">
                                            <label for="message" class="hidden">Message Us</label>
                                            <textarea name="message" id="message" placeholder="Message Us" class="w-100 mt-2 py-3 px-3 rounded-lg bg-white dark:bg-gray-800 border border-gray-400 dark:border-gray-700 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none" required></textarea>
                                        </div>

                                        <input type="hidden" name="redirect" value="https://web3forms.com/success">

                                        <button type="submit" class="md:w-32 bg-indigo-600 hover:bg-blue-dark text-white font-bold py-3 px-6 rounded-lg mt-3 hover:bg-indigo-500 transition ease-in-out duration-300">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>

                @elseif (Request::is('announcements'))
                    <article>
                        {{-- <div class="grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1"> --}}
                            @if ($BlogsLinks->count())
                            <section class="mt-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 sm:grid-cols-1 gap-x-6 gap-y-8">
                                @foreach ($BlogsLinks as $item)
                                    {{-- <div class="bg-white p-6 m-2 shadow-md border border-gray-200 rounded-lg max-w-full hover:bg-gray-100">
                                        <div class="flex flex-col justify-left mb-2 text-sm">
                                            {{ $item->updated_at }}
                                        </div>
                                        <div>
                                            <h5 class="text-gray-900 font-bold text-2xl tracking-tight mb-2">{{ $item->title }}</h5>
                                        </div>
                                        <div>
                                            <p class=" font-normal text-gray-700 mb-3">
                                                {!! $item->content !!}
                                                {!! Str::limit($item->content, 100, '...') !!}
                                            </p>
                                        </div>
                                        <div>
                                            <a href="{{ url('/'.$item->slug ) }}" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-3 py-2 mt-5 text-center inline-flex items-center">
                                                Read more
                                                <svg class="-mr-1 ml-2 h-4 w-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                            </a>
                                        </div>
                                    </div> --}}

                                        <article class="relative w-full h-auto pb-4 bg-cover bg-center group rounded-lg overflow-hidden shadow-lg hover:shadow-2xl  transition duration-300 ease-in-out  text-sm text-left"
                                            style="background-image: url('https://image.freepik.com/free-photo/vintage-crumpled-paper-textured-background_53876-103940.jpg');">
                                            <a href="{{ url('/'.$item->slug ) }}">

                                                <div class="absolute inset-0  group-hover:opacity-75 transition duration-300 ease-in-out"></div>
                                                    <span class="pl-4">{{ $item->updated_at }}</span>
                                                    <h2 class="text-black p-5 font-bold align-text-top">
                                                        {{ $item->title }}
                                                    </h2>
                                                <div class="relative w-full h-auto px-4 sm:px-6 lg:px-4 flex justify-center items-center">
                                                    <p class="text-black text-sm text-left">
                                                        {!! Str::limit($item->content, 200, '...') !!}
                                                    </p>
                                                </div>
                                            </a>
                                        </article>


                                @endforeach
                                </section>
                            @endif
                        {{-- </div> --}}
                    </article>

                @elseif ($url == 'home')
                <section>
                    <div class="flex bg-gray-100" style="height:500px;">
                        <div class="flex items-center text-center lg:text-left px-8 md:px-12 lg:w-1/2">
                            <div>
                                <h2 class="text-3xl font-semibold text-gray-800 md:text-4xl">Welcome to  <span class="text-yellow-400"> BITS </span>Announcement Portal</h2>
                                <p class="mt-2 text-sm text-gray-500 md:text-base">{{ $content }}</p>
                                <div class="flex justify-center lg:justify-start mt-6">
                                    <a class="px-4 py-3 bg-gray-900 text-gray-200 text-xs font-semibold rounded hover:bg-gray-800" href="https://www.facebook.com/bits.wccqc">Follow Us on Facebook</a>
                                </div>
                            </div>
                        </div>
                        <div class="hidden lg:block lg:w-1/2" style="clip-path:polygon(10% 0, 100% 0%, 100% 100%, 0 100%)">
                            <div class="h-full object-cover" style="background-image: url(https://image.freepik.com/free-vector/boy-student-sitting-stack-books-with-laptop-flat-icon-illustration_1284-64037.jpg)">
                                <div class="h-full bg-black opacity-10"></div>
                            </div>
                        </div>
                    </div>
                </section>

                @else
                    <article>
                        <section class="text-blueGray-700 bg-white m-2 rounded-2xl shadow-2xl">
                            <div class=" container flex flex-col items-center px-4 py-4 mx-auto md:flex-row lg:px-28 rounded-md">
                                <div class="flex flex-col items-start my-5 text-left lg:flex-grow md:w-1/2 md:mb-0">
                                    <div class="flex pb-0 flex-col justify-center mb-4 lg:flex-row">
                                        {{ $dateUpdated }}
                                    </div>
                                    <h1 class="mb-8 text-2xl font-black tracking-tighter text-black md:text-5xl title-font"> {{ $title }} </h1>
                                    <div class="mb-8 leading-relaxed text-left text-blueGray-600 lg:text-xl md:text-base sm:text-sm">{!! $content !!}</div>
                                </div>
                            </div>
                        </section>
                    </article>
                @endif
            </section>
        </main>
    </div>
</div>


