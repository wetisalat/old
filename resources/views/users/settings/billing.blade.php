@extends('layouts/contentLayoutMaster')

@section('title', 'Billing & Plans')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">
@endsection
@section('page-style')
  <!-- Page css files -->
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <script src="https://js.stripe.com/v3/"></script>
  @endsection

  @section('content')
<div class="row">
  <div class="col-12">
    <ul class="nav nav-pills mb-2">
      <!-- Account -->
      <li class="nav-item">
        <a class="nav-link" href="{{asset('settings')}}">
          <i data-feather="user" class="font-medium-3 me-50"></i>
          <span class="fw-bold">Account</span>
        </a>
      </li>
      <!-- security -->
      <li class="nav-item">
        <a class="nav-link" href="{{asset('settings/security')}}">
          <i data-feather="lock" class="font-medium-3 me-50"></i>
          <span class="fw-bold">Security</span>
        </a>
      </li>
      <!-- billing and plans -->
      <li class="nav-item">
        <a class="nav-link active" href="{{asset('settings/billing')}}">
          <i data-feather="bookmark" class="font-medium-3 me-50"></i>
          <span class="fw-bold">Billings &amp; Plans</span>
        </a>
      </li>
      <!-- notification -->
      <li class="nav-item">
        <a class="nav-link" href="{{asset('settings/notifications')}}">
          <i data-feather="bell" class="font-medium-3 me-50"></i>
          <span class="fw-bold">Notifications</span>
        </a>
      </li>
      <!-- shift -->
      <li class="nav-item">
        <a class="nav-link" href="{{asset('settings/shift')}}">
          <i data-feather="clock" class="font-medium-3 me-50"></i>
          <span class="fw-bold">Shift</span>
        </a>
      </li>
      <!-- locations -->
      <li class="nav-item">
  <a class="nav-link" href="{{asset('settings/location')}}">
    <i data-feather="map-pin" class="font-medium-3 me-50"></i>
    <span class="fw-bold">Locations</span>
  </a>
</li>
      <!-- allowance -->
      <li class="nav-item">
  <a class="nav-link" href="{{asset('settings/allowance')}}">
    <i data-feather="award" class="font-medium-3 me-50"></i>
    <span class="fw-bold">Allowance</span>
  </a>
</li>
      <!-- extra -->
      <li class="nav-item">
  <a class="nav-link" href="{{asset('settings/extra')}}">
    <i data-feather="sliders" class="font-medium-3 me-50"></i>
    <span class="fw-bold">Extra</span>
  </a>
