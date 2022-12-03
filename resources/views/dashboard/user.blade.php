@extends('layouts/contentLayoutMaster')

@section('title', 'Dashboard User')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/charts/apexcharts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.min.css')) }}">
@endsection

@section('page-style')
 <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
 <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/charts/chart-apex.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-toastr.css')) }}">
@endsection

@section('content')
<!-- apex charts section start -->
<section id="apexchart">
<div class="row match-height">
    <!-- Medal Card -->
    <div class="col-xl-4 col-md-6 col-12">
      <div class="card card-congratulation-medal">
        <div class="card-body">
          <h5>Congratulations 🎉 {{ auth()->user()->firstname . ' ' . auth()->user()->lastname }}</h5>
          <p class="card-text font-small-3">Pening Leaves</p>
          <h3 class="mb-75 mt-2 pt-50">
            <a href="#">{{ $data['pending_leaves'] }}</a>
          </h3>
          <a href="{{ url('/request') }}" type="button" class="btn btn-primary">View Requests</a>
          <img src="{{asset('images/illustration/badge.svg')}}" class="congratulation-medal" alt="Medal Pic" />
        </div>
      </div>
    </div>
    <!--/ Medal Card -->

    <!-- Statistics Card -->
    <div class="col-xl-8 col-md-6 col-12">
      <div class="card card-statistics">
        <div class="card-header">
          <h4 class="card-title">Statistics</h4>
          <div class="d-flex align-items-center">
            <p class="card-text font-small-2 me-25 mb-0">Updated 1 month ago</p>
          </div>
        </div>
        <div class="card-body statistics-body">
          <div class="row">
            <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-xl-0">
              <div class="d-flex flex-row">
                <div class="avatar bg-light-primary me-2">
                  <div class="avatar-content">
                    <i data-feather="trending-up" class="avatar-icon"></i>
                  </div>
                </div>
                <div class="my-auto">
                  <h4 class="fw-bolder mb-0">{{ $data['total_hours_worked'] }}</h4>
                  <p class="card-text font-small-3 mb-0">Hours Worked</p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-xl-0">
              <div class="d-flex flex-row">
                <div class="avatar bg-light-info me-2">
                  <div class="avatar-content">
                    <i data-feather="user" class="avatar-icon"></i>
                  </div>
                </div>
                <div class="my-auto">
                  <h4 class="fw-bolder mb-0">{{ $data['total_leaves'] }}</h4>
                  <p class="card-text font-small-3 mb-0">Total Leaves</p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-sm-0">
              <div class="d-flex flex-row">
                <div class="avatar bg-light-danger me-2">
                  <div class="avatar-content">
                    <i data-feather="box" class="avatar-icon"></i>
                  </div>
                </div>
                <div class="my-auto">
                  <h4 class="fw-bolder mb-0">{{ $data['total_latetime'] }}</h4>
                  <p class="card-text font-small-3 mb-0">Total Late Time</p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12">
              <div class="d-flex flex-row">
                <div class="avatar bg-light-success me-2">
                  <div class="avatar-content">
                    <i data-feather="dollar-sign" class="avatar-icon"></i>
                  </div>
                </div>
                <div class="my-auto">
                  <h4 class="fw-bolder mb-0">{{ $data['total_overtime'] }}</h4>
                  <p class="card-text font-small-3 mb-0">Total Over Time</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Statistics Card -->
  </div>

