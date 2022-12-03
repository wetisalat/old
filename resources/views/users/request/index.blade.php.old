
@extends('layouts/contentLayoutMaster')

@section('title', 'Request')

@section('vendor-style')
  {{-- vendor css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">

  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="css/date-range.css">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <!-- Mobiscroll CSS Includes -->
  <link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">

  <style>
    .daterangepicker {
      -webkit-box-shadow: 1px 0 0 #e6e6e6, -1px 0 0 #e6e6e6, 0 1px 0 #e6e6e6, 0 -1px 0 #e6e6e6, 0 3px 13px rgb(0 0 0 / 8%);
      box-shadow: 1px 0 0 #e6e6e6, -1px 0 0 #e6e6e6, 0 1px 0 #e6e6e6, 0 -1px 0 #e6e6e6, 0 3px 13px rgb(0 0 0 / 8%);
    }
    .daterangepicker .calendar-table table {
      border-collapse: separate;
    }
    .daterangepicker .calendar-table tr td:first-child {
      border-right: 1px solid #e6e6e6;
      color: rgba(57,57,57,0.3);
    }
    .daterangepicker .calendar-table td {
      border: 1px solid transparent;
      border-radius: 50%;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      color: #6e6b7b;
      cursor: pointer;
      font-weight: 400;
      height: 28px;
      line-height: 28px;
    }
    .daterangepicker .calendar-table tr td:first-child {
      border-radius: 0;
    }
    .daterangepicker .calendar-table td:hover {
      background: #f6f6f6;
      border-color: #e6e6e6;
    }
    .daterangepicker td.today,
    .daterangepicker td.today:hover {
      border-color: #357ebd;
    }

    .daterangepicker td.active, 
    .daterangepicker td.active:hover {
      background-color: #357ebd;
      border: 1px solid transparent;
      color: #fff;
      border-color: #357ebd;
    }

    .daterangepicker td.start-date.end-date {
      border-radius: 50%; 
    }

    .daterangepicker td.off, 
    .daterangepicker td.off.in-range, 
    .daterangepicker td.off.start-date, 
    .daterangepicker td.off.end-date {
      color: #dae1e7;
    }

    .daterangepicker td.in-range {
      border-radius: 0;
    }

    .daterangepicker td.start-date,
    .daterangepicker td.start-date:hover  {
      border-radius: 50px 0 0 50px;
    }

    .daterangepicker td.end-date,
    .daterangepicker td.end-date:hover {
      border-radius: 0 50px 50px 0;
    }

    .demo-date-filtering-popup .mbsc-ios.mbsc-datepicker-inline {
        border: none;
        border-radius: 4px;
        overflow: hidden;
    }
    
    .demo-date-filtering-popup .mbsc-textfield-wrapper-box {
        margin-top: 0;
        margin-right: 0;
    }
    
    .demo-date-filtering-dates {
        display: flex;
        flex-direction: column;
    }
    
    .demo-date-filtering-inputs {
        flex: 1;
    }
    
    .demo-date-filtering-desktop-buttons.mbsc-button-group-justified,
    .demo-date-filtering-desktop-buttons.mbsc-button-group-justified button {
        margin-bottom: 0;
    }
    
    @media (max-width: 575px) {
        .demo-date-filtering-desktop-buttons {
            display: none;
        }
        .demo-date-filtering-popup .mbsc-textfield-wrapper-box {
            margin-left: 0;
        }
    }

  </style>

@endsection

@section('page-style')
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-pickadate.css')) }}">
@endsection

@section('content')
<!-- users list start -->
<section class="app-user-list">
  <div class="row">
    <div class="col-lg-3 col-sm-6">
      <div class="card">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <h3 class="fw-bolder mb-75">{{ $staffCount }}</h3>
            <span>Total Staffs</span>
          </div>
          <div class="avatar bg-light-primary p-50">
            <span class="avatar-content">
              <i data-feather="user" class="font-medium-4"></i>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <div class="card">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <h3 class="fw-bolder mb-75" id="refuse-count">0</h3>
            <span>Refused</span>
          </div>
          <div class="avatar bg-light-danger p-50">
            <span class="avatar-content">
              <i data-feather="user-plus" class="font-medium-4"></i>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <div class="card">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <h3 class="fw-bolder mb-75" id="accept-count">0</h3>
            <span>Accepted</span>
          </div>
          <div class="avatar bg-light-success p-50">
            <span class="avatar-content">
              <i data-feather="user-check" class="font-medium-4"></i>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <div class="card">
        <div class="card-body d-flex align-items-center justify-content-between">
          <div>
            <h3 class="fw-bolder mb-75" id="pending-count">0</h3>
            <span>Pending</span>
          </div>
          <div class="avatar bg-light-warning p-50">
            <span class="avatar-content">
              <i data-feather="user-x" class="font-medium-4"></i>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- Basic table -->
      <div class="card">
        <table class="datatables-basic table">
          <thead>
            <tr>
              <th></th>
              <th></th>
              <th>id</th>
              <th>Name</th>
              <th>Leave Reason</th>
              <th>Description</th>
              <th>All Day</th>
              <th>Start</th>
              <th>End</th>
              <th>Approved By</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
        </table>
      </div>
</section>
<!--/ Basic table -->

<div class="date-filtering-input d-none">
  <div class="mbsc-form-group">
      <label>
          <input id="date-filtering" mbsc-input data-input-style="box" readonly />
      </label>
  </div>
  <div>
      <div id="date-filtering-popup" class="demo-date-filtering-popup">
          <div class="mbsc-grid mbsc-no-padding">
              <div class="mbsc-row">
                  <div class="mbsc-col-sm-4 mbsc-push-sm-8 demo-date-filtering-dates">
                      <div class="demo-date-filtering-inputs">
                          <label>
                              Date range
                              <input mbsc-input id="date-select-input" data-dropdown="true" data-input-style="box" data-label-style="stacked" />
                          </label>
                          <select id="date-filtering-select">
                              <option value="custom" selected>Custom</option>
                              <option value="today">Today</option>
                              <option value="yesterday">Yesterday</option>
                              <option value="last-week">Last week</option>
                              <option value="last-month">Last month</option>
                              <option value="last-7-days">Last 7 days</option>
                              <option value="last-30-days">Last 30 days</option>
                          </select>
                          <label class="demo-date-filtering-range-input">
                              Start
                              <input id="date-filtering-start" mbsc-input data-input-style="box" data-label-style="stacked" />
                          </label>
                          <label class="demo-date-filtering-range-input">
                              End
                              <input id="date-filtering-end" mbsc-input data-input-style="box" data-label-style="stacked" />
                          </label>
                      </div>
                      <div class="demo-date-filtering-desktop-buttons mbsc-button-group-justified">
                          <button class="apply-button" mbsc-button>Apply</button>
                          <button class="cancel-button" mbsc-button>Cancel</button>
                      </div>
                  </div>
                  <div class="mbsc-col-sm-8 mbsc-pull-sm-4">
                      <div id="date-filtering-calendar"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>

@endsection


@section('vendor-script')
  {{-- vendor files --}}
  <script src="{{ asset(mix('vendors/js/tables/datatable/jquery.dataTables.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.bootstrap5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.responsive.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/responsive.bootstrap5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.checkboxes.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.buttons.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/jszip.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/pdfmake.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/vfs_fonts.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.html5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.print.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.rowGroup.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>

  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.time.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script src="js/scripts/users/date-range.js"></script> 
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset('vendors/js/mobiscroll/mobiscroll.jquery.min.js') }}"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
  <script src="js/scripts/users/request_table.js"></script>
@endsection