@extends('layouts/contentLayoutMaster')

@section('title', 'Shift')

@section('vendor-style')
  <!-- Vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
@endsection
@section('page-style')
  <!-- Page css files -->
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
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
        <a class="nav-link" href="{{asset('settings/billing')}}">
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
        <a class="nav-link active" href="{{asset('settings/shift')}}">
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

    <!-- Role cards -->
<div class="row">

    @foreach($attributes as $key => $attribute)

  <div class="col-xl-4 col-lg-6 col-md-6">
    <div class="card">
      <div class="card-body">
        <div class="d-flex justify-content-between">

          <span>Total {{ count($attribute['users']) }} Staffs</span>

          <ul class="list-unstyled d-flex align-items-center avatar-group mb-0">

            @foreach($attribute['users'] as $userData)
              <li
                data-bs-toggle="tooltip"
                data-popup="tooltip-custom"
                data-bs-placement="top"
                title="{{ $userData['name'] }}"
                class="avatar avatar-sm pull-up"
              >
                <img class="rounded-circle" src="{{$userData['profile_photo_url']}}" alt="Avatar" />
              </li>
            @endforeach

          </ul>

        </div>

        <div class="d-flex justify-content-between align-items-end mt-1 pt-25">
          <div class="role-heading">
            <h4 class="fw-bolder">{{ $attribute['name'] }}</h4>
            <ul class="list-unstyled list-inline">
              <li style="width: 50%">Start time: <span style="font-weight: bold;">{{ \Carbon\Carbon::parse($attribute['start_time'])->format('h:i a') }}</span></li>
              <li>End time: <strong>{{ \Carbon\Carbon::parse($attribute['end_time'])->format('h:i a') }}</strong></li>
              <li style="width: 50%">Break time: <strong>{{ $attribute['break_time'] }}</strong></li>
              <li>Working Time: <span id="dataWorkingTime"><strong>{{ $attribute['working_time'] }}</strong></span></li>
            </ul>

            <a href="javascript:;" class="role-edit-modal" data-bs-toggle="modal" data-bs-target="#addNewCard" id="{{ $attribute['id'] }}" onclick="editShiftDetails(this.id)">
              <small class="fw-bolder">Edit Shift</small>
            </a>
          </div>
          <a href="javascript:void(0);" class="text-body" id="{{ $attribute['id'] }}" onclick="removeshift(this.id)"><i data-feather="trash-2" class="font-medium-5"></i></a>
        </div>
      </div>
    </div>
  </div>
    @endforeach



  <div class="col-xl-4 col-lg-6 col-md-6">
    <div class="card">
      <div class="row">
        <div class="col-sm-5">
          <div class="d-flex align-items-end justify-content-center h-100">
            <img
              src="{{asset('images/illustration/faq-illustrations.svg')}}"
              class="img-fluid mt-2"
              alt="Image"
              width="85"
            />
          </div>
        </div>
        <div class="col-sm-7">
          <div class="card-body text-sm-end text-center ps-sm-0">
            <a
              href="javascript:void(0)"
              data-bs-target="#addNewCard"
              data-bs-toggle="modal"
              class="stretched-link text-nowrap add_new_shift"
            >
              <span class="btn btn-primary mb-1" id="exampleModalLabel">Add New Shift</span>
            </a>
            <p class="mb-0">Add shift, if it does not exist</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/ Role cards -->
  </div>
</div>

@include('content/_partials/_modals/modal-add-new-shift')
@endsection

@section('vendor-script')
  <!-- Vendor js files -->
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.time.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
@endsection
@section('page-script')
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/pages/app-access-roles.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/shift.js')) }}"></script>
@endsection

