@extends('layouts/contentLayoutMaster')

@section('title', 'User View - Billing & Plans')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">

  <link rel="stylesheet" href="{{ asset(mix('vendors/css/charts/apexcharts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.min.css')) }}">

  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">
@endsection

@section('page-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">

  <link rel="stylesheet" href="{{ asset(mix('css/base/pages/dashboard-ecommerce.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/charts/chart-apex.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-toastr.css')) }}">
@endsection


@section('content')
<section class="app-user-view-billing">
  <div class="row">
    <!-- User Sidebar -->
    <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
      <!-- User Card -->
        <div class="card">
            <div class="card-body">
                <div class="user-avatar-section">
                    <div class="d-flex align-items-center flex-column">
                        <img
                            class="img-fluid rounded mt-3 mb-2"
                            src="{{ Auth::user() ? $user->profile_photo_url : asset('images/portrait/small/avatar-s-11.jpg') }}"
                            height="110"
                            width="110"
                            alt="User avatar"
                        />
                        <div class="user-info text-center">
                            <h4>{{ $user->name }}</h4>
                            <span class="badge bg-light-secondary">

                                @php
                                    $date=date_create($user->created_at);
                                    echo date_format($date,"d-m-Y H:i:s");
                                @endphp
                </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <!-- /User Card -->
      <!-- Plan Card -->
        <div class="card border-primary">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start">
            <span class="badge bg-light-primary">
                  @if(isset($user->plans))
                    {{ $user->plans->title }}
                @endif
            </span>
                    <div class="d-flex justify-content-center">
                        <sup class="h5 pricing-currency text-primary mt-1 mb-0">$</sup>
                        <span class="fw-bolder display-5 mb-0 text-primary">
                  @if(isset($user->plans))
                                {{ $user->plans->price }}
                            @endif
              </span>
                        <sub class="pricing-duration font-small-4 ms-25 mt-auto mb-2">/
                            @if(isset($user->plans))
                                {{ $user->plans->interval }}
                            @endif
                        </sub>
                    </div>
                </div>
                <ul class="ps-1 mb-2 list-unstyled">
                    <li class="mb-50">
                        @if(isset($user->plans))
                            {{ $user->plans->description }}
                        @endif
                    </li>
                </ul>
                <div class="d-flex justify-content-between align-items-center fw-bolder mb-50">
                    <span>Days</span>
                    <span>4 of 30 Days</span>
                </div>
                <div class="progress mb-50" style="height: 8px">
                    <div
                        class="progress-bar"
                        role="progressbar"
                        style="width: 80%"
                        aria-valuenow="65"
                        aria-valuemax="100"
                        aria-valuemin="80"
                    ></div>
                </div>
                <span>4 days remaining</span>
                <div class="d-grid w-100 mt-2">
                    <button class="btn btn-primary" data-bs-target="#upgradePlanModal" data-bs-toggle="modal">
                        Upgrade Plan
                    </button>
                </div>
            </div>
        </div>
      <!-- /Plan Card -->
    </div>
    <!--/ User Sidebar -->

    <!-- User Content -->
    <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
      <!-- User Pills -->
      <ul class="nav nav-pills mb-2">
        <li class="nav-item">
          <a class="nav-link" href="{{ url('admin/customers/'. $user->id .'/view/account' ) }}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ url('admin/customers/'. $user->id .'/security' ) }}">
            <i data-feather="lock" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Security</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="{{ url('admin/customers/'. $user->id .'/billing' ) }}">
            <i data-feather="bookmark" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Billing & Plans</span>
          </a>
        </li>
      </ul>
      <!--/ User Pills -->

      <!-- current plan -->
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Current plan</h4>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <div class="mb-2 pb-50">
                <h5>Your Current Plan is <strong>Basic</strong></h5>
                <span>A simple start for everyone</span>
              </div>
              <div class="mb-2 pb-50">
                <h5>Active until Dec 09, 2021</h5>
                <span>We will send you a notification upon Subscription expiration</span>
              </div>
              <div class="mb-2 mb-md-1">
                <h5>$199 Per Month <span class="badge badge-light-primary ms-50">Popular</span></h5>
                <span>Standard plan for small to medium businesses</span>
              </div>
            </div>
            <div class="col-md-6">
              <div class="alert alert-warning mb-2" role="alert">
                <h6 class="alert-heading">We need your attention!</h6>
                <div class="alert-body fw-normal">your plan requires update</div>
              </div>
              <div class="plan-statistics pt-1">
                <div class="d-flex justify-content-between">
                  <h5 class="fw-bolder">Days</h5>
                  <h5 class="fw-bolder">4 of 30 Days</h5>
                </div>
                <div class="progress">
                  <div
                    class="progress-bar w-75"
                    role="progressbar"
                    aria-valuenow="75"
                    aria-valuemin="0"
                    aria-valuemax="100"
                  ></div>
                </div>
                <p class="mt-50">4 days remaining until your plan requires update</p>
              </div>
            </div>
            <div class="col-12">
              <button class="btn btn-primary me-1 mt-1" data-bs-toggle="modal" data-bs-target="#upgradePlanModal">
                Upgrade Plan
              </button>
              <button class="btn btn-outline-danger cancel-subscription mt-1">Cancel Subscription</button>
            </div>
          </div>
        </div>
      </div>
      <!-- / current plan -->

      <!-- Invoice table -->
      <div class="card">
  <table class="invoice-table table text-nowrap">
    <thead>
      <tr>
        <th></th>
        <th>#ID</th>
        <th><i data-feather="trending-up"></i></th>
        <th>TOTAL Paid</th>
        <th class="text-truncate">Issued Date</th>
        <th class="cell-fit">Actions</th>
      </tr>
    </thead>
  </table>
</div>
<!-- /Invoice table -->
    </div>
    <!--/ User Content -->
  </div>
</section>

@include('content/_partials/_modals/modal-edit-user')
@include('content/_partials/_modals/modal-upgrade-plan')
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/polyfill.min.js')) }}"></script>

  <script src="{{ asset(mix('vendors/js/charts/apexcharts.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
  {{-- data table --}}
  <script src="{{ asset(mix('vendors/js/extensions/moment.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/jquery.dataTables.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.bootstrap5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.responsive.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/responsive.bootstrap5.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.buttons.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/jszip.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/pdfmake.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/vfs_fonts.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.html5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.print.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.rowGroup.min.js')) }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/users/billing.js')) }}"></script>

  <script src="{{ asset(mix('js/scripts/pages/dashboard-ecommerce.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view-account.js')) }}"></script>
@endsection