</li>
    </ul>

    <!-- billing and plans  -->

    <!-- current plan -->
    <div class="card">
      <div class="card-header border-bottom">
        <h4 class="card-title">Current plan</h4>
      </div>
      <div class="card-body my-2 py-25">
        @if (currentTeam()->subscribed('default'))
        @if(currentTeam()->subscription('default')->cancelled())
            <div>
                <p class="mb-2 head"> {{ __('Subscribed: ') }} <span class="h4">{{ ucfirst(currentTeam()->plan->title) }}</span>
                    <span class="badge rounded-pill badge-light-danger" text-capitalized="">Canceled</span>
                </p>
                <div>
                <p class="mt-2 mb-2"><span class="lead text-primary">{{ucfirst(currentTeam()->plan->price)}}</span> {{ __(' per ') }} {{ucfirst(currentTeam()->plan->interval) }} </p>
                </div>
                <p class="mb-3">{{ __('Canceled on ') }} {{Carbon\Carbon::parse($subscription->ends_at)->format('d-m-Y')}}. </p>

                <p>{{ __('Please resume your subscription to continue using our app after trial period ends') }}</p>

                <form action="{{ route('resume') }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-sm btn-success " id="card-button"> {{ __('Resume subscription') }} </button>
                </form>
            </div>
        @endif
        @if (currentTeam()->subscription('default')->recurring())
        <div class="row">
          <div class="col-md-6">
            <div class="mb-2 pb-50">
              <h5>'{{ currentTeam()->name }}'  Subscribed to Plan: <strong>{{ ucfirst(currentTeam()->plan->title) }}</strong></h5>
              <span>{{ ucfirst(currentTeam()->plan->description) }}</span>
            </div>
            <div class="mb-1">
              <h5><strong> USD {{ ucfirst(currentTeam()->plan->price) }}</strong> Per {{ ucfirst(currentTeam()->plan->interval) }} <span class="badge badge-light-primary ms-50"></span></h5>
              <span>Standard plan for small to medium businesses</span>
            </div>
          </div>
          <div class="col-md-6">
            <div class="plan-statistics pt-1">
              <div class="d-flex justify-content-between">
                <h5 class="fw-bolder">Staff remaining</h5>
                <h5 class="fw-bolder">{{ currentTeam()->users->count() }} of {{ currentTeam()->plan->teams_limit }} staffs</h5>
              </div>
              <div class="progress">
                <div
                  class="progress-bar w-{{ currentTeam()->users->count() / currentTeam()->plan->teams_limit*100 }}"
                  role="progressbar"
                  aria-valuenow=""
                  aria-valuemin="0"
                  aria-valuemax=""
                ></div>
              </div>
              <div class="center">
                <p class="mt-50">Want to add more staff members to your team </p>
                <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#pricingModal">upgrade</button>
              </div>
            </div>
          </div>
          <div class="col-12">
            <button class="btn btn-primary me-1 mt-1" data-bs-toggle="modal" data-bs-target="#pricingModal">
              Upgrade Plan
            </button>
            <button data-bs-toggle="modal" data-bs-target="#cancel" class="btn btn-outline-danger mt-1">Cancel Subscription</button>
          </div>
        </div>
        @endif
        @endif
      </div>
    </div>
    <!-- / current plan -->

    <!-- payment methods -->
    <div class="card">
      <div class="card-header border-bottom">
        <h4 class="card-title">Payment Methods</h4>
      </div>
      <div class="card-body my-1 py-25">
        <div class="row gx-4">
          <div class="col-lg-6">
            <x:card-form :action="route('newcard')">
                <button type="submit" class="btn btn-primary me-1 mt-4" id="card-button" data-secret="{{ currentTeam()->createSetupIntent()->client_secret }}">
                    {{ __('Add new card') }}
                </button>
            </x:card-form>
          </div>
          <div class="col-lg-6 mt-2 mt-lg-0">
            <h6 class="fw-bolder mb-2">My Cards</h6>
            <div class="added-cards">
              @forelse ($payments as $payment)
              <div class="cardMaster rounded border p-2 mb-1">
                <div class="d-flex justify-content-between flex-sm-row flex-column">
                  <div class="card-information">
                    <img
                      class="mb-1 img-fluid"
                      src="{{asset('images/icons/payments/'.$payment->card->brand.'.png')}}"
                      alt="Master Card"
                    />
                    <div class="d-flex align-items-center mb-50">
                      <h6 class="mb-0">{{ optional(optional($payment)->billing_details)->name }}</h6>
                      @if ($payment->card->last4  == currentTeam()->pm_last_four)
                        <span class="badge badge-light-primary ms-50">Primary</span>
                     @endif
                    </div>
                    <span class="card-number">∗∗∗∗ ∗∗∗∗ {{ $payment->card->last4 }}</span>
                  </div>
                  <div class="d-flex flex-column text-start text-lg-end">
                    <div class="d-flex order-sm-0 order-1 mt-1 mt-sm-0">
                      <form action="{{ route('delete') }}" method="POST">
                        @csrf
                        <input type="hidden" name="id" value="{{ $payment->id }}"/>
                        <button type="submit" class="btn btn-outline-danger">Delete</button>
                      </form>
                    </div>
                    <span class="mt-2">Card expires at {{ $payment->card->exp_month }}/{{ $payment->card->exp_year }}</span>
                  </div>
                </div>
              </div>

              @empty
               No payment method found
              @endforelse
              {{-- <div class="cardMaster border rounded p-2">
                <div class="d-flex justify-content-between flex-sm-row flex-column">
                  <div class="card-information">
                    <img
                      class="mb-1 img-fluid"
                      src="{{asset('images/icons/payments/'. $payment->card->brand .'.png')}}"
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
              </div> --}}
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / payment methods -->

    <!--/ billing and plans -->
  </div>
</div>

@include('content/_partials/_modals/modal-pricing')
@include('content/_partials/_modals/modal-edit-cc')
@include('content/_partials/_modals/modal-cancel')
@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
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
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/pages/page-pricing.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/modal-add-new-cc.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/modal-edit-cc.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/billing.js')) }}"></script>
@endsection
