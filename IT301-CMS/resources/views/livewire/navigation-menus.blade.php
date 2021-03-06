<div class="p-6">

    <div class="flex items-center justify-end px-4 pb-4 text-right sm:px-6">
        <x-jet-input id="search" class=" block mt-1 w-full" type="text" wire:model.debounce.800ms="search" placeholder="Search type..." />
        <x-jet-button wire:click="exportExcel('xlsx')" class="ml-2 bg-green-500">
            {{ __('Excel') }}
        </x-jet-button>
        <x-jet-button wire:click="exportPDF('pdf')" class="ml-2 bg-blue-500">
            {{ __('PDF') }}
        </x-jet-button>
        <x-jet-button wire:click="createShowModal" class="ml-2">
            {{ __('Create') }}
        </x-jet-button>
    </div>

    <div class="flex flex-col">
        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                    <table class="items-center text-center min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr>
                                <th class="w-1/4 items-center text-center divide-x-1/4 px-6 py-3 bg-gray-50 text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Type</th>
                                <th class="w-1/4 items-center text-center divide-x-1/4 px-6 py-3 bg-gray-50 text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Sequence</th>
                                <th class="w-1/4 items-center text-center divide-x-1/4 px-6 py-3 bg-gray-50 text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Label</th>
                                <th class="w-1/4 items-center text-center divide-x-1/4 px-6 py-3 bg-gray-50 text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Url</th>
                                <th class="w-1/4 items-center text-center divide-x-1/4 px-6 py-3 bg-gray-50 text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-x items-stretch place-content-evenly divide-gray-200">
                            @if ($data->count())
                                @foreach ($data as $item)
                                <tr>
                                    <td class="px-6 py-2">{{ $item->type }}</td>
                                    <td class="px-6 py-2">{{ $item->sequence }}</td>
                                    <td class="px-6 py-2">{{ $item->label }}</td>
                                    <td class="px-6 py-2">
                                        <a href="{{ url($item->slug) }}" class="text-indigo-600 hover:text-indigo-900" target="_blank">
                                            {{ $item->slug }}
                                        </a>
                                    </td>
                                    <td class="px-6 py-2 flex justify-end">
                                        <x-jet-button class="mx-2" wire:click="updateShowModal({{ $item->id }})">
                                            {{ __('Update') }}
                                        </x-jet-button>
                                        <x-jet-danger-button class="mx-2" wire:click="deleteShowModal({{ $item->id }})">
                                            {{ __('Delete') }}
                                        </x-jet-danger-button>
                                    </td>
                                </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td class="px-6 py-4 text-sm whitespace-no-wrap" colspan="4">No Results Found</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <br/>
                {{-- NOTE: this is the part of the pages control --}}
                {{ $data -> links() }}
            </div>
        </div>
    </div>



    {{-- Modal form --}}
    {{-- NOTE: wire:model="something" is actually connected to the Pages.php
        in Models folder as variable--}}
    <x-jet-dialog-modal wire:model="modalFormVisible">
        <x-slot name="title">
            {{ __('Navigation Menu Item') }}
        </x-slot>

        <x-slot name="content">
            <div class="mt-4">
                <x-jet-label for="label" value={{ __('Label') }} />
                <x-jet-input wire:model="label" id="label" class="block mt-1 w-full" type="text" />
                @error('label')
                    <span class="error">{{ $message }}</span>
                @enderror
            </div>
            <div class="mt-4">
                <x-jet-label for="slug" value="{{ __('Slug') }}" />
                <div class="mt-1 flex rounded-md shadow-sm ">
                    <span class="inline-flex items-center px-3 py-2 rounded-l-md border border-r-0 border-gray-300 bg-gray-50 text-gray-500 text-sm">
                        http://localhost:8000/
                    </span>
                    <input id="slug" wire:model="slug" class="form-input flex-1 px-3 py-2 block w-full rounded-none rounded-r-md transition duration-150 ease-in-out sm:text-sm sm:leading-5" placeholder="url-slug">
                </div>
                @error('slug')
                    <span class="error">{{ $message }}</span>
                @enderror
            </div>
            <div class="mt-4">
                <x-jet-label for="sequence" value="{{ __('Sequence') }}" />
                <x-jet-input wire:model="sequence" id="sequence" class="block mt-1 w-full" type="text" />
                @error('sequence')
                    <span class="error">{{ $message }}</span>
                @enderror
            </div>
            <div class="mt-4">
                <x-jet-label for="type" value="{{ __('Type') }}" />
                <select wire:model="type" class="rounded-lg block appearance-none w-full mt-1 bg-gray-100 border border-gray-200 text-gray-700 py-3 px-4 pr-8 round leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                    <option value="SidebarNav">
                        SidebarNav
                    </option>
                    <option value="TopNav">
                        TopNav
                    </option>
                </select>
            </div>
        </x-slot>

        <x-slot name="footer">
            <x-jet-secondary-button wire:click="$toggle('modalFormVisible')" wire:loading.attr="disabled">
                {{ __('Nevermind') }}
            </x-jet-secondary-button>

            @if ($modelId)
                <x-jet-button class="ml-2" wire:click="update" wire:loading.attr="disabled">
                    {{ __('Update') }}
                </x-jet-button>
            @else
                <x-jet-button class="ml-2" wire:click="create" wire:loading.attr="disabled">
                    {{ __('Save') }}
                </x-jet-button>
            @endif
        </x-slot>
    </x-jet-dialog-modal>

    {{-- The delete modal --}}
    <!-- Delete User Confirmation Modal -->
    <x-jet-dialog-modal wire:model="modalConfirmDeleteVisible">
        <x-slot name="title">
            {{ __('Delete Nav Item') }}
        </x-slot>

        <x-slot name="content">
            {{ __('Are you sure you want to delete this navigation item?') }}

        </x-slot>

        <x-slot name="footer">
            <x-jet-secondary-button wire:click="$toggle('modalConfirmDeleteVisible')" wire:loading.attr="disabled">
                {{ __('Nevermind') }}
            </x-jet-secondary-button>

            <x-jet-danger-button class="ml-2" wire:click="delete" wire:loading.attr="disabled">
                {{ __('Delete Navigation Item') }}
            </x-jet-danger-button>
        </x-slot>
    </x-jet-dialog-modal>
</div>