<div class="row match-height">
    <!-- Donut Chart Starts-->
    <div class="col-xl-6 col-12">
      <div class="card">
        <div
          class="
            card-header
            d-flex
            flex-sm-row flex-column
            justify-content-md-between
            align-items-start
            justify-content-start
          "
        >
          <div>
          <h4 class="card-title mb-75">Expense Ratio</h4>
          </div>
          <div class="d-flex align-items-center mt-md-0 mt-1">
            <i class="font-medium-2" data-feather="calendar"></i>
            <input
              type="text"
              class="form-control flat-picker bg-transparent border-0 shadow-none"
              placeholder="YYYY-MM-DD"
            />
          </div>
        </div>
        <div class="card-body">
          <div id="donut-chart"></div>
        </div>
      </div>
    </div>
    <!-- Donut Chart Ends-->
    <!-- Support Tracker Chart Card starts -->
    <div class="col-lg-6 col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between pb-0">
          <h4 class="card-title">Support Tracker</h4>
          <div class="dropdown chart-dropdown">
            <button
              class="btn btn-sm border-0 dropdown-toggle p-50"
              type="button"
              id="dropdownItem4"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              Last 7 Days
            </button>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownItem4">
              <a class="dropdown-item" href="#">Last 28 Days</a>
              <a class="dropdown-item" href="#">Last Month</a>
              <a class="dropdown-item" href="#">Last Year</a>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-sm-2 col-12 d-flex flex-column flex-wrap text-center">
              <h1 class="font-large-2 fw-bolder mt-2 mb-0">163</h1>
              <p class="card-text">Tickets</p>
            </div>
            <div class="col-sm-10 col-12 d-flex justify-content-center">
              <div id="support-trackers-chart"></div>
            </div>
          </div>
          <div class="d-flex justify-content-between mt-1">
            <div class="text-center">
              <p class="card-text mb-50">New Tickets</p>
              <span class="font-large-1 fw-bold">29</span>
            </div>
            <div class="text-center">
              <p class="card-text mb-50">Open Tickets</p>
              <span class="font-large-1 fw-bold">63</span>
            </div>
            <div class="text-center">
              <p class="card-text mb-50">Response Time</p>
              <span class="font-large-1 fw-bold">1d</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Support Tracker Chart Card ends -->
    </div>     
 <!-- Borderless table start -->
 <div class="row" id="table-borderless">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title">Leaves Table</h4>
      </div>
      <div class="table-responsive">
        <table class="table table-borderless" id="daily-data-table">
          <thead>
            <tr>
              <th>Staff Name</th>
              <th>Phone Number</th>
              <th>Shift</th>
              <th>Arrival Date</th>
              <th>Status</th>
              <th>Reason</th>
            </tr>
          </thead>
          <tbody>
            @foreach($data['daily_staff_data'] as $row)
            <tr>
              <td>
                <div class="d-flex justify-content-left align-items-center">
                  <div class="avatar-wrapper">
                    <div class="avatar  me-1">
                      <span class="avatar-content">{{ strtoupper(explode(' ', $row->staff_name)[0][0]). strtoupper(explode(' ', $row->staff_name)[1][0]) }}</span>
                    </div>
                  </div>
                  <div class="d-flex flex-column">
                    <a href="{{ url('/staff/71/view/account') }}" class="user_name text-truncate text-body">
                      <span class="fw-bolder">{{ $row->staff_name }}</span>
                    </a>
                    <small class="emp_post text-muted">{{$row->contract_type_name}}</small>
                  </div>
                </div>
              </td>
              <td>{{ $row->phone }}</td>
              <td>
                @if($row->shift_name !== '')
                <div class="d-flex flex-column">
                    <a href="{{ url('/staff/71/view/account') }}" class="user_name text-truncate text-body">
                      <span class="fw-bolder">{{ $row->shift_name }}</span>
                    </a>
                    <small class="emp_post text-muted">{{ $row->start_time . ' - ' . $row->end_time }}</small>
                </div>
                @else
                  N/A
                @endif
              </td>
              <td>{{ !is_null($row->arrival_date) ? $row->arrival_date : 'N/A' }}</td>
              <td><span class="badge rounded-pill badge-light-primary me-1">{{ $row->status }}</span></td>
              <td>{{ $row->leave_reason }}</td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- Borderless table end -->    

    <!-- Apex charts section end -->
  </div>
</section>
@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/charts/apexcharts.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/moment.min.js')) }}"></script>
@endsection

@section('page-script')
  <script>
    var User_Dashboard_Data  = {!! json_encode($data, JSON_NUMERIC_CHECK) !!}
  </script>
  <!-- Page js files -->
  <script src="js/scripts/dashboard-user.js"></script>
@endsection
