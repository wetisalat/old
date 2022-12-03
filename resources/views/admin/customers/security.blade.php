@extends('layouts/contentLayoutMaster')

@section('title', 'User View - Security')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
@endsection

@section('page-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
@endsection

@section('content')
<section class="app-user-view-security">
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
            <span class="fw-bold">Account</span></a
          >
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="{{ url('admin/customers/'. $user->id .'/security' ) }}">
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

      <!-- Change Password -->
      <div class="card">
        <h4 class="card-header">Change Password</h4>
        <div class="card-body">

          <form id="formChangePassword" method="POST" onsubmit="return false">

              <input type="hidden" id="change_password" name="change_password" value="change_password">
              <input type="hidden" id="userId" name="user_id" value="{{ $user->id }}">

            <div class="alert alert-warning mb-2" role="alert">
              <h6 class="alert-heading">Ensure that these requirements are met</h6>
              <div class="alert-body fw-normal">Minimum 8 characters long, uppercase & symbol</div>
            </div>

            <div class="row">
              <div class="mb-2 col-md-6 form-password-toggle">
                <label class="form-label" for="newPassword">New Password</label>
                <div class="input-group input-group-merge form-password-toggle">
                  <input
                    class="form-control"
                    type="password"
                    id="newPassword"
                    name="password"
                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                  />
                  <span class="input-group-text cursor-pointer">
                    <i data-feather="eye"></i>
                  </span>
                </div>
                  <span id="errorMessage" class="text-danger password_errormessage"></span>
              </div>

              <div class="mb-2 col-md-6 form-password-toggle">
                <label class="form-label" for="confirmPassword">Confirm New Password</label>
                <div class="input-group input-group-merge">
                  <input
                    class="form-control"
                    type="password"
                    name="password_confirmation"
                    id="confirmPassword"
                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                  />
                  <span class="input-group-text cursor-pointer"><i data-feather="eye"></i></span>

                </div>
                  <span id="errorMessage" class="text-danger confirm_errormessage"></span>
              </div>
              <div>
                <button type="submit" class="btn btn-primary me-2 change-password">Change Password</button>
              </div>
            </div>
          </form>


        </div>
      </div>
      <!--/ Change Password -->

      <!-- Two-steps verification -->
      <div class="card">
        <div class="card-body">
          <h4 class="card-title mb-50">Two-steps verification</h4>
          <span>Keep your account secure with authentication step.</span>
          <h6 class="fw-bolder mt-2">SMS</h6>
          <div class="d-flex justify-content-between border-bottom mb-1 pb-1">
            <span>+1(968) 945-8832</span>
            <div class="action-icons">
              <a
                href="javascript:void(0)"
                class="text-body me-50"
                data-bs-target="#twoFactorAuthModal"
                data-bs-toggle="modal"
              >
                <i data-feather="edit" class="font-medium-3"></i>
              </a>
              <a href="javascript:void(0)" class="text-body"><i data-feather="trash" class="font-medium-3"></i></a>
            </div>
          </div>
          <p class="mb-0">
            Two-factor authentication adds an additional layer of security to your account by requiring more than just a
            password to log in.
            <a href="javascript:void(0);" class="text-body">Learn more.</a>
          </p>
        </div>
      </div>
      <!--/ Two-steps verification -->

      <!-- recent device -->
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Recent devices</h4>
        </div>
        <div class="table-responsive">
          <table class="table text-nowrap text-center">
            <thead>
              <tr>
                <th class="text-start">BROWSER</th>
                <th>DEVICE</th>
                <th>LOCATION</th>
                <th>RECENT ACTIVITY</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-start">
                  <div class="avatar me-25">
                    <img src="{{asset('images/icons/google-chrome.png')}}" alt="avatar" width="20" height="20" />
                  </div>
                  <span class="fw-bolder">Chrome on Windows</span>
                </td>
                <td>Dell XPS 15</td>
                <td>United States</td>
                <td>10, Jan 2021 20:07</td>
              </tr>
              <tr>
                <td class="text-start">
                  <div class="avatar me-25">
                    <img src="{{asset('images/icons/google-chrome.png')}}" alt="avatar" width="20" height="20" />
                  </div>
                  <span class="fw-bolder">Chrome on Android</span>
                </td>
                <td>Google Pixel 3a</td>
                <td>Ghana</td>
                <td>11, Jan 2021 10:16</td>
              </tr>
              <tr>
                <td class="text-start">
                  <div class="avatar me-25">
                    <img src="{{asset('images/icons/google-chrome.png')}}" alt="avatar" width="20" height="20" />
                  </div>
                  <span class="fw-bolder">Chrome on MacOS</span>
                </td>
                <td>Apple iMac</td>
                <td>Mayotte</td>
                <td>11, Jan 2021 12:10</td>
              </tr>
              <tr>
                <td class="text-start">
                  <div class="avatar me-25">
                    <img src="{{asset('images/icons/google-chrome.png')}}" alt="avatar" width="20" height="20" />
                  </div>
                  <span class="fw-bolder">Chrome on iPhone</span>
                </td>
                <td>Apple iPhone XR</td>
                <td>Mauritania</td>
                <td>12, Jan 2021 8:29</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- / recent device -->
    </div>
    <!--/ User Content -->
  </div>
</section>


@include('content/_partials/_modals/admin/modal-edit-user')
@include('content/_partials/_modals/modal-upgrade-plan')
@include('content/_partials/_modals/modal-two-factor-auth')
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/polyfill.min.js')) }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/pages/modal-two-factor-auth.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/modal-edit-user.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view-security.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/admin/users/app-user-view-account.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/billing.js')) }}"></script>
@endsection
