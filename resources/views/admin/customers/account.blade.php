@extends('layouts/contentLayoutMaster')

@section('title', 'User View - Account')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">

  <link rel="stylesheet" href="{{ asset(mix('vendors/css/charts/apexcharts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.min.css')) }}">
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


<section class="app-user-view-account">
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
          <a class="nav-link active" href="{{ url('admin/customers/'. $user->id .'/view/account' ) }}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span></a
          >
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ url('admin/customers/'. $user->id .'/security' ) }}">
            <i data-feather="lock" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Security</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ url('admin/customers/'. $user->id .'/billing' ) }}">
            <i data-feather="bookmark" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Billing & Plans</span>
          </a>
        </li>
      </ul>
      <!--/ User Pills -->

      <!-- Billing Address -->
      <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Company Details</h4>
          <button
            class="btn btn-primary btn-sm edit-address"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#addNewInfoModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-xl-7 col-12">
              <dl class="row mb-0">
                <dt class="col-sm-4 fw-bolder mb-1">Contact Name:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->firstname }} {{ $user->lastname }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">Email:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->email }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">Address:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->address }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">Zipcode:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->postcode }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">VAT Number:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->vat_number }}</dd>
              </dl>
            </div>
            <div class="col-xl-5 col-12">
              <dl class="row mb-0">
              <dt class="col-sm-4 fw-bolder mb-1">N° Company:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->n_company }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">Number:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->phone }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">Country:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->country }}</dd>

                <dt class="col-sm-4 fw-bolder mb-1">City:</dt>
                <dd class="col-sm-8 mb-1">{{ $user->city }}</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
      <!--/ Billing Address -->
            <!-- payment methods -->
            <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Payment Methods</h4>
          <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addNewCard">
            <i data-feather="plus"></i>
            <span>Add Card</span>
          </button>
        </div>
        <div class="card-body">
          <div class="added-cards">
            <div class="cardMaster rounded border p-2 mb-1">
              <div class="d-flex justify-content-between flex-sm-row flex-column">
                <div class="card-information">
                  <img
                    class="mb-1 img-fluid"
                    src="{{asset('images/icons/payments/mastercard.png')}}"
                    alt="Master Card"
                  />
                  <div class="d-flex align-items-center mb-50">
                    <h6 class="mb-0">Tom McBride</h6>
                    <span class="badge badge-light-primary ms-50">Primary</span>
                  </div>
                  <span class="card-number">∗∗∗∗ ∗∗∗∗ 9856</span>
                </div>
                <div class="d-flex flex-column text-start text-lg-end">
                  <div class="d-flex order-sm-0 order-1 mt-1 mt-sm-0">
                    <button class="btn btn-outline-primary me-75" data-bs-toggle="modal" data-bs-target="#editCard">
                      Edit
                    </button>
                    <button class="btn btn-outline-secondary">Delete</button>
                  </div>
                  <span class="mt-2">Card expires at 12/24</span>
                </div>
              </div>
            </div>
            <div class="cardMaster border rounded p-2 mb-1">
              <div class="d-flex justify-content-between flex-sm-row flex-column">
                <div class="card-information">
                  <img
                    class="mb-1 img-fluid"
                    src="{{asset('images/icons/payments/visa.png')}}"
                    alt="Visa Card"
                  />
                  <h6>Mildred Wagner</h6>
                  <span class="card-number">∗∗∗∗ ∗∗∗∗ 5896</span>
                </div>
                <div class="d-flex flex-column text-start text-lg-end">
                  <div class="d-flex order-sm-0 order-1 mt-1 mt-sm-0">
                    <button class="btn btn-outline-primary me-75" data-bs-toggle="modal" data-bs-target="#editCard">
                      Edit
                    </button>
                    <button class="btn btn-outline-secondary">Delete</button>
                  </div>
                  <span class="mt-2">Card expires at 02/24</span>
                </div>
              </div>
            </div>
            <div class="cardMaster border rounded p-2">
              <div class="d-flex justify-content-between flex-sm-row flex-column">
                <div class="card-information">
                  <img
                    class="mb-1 img-fluid"
                    src="{{asset('images/icons/payments/american-ex.png')}}"
                    alt="Visa Card"
                  />
                  <h6>Mildred Wagner</h6>
                  <span class="card-number">∗∗∗∗ ∗∗∗∗ 5896</span>
                </div>
                <div class="d-flex flex-column text-start text-lg-end">
                  <div class="d-flex order-sm-0 order-1 mt-1 mt-sm-0">
                    <button class="btn btn-outline-primary me-75" data-bs-toggle="modal" data-bs-target="#editCard">
                      Edit
                    </button>
                    <button class="btn btn-outline-secondary">Delete</button>
                  </div>
                  <span class="mt-2">Card expires at 02/24</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- / payment methods -->
    </div>
    <!--/ User Content -->
  </div>
</section>

@include('content/_partials/_modals/admin/modal-edit-user')
@include('content/_partials/_modals/modal-upgrade-plan')
@include('content/_partials/_modals/admin/modal-add-new-info')
@include('content/_partials/_modals/admin/modal-edit-cc')
@include('content/_partials/_modals/admin/modal-add-new-cc')

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

@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/admin/users/modal-edit-user.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/modal-add-new-address.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/modal-add-new-cc.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/modal-edit-cc.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/billing.js')) }}"></script>

  <script src="{{ asset(mix('js/scripts/pages/dashboard-ecommerce.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view-account.js')) }}"></script>

@endsection
