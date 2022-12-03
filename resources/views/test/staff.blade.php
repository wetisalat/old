@extends('layouts/contentLayoutMaster')

@section('title', 'Dashboard Staff')

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
<div class="row match-height">
<div class="col-lg-6 col-md-12 col-sm-12">
      <div class="row match-height">
                <!-- Earnings Card -->
                <div class="col-lg-12 col-md-6 col-12">
                <div class="card card-congratulations">
        <div class="card-body text-center">
          <img
            src="{{asset('images/elements/decore-left.png')}}"
            class="congratulations-img-left"
            alt="card-img-left"
          />
          <img
            src="{{asset('images/elements/decore-right.png')}}"
            class="congratulations-img-right"
            alt="card-img-right"
          />
          <div class="avatar avatar-xl bg-primary shadow">
            <div class="avatar-content">
              <i data-feather="award" class="font-large-1"></i>
            </div>
          </div>
          <div class="text-center">
            <h1 class="mb-1 text-white">Congratulations John,</h1>
            <p class="card-text m-auto w-75">
              You have done <strong>57.6%</strong> more sales today. Check your new badge in your profile.
            </p>
          </div>
        </div>
      </div>
        </div>
        <!--/ Earnings Card -->
        <!-- Subscribers Chart Card starts -->
        <div class="col-lg-6 col-md-3 col-6">
        <div class="card">
        <div class="card-header flex-column align-items-start pb-0">
          <div class="avatar bg-light-primary p-50 m-0">
            <div class="avatar-content">
              <i data-feather="users" class="font-medium-5"></i>
            </div>
          </div>
          <h2 class="fw-bolder mt-1">92.6k</h2>
          <p class="card-text">Subscribers Gained</p>
        </div>
        <div id="gained-chart"></div>
      </div>
        </div>
        <!-- Subscribers Chart Card ends -->

        <!-- Orders Chart Card starts -->
        <div class="col-lg-6 col-md-3 col-6">
        <div class="card">
        <div class="card-header flex-column align-items-start pb-0">
          <div class="avatar bg-light-primary p-50 m-0">
            <div class="avatar-content">
            <i data-feather="package" class="font-medium-5"></i>
            </div>
          </div>
          <h2 class="fw-bolder mt-1">38.4K</h2>
          <p class="card-text">Orders Received</p>
        </div>
        <div id="order-chart"></div>
      </div>
        </div>
    <!-- Orders Chart Card ends --> 
      </div>
    </div>

    <!-- Bar Chart Starts -->
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
            <p class="card-subtitle text-muted mb-25">Balance</p>
            <h4 class="card-title fw-bolder">$74,382.72</h4>
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
          <div id="bar-chart"></div>
        </div>
      </div>
    </div>
    <!-- Bar Chart Ends -->
  </div>

  <div class="row match-height">
        <!-- Developer Meetup Card -->
        <div class="col-lg-4 col-md-6 col-12">
      <div class="card card-developer-meetup">
        <div class="meetup-img-wrapper rounded-top text-center">
          <img src="{{asset('images/illustration/email.svg')}}" alt="Meeting Pic" height="170" />
        </div>
        <div class="card-body">
          <div class="meetup-header d-flex align-items-center">
            <div class="meetup-day">
              <h6 class="mb-0">THU</h6>
              <h3 class="mb-0">24</h3>
            </div>
            <div class="my-auto">
              <h4 class="card-title mb-25">Developer Meetup</h4>
              <p class="card-text mb-0">Meet world popular developers</p>
            </div>
          </div>
          <div class="mt-0">
            <div class="avatar float-start bg-light-primary rounded me-1">
              <div class="avatar-content">
                <i data-feather="calendar" class="avatar-icon font-medium-3"></i>
              </div>
            </div>
            <div class="more-info">
              <h6 class="mb-0">Sat, May 25, 2020</h6>
              <small>10:AM to 6:PM</small>
            </div>
          </div>
          <div class="mt-2">
            <div class="avatar float-start bg-light-primary rounded me-1">
              <div class="avatar-content">
                <i data-feather="map-pin" class="avatar-icon font-medium-3"></i>
              </div>
            </div>
            <div class="more-info">
              <h6 class="mb-0">Central Park</h6>
              <small>Manhattan, New york City</small>
            </div>
          </div>
          <div class="mt-2">
            <div class="avatar float-start bg-light-primary rounded me-1">
              <div class="avatar-content">
                <i data-feather="check-square" class="avatar-icon font-medium-3"></i>
              </div>
            </div>
            <div class="more-info">
              <h6 class="mb-0">ToDo</h6>
              <small>Todo name assigned</small>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Developer Meetup Card -->

    <!-- App Design Card -->
    <div class="col-lg-4 col-md-6 col-12">
      <div class="card card-app-design">
        <div class="card-body">
        <h4 class="card-title">App design</h4>
          <p class="card-text font-small-2 mb-2">
            You can Find Only Post and Quotes Related to IOS like ipad app design, iphone app design
          </p>
          <div class="design-group mb-2 pt-50">
            <h6 class="section-label">Team</h6>
            <span class="badge badge-light-warning me-1">Figma</span>
            <span class="badge badge-light-primary">Wireframe</span>
          </div>
          <div class="design-group pt-25">
            <h6 class="section-label">Members</h6>
            <div class="avatar">
              <img src="{{asset('images/portrait/small/avatar-s-9.jpg')}}" width="34" height="34" alt="Avatar" />
            </div>
            <div class="avatar bg-light-danger">
              <div class="avatar-content">PI</div>
            </div>
            <div class="avatar">
              <img
                src="{{asset('images/portrait/small/avatar-s-14.jpg')}}"
                width="34"
                height="34"
                alt="Avatar"
              />
            </div>
            <div class="avatar">
              <img src="{{asset('images/portrait/small/avatar-s-7.jpg')}}" width="34" height="34" alt="Avatar" />
            </div>
            <div class="avatar bg-light-secondary">
              <div class="avatar-content">AL</div>
            </div>
          </div>
          <div class="design-planning-wrapper mb-2 py-75">
            <div class="design-planning">
              <p class="card-text mb-25">Due Date</p>
              <h6 class="mb-0">12 Apr, 21</h6>
            </div>
            <div class="design-planning">
              <p class="card-text mb-25">Budget</p>
              <h6 class="mb-0">$49251.91</h6>
            </div>
            <div class="design-planning">
              <p class="card-text mb-25">Cost</p>
              <h6 class="mb-0">$840.99</h6>
            </div>
          </div>
          <button type="button" class="btn btn-primary w-100">Join Team</button>
        </div>
      </div>
    </div>
    <!--/ App Design Card -->

   <!-- Transaction Card -->
   <div class="col-lg-4 col-md-6 col-12">
      <div class="card card-transaction">
        <div class="card-header">
          <h4 class="card-title">Transactions</h4>
          <div class="dropdown chart-dropdown">
            <i data-feather="more-vertical" class="font-medium-3 cursor-pointer" data-bs-toggle="dropdown"></i>
            <div class="dropdown-menu dropdown-menu-end">
              <a class="dropdown-item" href="#">Last 28 Days</a>
              <a class="dropdown-item" href="#">Last Month</a>
              <a class="dropdown-item" href="#">Last Year</a>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="transaction-item">
            <div class="d-flex">
              <div class="avatar bg-light-primary rounded float-start">
                <div class="avatar-content">
                  <i data-feather="pocket" class="avatar-icon font-medium-3"></i>
                </div>
              </div>
              <div class="transaction-percentage">
                <h6 class="transaction-title">Wallet</h6>
                <small>Starbucks</small>
              </div>
            </div>
            <div class="fw-bolder text-danger">- $74</div>
          </div>
          <div class="transaction-item">
            <div class="d-flex">
              <div class="avatar bg-light-success rounded float-start">
                <div class="avatar-content">
                  <i data-feather="check" class="avatar-icon font-medium-3"></i>
                </div>
              </div>
              <div class="transaction-percentage">
                <h6 class="transaction-title">Bank Transfer</h6>
                <small>Add Money</small>
              </div>
            </div>
            <div class="fw-bolder text-success">+ $480</div>
          </div>
          <div class="transaction-item">
            <div class="d-flex">
              <div class="avatar bg-light-danger rounded float-start">
                <div class="avatar-content">
                  <i data-feather="dollar-sign" class="avatar-icon font-medium-3"></i>
                </div>
              </div>
              <div class="transaction-percentage">
                <h6 class="transaction-title">Paypal</h6>
                <small>Add Money</small>
              </div>
            </div>
            <div class="fw-bolder text-success">+ $590</div>
          </div>
          <div class="transaction-item">
            <div class="d-flex">
              <div class="avatar bg-light-warning rounded float-start">
                <div class="avatar-content">
                  <i data-feather="credit-card" class="avatar-icon font-medium-3"></i>
                </div>
              </div>
              <div class="transaction-percentage">
                <h6 class="transaction-title">Mastercard</h6>
                <small>Ordered Food</small>
              </div>
            </div>
            <div class="fw-bolder text-danger">- $23</div>
          </div>
          <div class="transaction-item">
            <div class="d-flex">
              <div class="avatar bg-light-info rounded float-start">
                <div class="avatar-content">
                  <i data-feather="trending-up" class="avatar-icon font-medium-3"></i>
                </div>
              </div>
              <div class="transaction-percentage">
                <h6 class="transaction-title">Transfer</h6>
                <small>Refund</small>
              </div>
            </div>
            <div class="fw-bolder text-success">+ $98</div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Transaction Card -->

@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/charts/apexcharts.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
@endsection

@section('page-script')
  <!-- Page js files -->
  <script src="js/scripts/dashboard-staff.js"></script>
@endsection
