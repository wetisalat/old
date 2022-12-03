@extends('layouts/contentLayoutMaster')

@section('title', 'Staff View - Documents')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/file-uploaders/dropzone.min.css')) }}">
@endsection

@section('page-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-file-uploader.css')) }}">
@endsection

@section('content')
<section class="app-user-view-security">
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
                        <a href="mailto:{{ $email = $users[0]->email }}" target="_blank" class="btn btn-primary btn-sm edit-address">Send a email</a>
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
              <div class="d-grid w-100 mt-2 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>" >
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
          <a class="nav-link" href="{{asset('staff/'.$users[0]->id.'/view/salary')}}">
            <i data-feather="dollar-sign" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Salary</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="{{asset('staff/'.$users[0]->id.'/view/documents')}}">
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

      <!-- multi file upload starts -->
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Multiple Files Upload</h4>
        </div>
        <div class="card-body">
          <p class="card-text">
            By default, dropzone is a multiple file uploader. User can either click on the dropzone area and select
            multiple files or just drop all selected files in the dropzone area. This example is the most basic setup
            for dropzone.
          </p>
          <button id="" class="btn btn-outline-primary mb-1">
            <i data-feather="file"></i> Click me to upload files
          </button>
          <form method="POST" action="{{ route('staff-add-documents') }}" class="dropzone dropzone-area" id="dpz-multiple-files">
            @csrf
            <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
            <div class="dz-message">Drop files here or click to upload.</div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- multi file upload ends -->

  <!-- Documents table -->
  <div class="card">
        <table class="invoice-table table text-nowrap">
          <thead>
            <tr>
              <th></th>
              <th>#ID</th>
              <th>File name</th>
              <th class="text-truncate">Issued Date</th>
              <th class="cell-fit">Actions</th>
            </tr>
          </thead>
        </table>
      </div>
      <!-- /Documents table -->
    </div>
    <!--/ User Content -->
  </div>
</section>

@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/file-uploaders/dropzone.min.js')) }}"></script>
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

@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/forms/form-file-uploader.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view-documents.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view.js')) }}"></script>
@endsection
