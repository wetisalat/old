@extends('layouts/contentLayoutMaster')

@section('title', 'Staff View - Salary')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/spinner/jquery.bootstrap-touchspin.css'))}}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
@endsection

@section('page-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-pickadate.css')) }}">
@endsection

@section('content')
<section class="staff-view-salary">
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

                    <p class="mt-1 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>">
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
                <form method="post" class="swa-confirm" action="{{ route('staff-suspent-account') }}">
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
          <a class="nav-link" href="{{asset('staff/'.$users[0]->id.'/view/account')}}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span></a
          >
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="{{asset('staff/'.$users[0]->id.'/view/salary')}}">
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
            <i data-feather="bell" class="font-medium-3 me-50"></i><span class="fw-bold">Notifications</span>
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

<!-- Contract -->
<div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Contract</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#contractModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
          <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Contract Type:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->contract_type)  ?  $staff[0]->contract_type : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Time Type:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->time_type)  ?  $staff[0]->time_type : '' }}"
              />
              </div>
            </div>
            <!-- Separation -->
            <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Hiring Date:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->hiring_date)  ?  $staff[0]->hiring_date : '' }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">End Date:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->end_date)  ?  $staff[0]->end_date : '' }}"
              />
              </div>
            </div>
    </div>
  </div>
  </div>
<!-- Contract -->

<!-- Qualification -->
<div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Qualification</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#wageModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
          <!-- Separation -->
          <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Statut :</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->contract_status)  ?  $staff[0]->contract_status : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Catégorie professionnelle :</label>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->categorie_professionnelle)  ?  $staff[0]->categorie_professionnelle : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Echelon :</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->echelon)  ?  $staff[0]->echelon : '' }}"
              />
            </div>
                        <!-- Separation -->
                        <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Location :</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->location_id)  ?  $staff[0]->location_name : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Position :</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->position)  ?  $staff[0]->position : '' }}"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Shift :</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($users[0]->shift_id)  ?  $shiftDa : '' }}"
              />
            </div>
    </div>
  </div>
  </div>
<!-- Qualification -->

      <!-- Salary -->
      <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Salary & Rate</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#salaryModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
          <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Monthly Salary:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->monthly_salary)  ?  $staff[0]->monthly_salary : '0.00' }}€"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Hourly Salary:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->hourly_salary)  ?  $staff[0]->hourly_salary : '0.00' }}€/per hour"
              />
              </div>
            </div>
          <!-- End -->        
            <!-- Separation -->
            <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Overtime Salary:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->overtime_salary)  ?  $staff[0]->overtime_salary : '0.00' }}€/per hour"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Bonus:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->location_id)  ?  $staff[0]->staff_bonus : '' }}"
              />
              </div>
            </div>
              <!-- End -->
            <!-- Separation -->
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Weekly working time:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->weekly_working_time)  ?  $staff[0]->weekly_working_time : '0.00' }}€"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Night amount:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->night_amount)  ?  $staff[0]->night_amount : '0.00' }}€"
              />
              </div>
            </div>
            <div class="col-xl-4 col-md-6 col-12 mb-1 mb-md-0">
              <label class="form-label" for="disabledInput">Transport amount:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{ isset($staff[0]->transport_amount)  ?  $staff[0]->transport_amount : '0.00' }}€"
              />
            </div>
                <!-- End -->
          </div>   
        </div>
      </div>
      <!--/ Salary -->


<!-- Bank Information -->
<div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Bank Information</h4>
          <button
            class="btn btn-primary btn-sm edit-address <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#bankModal"
          >
            Edit
          </button>
        </div>
        <div class="card-body">
          <div class="row">
          <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Bank name:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{$users[0]->bank_name }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">Bank account No.:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{$users[0]->account_no }}"
              />
              </div>
            </div>
            <!-- Separation -->
            <div class="col-lg-6 col-md-12 mb-1 mb-sm-0">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">IFSC Code:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{$users[0]->ifsc_code }}"
              />
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="mb-1">
              <label class="form-label" for="disabledInput">PAN No.:</label>
              <small class="text-muted">eg.<i>someone@example.com</i></small>
              <input
                type="text"
                class="form-control"
                id="readonlyInput"
                readonly="readonly"
                value="{{$users[0]->pan_no }}"
              />
              </div>
            </div>
    </div>
  </div>
  </div>
<!-- Bank Information -->


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

@include('content/_partials/_modals/modal-contract')
@include('content/_partials/_modals/modal-wage')
@include('content/_partials/_modals/modal-salary')
@include('content/_partials/_modals/modal-bank')
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
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
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/polyfill.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/spinner/jquery.bootstrap-touchspin.js'))}}"></script>

  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.time.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}

  <script src="{{ asset(mix('js/scripts/users/staff-view-salary.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-number-input.js'))}}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-wizard.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view-account.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-select2.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
@endsection
