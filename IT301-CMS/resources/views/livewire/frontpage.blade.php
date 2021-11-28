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
                @foreach ($topNavLinks as $item)
                    <a href="{{ url('/'. $item->slug) }}">
                        <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                    </a>
                @endforeach
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
                    @foreach ($topNavLinks as $item)
                        <a href="{{ url('/'. $item->slug) }}">
                            <li class="cursor-pointer px-4 py-2 hover:bg-gray-800">{{ $item->label }}</li>
                        </a>
                    @endforeach
                </ul>
            </div>
        </aside>
        <main class="bg-gray-100 p-10 min-h-screen sm:w-8/12 md:w-9/12 lg:w-10/12">
            <section class="divide-y text-gray-900">

                @if (Request::is('home'))
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
                    <h1 class="text-3xl font-bold">{{ $title }}</h1>
                    <article>
                        <div class="mt-5 text-sm">
                            <p class="text-lg font-bold">{{ $content }}</p>
                        </div>
                    </article>

                @elseif (Request::is('announcements'))
                    <article>
                    <div class="grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                        @if ($BlogsLinks->count())
                            @foreach ($BlogsLinks as $item)
                                <div class="bg-white p-6 m-2 shadow-md border border-gray-200 rounded-lg max-w-full ">
                                    <div class="flex flex-col justify-left mb-2 text-sm">
                                        {{ $item->updated_at }}
                                    </div>
                                    <h5 class="text-gray-900 font-bold text-2xl tracking-tight mb-2">{{ $item->title }}</h5>
                                    {{-- <p class=" font-normal text-gray-700 mb-3">
                                        {!! $item->content !!}
                                        {!! Str::limit($item->content, 60, '...') !!}
                                    </p> --}}
                                    <a href="{{ url('/'.$item->slug ) }}" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-3 py-2 mt-2 text-center inline-flex items-center">
                                        Read more
                                        <svg class="-mr-1 ml-2 h-4 w-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                    </a>
                                </div>
                            @endforeach
                        @endif
                    </div>
                    </article>

                @elseif ($url == 'home')
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

                @else
                    <article>
                        <section class="text-blueGray-700 bg-white m-2 rounded-2xl shadow-2xl">
                            <div class=" container flex flex-col items-center px-4 py-4 mx-auto md:flex-row lg:px-28 rounded-md">
                                <div class="flex flex-col items-start my-5 text-left lg:flex-grow md:w-1/2 md:mb-0">
                                    <div class="flex pb-0 flex-col justify-center mb-4 lg:flex-row">
                                        {{ $dateUpdated }}
                                    </div>
                                    <h1 class="mb-8 text-2xl font-black tracking-tighter text-black md:text-5xl title-font"> {{ $title }} </h1>
                                    <div class="mb-8 leading-relaxed text-xl text-left text-blueGray-600 ">{!! $content !!}</div>
                                </div>
                            </div>
                        </section>
                    </article>
                @endif
            </section>
        </main>
    </div>
</div>


