@extends('layouts/contentLayoutMaster')

@section('title', 'Subscription Cancel')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <p>Read full documnetation <a href="https://datatables.net/" target="_blank">here</a></p>
    </div>
</div>
<!-- Multilingual -->
<section id="basic-datatable">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header border-bottom">
                    <h4 class="card-title">Subscription Cancel</h4>
                </div>
                <div class="card-datatable">
                    <table class="dt-multilingual table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>Reason</th>
                                <th>Team</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($subscribtions as $subscribtion)
                            <tr class="odd">
                                <td class=" control" tabindex="0" style="display: none;"></td>
                                <td><span class="text-nowrap"></span></td>
                                <td>{{ $subscribtion->id }}</td>
                                {{-- <td><span class="text-nowrap">day</span></td> --}}
                                <td><span class="text-nowrap">{{ $subscribtion->reason }}</span></td>
                                <td><span class="text-nowrap"> {{ $subscribtion->team->name }}</span></td>
                                <td><span class="text-nowrap">{{ $subscribtion->created_at->format('d-m-Y') }}</span></td>
                                <td><span class="badge rounded-pill badge-light-danger"
                                        text-capitalized="">Canceled</span></td>
                                <td>
                                    {{-- <div class="btn-group"><a class="btn btn-sm dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-more-vertical font-small-4">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg></a>
                                        <div class="dropdown-menu dropdown-menu-end"><a
                                                href="http://martinicain.test/admin/plans/11/edit"
                                                class="dropdown-item"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                    height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-file-text font-small-4 me-50">
                                                    <path
                                                        d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z">
                                                    </path>
                                                    <polyline points="14 2 14 8 20 8"></polyline>
                                                    <line x1="16" y1="13" x2="8" y2="13"></line>
                                                    <line x1="16" y1="17" x2="8" y2="17"></line>
                                                    <polyline points="10 9 9 9 8 9"></polyline>
                                                </svg>Upgrade</a><a href="http://martinicain.test/admin/11/delete/plans"
                                                class="dropdown-item delete-record"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-trash-2 font-small-4 me-50">
                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                    <path
                                                        d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                    </path>
                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                </svg>Delete</a>
                                            </div>
                                    </div> --}}
                                </td>
                            </tr>
                            @empty
                                <p>No data found !</p>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ Multilingual -->
@endsection


@section('vendor-script')
{{-- vendor files --}}
<script src="{{ asset(mix('vendors/js/tables/datatable/jquery.dataTables.min.js')) }}"></script>
<script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.bootstrap5.min.js')) }}"></script>
<script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.responsive.min.js')) }}"></script>
<script src="{{ asset(mix('vendors/js/tables/datatable/responsive.bootstrap5.min.js')) }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
@endsection
@section('page-script')
{{-- Page js files --}}
<script src="{{ asset(mix('js/scripts/admin/subscription_cancel.js')) }}"></script>
@endsection
