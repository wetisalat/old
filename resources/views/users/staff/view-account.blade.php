@extends('layouts/contentLayoutMaster')

@section('title', 'Staff View - Account')

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
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
@endsection

@section('content')
<section class="staff-view-account">
  <div class="row">
  <!-- User Sidebar -->
  <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
      <!-- User Card -->
      <div class="card border-primary">
        <div class="card-body">
          <div class="user-avatar-section">
            <div class="d-flex align-items-center flex-column">
              <img
                class="img-fluid rounded mt-3 mb-2"
                src="{{asset('images/portrait/small/avatar-s-2.jpg')}}"
                height="140"
                width="140"
                alt="User avatar"
              />
              <div class="user-info text-center">
                <h4>{{$users[0]->firstname.' '.$users[0]->lastname }}</h4>

                  @php
                    $date = new DateTime($users[0]->created_at);
                    $createdDate = $date->format('d-m-Y');

                    $isActive = null;

                     if (isset($staff[0]->updated_at) && $staff[0]->updated_at !== null){
                        $activeDate = new DateTime($staff[0]->updated_at);
                        $subscriptionDate = $activeDate->format('d-m-Y');
                        $isActive = $staff[0]->is_contact;
                     }

                    if ($isActive == 1){
                        $joinDate = $subscriptionDate;
                    }else {
                        $joinDate = $createdDate;
                    }
                  @endphp
                <p>{{ $joinDate }}</p>
                <span class="bg-light-secondary @if(isset($staff[0]->contract_type) && $staff[0]->contract_type) {{ 'badge' }} @endif"> {{ isset($staff[0]->contract_type)  ?  $staff[0]->contract_type : '' }} </span>

                  <p class="mt-1 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>" >
                      <a href="mailto:{{ $users[0]->email }}" target="_blank" class="btn btn-primary btn-sm edit-address">Send a email</a>
                  </p>

              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /User Card -->
      <!-- Plan Card -->
      <div class="card">
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-start">
            <span class="bg-light-secondary @if(isset($staff[0]->contract_type) && $staff[0]->contract_type) {{ 'badge' }} @endif"> {{ isset($staff[0]->contract_type)  ?  $staff[0]->contract_name : '' }} </span>
            <div class="d-flex justify-content-center">
              <sup class="h5 pricing-currency text-primary mt-1 mb-0">$</sup>
              <span class="fw-bolder display-5 mb-0 text-primary">99</span>
              <sub class="pricing-duration font-small-4 ms-25 mt-auto mb-2">/month</sub>
            </div>
          </div>
          <ul class="ps-1 mb-2">
          <li class="mb-50">Weekly working time: <b>{{ isset($staff[0]->weekly_working_time)  ?  $staff[0]->weekly_working_time : '' }}</b></li>
            <li class="mb-50">Daily Breaks time: <b>{{ isset($staff[0]->daily_breaks_time)  ?  $staff[0]->daily_breaks_time : '' }}</b></li>
          </ul>
          <div class="d-flex justify-content-between align-items-center fw-bolder mb-50">
            <span>Holidays per year</span>
            <span>{{ isset($staff[0]->holidays_per_year)  ?  $staff[0]->holidays_per_year : '' }}</span>
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
          <div class="d-grid w-100 mt-2 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>">

            @if(isset($staff[0]->is_contact) && $staff[0]->is_contact == 1)
              <a href="javascript:;" class="btn btn-outline-danger suspend-user">Suspended</a>
            @else
              <a href="javascript:;" class="btn btn-outline-success cancel-subscription">Re-start</a>
            @endif

          <form method="post" id="subscription-form" class="swa-confirm" action="{{ route('staff-suspent-account') }}">
            @csrf
            <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
          </form>

          </div>
        </div>
      </div>
      <!-- /Plan Card -->

         <!-- Transaction Card -->
         <div class="card">
        <div class="card-body">
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
    </div>
    <!--/ Transaction Card -->
    </div>
    <!--/ User Sidebar -->

    <!-- User Content -->
    <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
      <!-- User Pills -->
      <ul class="nav nav-pills mb-2">
        <li class="nav-item">
          <a class="nav-link active" href="{{asset('staff/'.$users[0]->id.'/view/account')}}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$users[0]->id.'/view/salary')}}">
            <i data-feather="dollar-sign" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Salary</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$users[0]->id.'/view/documents')}}">
            <i data-feather="file-text" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Documents</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$users[0]->id.'/view/notifications')}}">
            <i data-feather="bell" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Notifications</span>
          </a>
          </li>
        <li class="nav-item">
        <a class="btn btn-flat-warning" href="https://www.due.urssaf.fr/declarant/index.jsf" role="button" target="_blank">
            <i data-feather="external-link" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Faire la DPAE</span>
          </a>
        </li>
      </ul>
      <!--/ User Pills -->


     <!-- Employee Details -->
     <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Employee Details</h4>
          <button
          class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#addNewEmployeeDetailModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
          <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Gender:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->gender)  ?  $staff[0]->gender : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Username:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->username ? $users[0]->username : '' }}"
              />
              </div>
            </div>
          <!-- End -->        
            <!-- Separation -->
            <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">First name:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->firstname ? $users[0]->firstname : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Lastname:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->lastname ? $users[0]->lastname : '' }}"
              />
              </div>
            </div>
              <!-- End -->
                        <!-- Separation -->
                        <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Email:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->email ? $users[0]->email : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Mobile:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->phone ? $users[0]->phone : '' }}"
              />
              </div>
            </div>
            </div>
            </div>
            </div>
      <!--/ Employee Details -->
      

   <!-- Staff Personal Info -->
   <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Staff Personal Info</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#addNewStaffInfoModal"
          >
            Edit
            </button>
        </div>
        <div class="card-body">
          <div class="row">
          <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Birth date:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->birthday ? $users[0]->birthday : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Place Birth:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->placebirth)  ?  $staff[0]->placebirth : '' }}"
              />
              </div>
            </div>
          <!-- End -->        
            <!-- Separation -->
            <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Nationality:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->nationality)  ?  $staff[0]->nationality : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">National Insurance Number:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->nin)  ?  $staff[0]->nin : '' }}"
              />
              </div>
            </div>
              <!-- End -->
            <!-- Separation -->
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Document type:</label>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->document_type)  ?  $staff[0]->document_type : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Expiry Date:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->expiry_date)  ?  $staff[0]->expiry_date : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Identification Number:</label>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->identification_number)  ?  $staff[0]->identification_number : '' }}"
              />
              </div>
            </div>
            </div>
            </div>
      <!--/ Staff Personal Info -->


         <!-- Staff Address Info -->
         <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Staff Address Info</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#AddressStaffInfoModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-xl-7 col-12">
            <label class="form-label" for="disabledInput">Address:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->address)  ?  $staff[0]->address : '' }}, {{ isset($users[0]->postcode)  ?  $users[0]->postcode : '' }} {{ isset($users[0]->city)  ?  $users[0]->city : '' }}"
              />
            </div>
          </div>
        </div>
      </div>
      <!--/ Staff Address Info -->     
      

        <!--Emergency Contact -->
        <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Emergency Contact</h4>
          <button
            class="btn btn-primary btn-sm edit-address"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#emergencyContactModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
                        <!-- Separation -->
                        <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Name:</label>
              <small class="text-muted">eg.<i>Primary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->pri_name ? $users[0]->pri_name : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Phone:</label>
              <small class="text-muted">eg.<i>Primary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->pri_phone ? $users[0]->pri_phone : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Relationship:</label>
              <small class="text-muted">eg.<i>Primary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->pri_relationship ? $users[0]->pri_relationship : '' }}"
              />
            </div>
                <!-- End -->
             <!-- Separation -->
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Name:</label>
              <small class="text-muted">eg.<i>Secondary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->sec_name ? $users[0]->sec_name : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Phone:</label>
              <small class="text-muted">eg.<i>Secondary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->sec_phone ? $users[0]->sec_phone : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Relationship:</label>
              <small class="text-muted">eg.<i>Secondary</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ $users[0]->sec_relationship ? $users[0]->sec_relationship : '' }}"
              />
            </div>
          </div>
        </div>
        </div>
      <!--Emergency Contact -->    


      <!-- Change Password -->
    <div class="card">
        <h4 class="card-header">Change Password</h4>
        <div class="card-body">
          <form id="formChangePassword" method="POST" onsubmit="return false">
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
                    name="newPassword"
                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                  />
                  <span class="input-group-text cursor-pointer">
                    <i data-feather="eye"></i>
                  </span>
                </div>
              </div>

              <div class="mb-2 col-md-6 form-password-toggle">
                <label class="form-label" for="confirmPassword">Confirm New Password</label>
                <div class="input-group input-group-merge">
                  <input
                    class="form-control"
                    type="password"
                    name="confirmPassword"
                    id="confirmPassword"
                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                  />
                  <span class="input-group-text cursor-pointer"><i data-feather="eye"></i></span>
                </div>
              </div>
              <div>
                <button type="submit" class="btn btn-primary me-2">Change Password</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <!--/ Change Password -->


    </div>
    <!--/ User Content -->
  </div>
</section>

@include('content/_partials/_modals/modal-add-new-employee-detail')
@include('content/_partials/_modals/modal-add-new-staff-info')
@include('content/_partials/_modals/modal-address-staff-info')
@include('content/_partials/_modals/modal-add-new-staff-emergency-contact')
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/polyfill.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/moment.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/users/staff-view-account.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-wizard.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-select2.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
@endsection
