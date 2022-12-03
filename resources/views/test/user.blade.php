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
          <h5>Congratulations 🎉 John!</h5>
          <p class="card-text font-small-3">You have won gold medal</p>
          <h3 class="mb-75 mt-2 pt-50">
            <a href="#">$48.9k</a>
          </h3>
          <button type="button" class="btn btn-primary">View Sales</button>
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
                  <h4 class="fw-bolder mb-0">230k</h4>
                  <p class="card-text font-small-3 mb-0">Sales</p>
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
                  <h4 class="fw-bolder mb-0">8.549k</h4>
                  <p class="card-text font-small-3 mb-0">Customers</p>
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
                  <h4 class="fw-bolder mb-0">1.423k</h4>
                  <p class="card-text font-small-3 mb-0">Products</p>
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
                  <h4 class="fw-bolder mb-0">$9745</h4>
                  <p class="card-text font-small-3 mb-0">Revenue</p>
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
        <table class="table table-borderless">
          <thead>
            <tr>
              <th>Project</th>
              <th>Client</th>
              <th>Users</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/angular.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Angular"
                />
                <span class="fw-bold">Angular Project</span>
              </td>
              <td>Peter Charls</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-primary me-1">Active</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/react.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="React"
                />
                <span class="fw-bold">React Project</span>
              </td>
              <td>Ronald Frest</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-success me-1">Completed</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/vuejs.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Vuejs"
                />
                <span class="fw-bold">Vuejs Project</span>
              </td>
              <td>Jack Obes</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-info me-1">Scheduled</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/bootstrap.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Bootstrap"
                />
                <span class="fw-bold">Bootstrap Project</span>
              </td>
              <td>Jerry Milton</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-warning me-1">Pending</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
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
  <!-- Page js files -->
  <script src="js/scripts/dashboard-user.js"></script>
@endsection
