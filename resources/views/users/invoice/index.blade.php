@extends('layouts/contentLayoutMaster')

@section('title', 'Invoice')

@section('vendor-style')
<link rel="stylesheet" href="{{asset('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')}}">
<link rel="stylesheet" href="{{asset('vendors/css/tables/datatable/extensions/dataTables.checkboxes.css')}}">
<link rel="stylesheet" href="{{asset('vendors/css/tables/datatable/responsive.bootstrap5.min.css')}}">
@endsection

@section('page-style')
<link rel="stylesheet" href="{{asset('css/base/pages/app-invoice-list.css')}}">
@endsection

@section('content')
<section class="invoice-list-wrapper">
  <div class="card">
    <div class="card-datatable table-responsive">
      <table class="invoice-list-table table">
        <thead>
          <tr>
            <th></th>
            <th>#</th>
            <th>Total</th>
            <th class="text-truncate">Issued Date</th>
            {{-- <th>Balance</th> --}}
            <th>Invoice Status</th>
            <th class="cell-fit">Actions</th>
          </tr>
        </thead>
        <tbody>
            @forelse ($invoices as $invoice)
            <tr class="odd">
                <td class=" control" tabindex="0"></td>
                <td class="sorting_1"><a class="fw-bold" href="{{ $invoice['hosted_invoice_url'] }}" target="__blank" data-bs-toggle="tooltip"> {{ $invoice['id'] }}</a></td>

                <td><span class="d-none">{{ $invoice['total']/100 }}</span> {{ $invoice['total']/100 }} {{ env('CASHIER_CURRENCY')  }}</td>

                <td><span class="d-none">20190509</span>{{ \Carbon\Carbon::createFromTimestamp($invoice['created'])->format('d-m-Y') }}</td>
                <td><span class="badge rounded-pill badge-light-success" text-capitalized=""> {{ $invoice['status'] }} </span></td>
                <td>
                    <div class="d-flex align-items-center col-actions">
                        <a class="me-1" href="{{ $invoice['hosted_invoice_url'] }}" target="__blank" data-bs-toggle="tooltip"
                            data-bs-placement="top" title="" data-bs-original-title="Preview Invoice"
                            aria-label="Preview Invoice"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-eye font-medium-2 text-body">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg></a>
                        <a class="me-25" href="{{ $invoice['invoice_pdf'] }}"
                            data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Download Invoice"
                            aria-label="Download Invoice"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-download font-medium-2 text-body">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg></a></div>
                </td>
            </tr>

            @empty
                <p>No invoice found !</p>
            @endforelse
        </tbody>
      </table>
    </div>
  </div>
</section>
@endsection

@section('vendor-script')
<script src="{{asset('vendors/js/extensions/moment.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/dataTables.bootstrap5.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/datatables.checkboxes.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('vendors/js/tables/datatable/responsive.bootstrap5.js')}}"></script>
@endsection

@section('page-script')
{{-- <script src="{{asset('js/scripts/users/invoice.js')}}"></script> --}}
@endsection
