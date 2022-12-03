@extends('layouts/contentLayoutMaster')

@section('title', 'Extra')

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
  <a class="nav-link active" href="{{asset('settings/extra')}}">
    <i data-feather="sliders" class="font-medium-3 me-50"></i>
    <span class="fw-bold">Extra</span>
  </a>
</li>
    </ul>

    <!-- Role cards -->
<div class="row">
  @foreach(array_merge($lunch_amount, $night_amount, $transport_amount) as $row)
  <div class="col-xl-4 col-lg-6 col-md-6">
    <div class="card">
      <div class="card-body">
        <div>
          <span>Type {{ $row->type }}</span>
        </div>
        <div class="d-flex justify-content-between align-items-end mt-1 pt-25">
          <div class="role-heading">
            <h4 class="fw-bolder">{{ isset($row->lunch) ? $row->lunch->name : $row->name }}</h4>
              <p>
                {{ $row->amount }}
              </p>
            <a href="javascript:;" class="role-edit-modal" data-bs-toggle="modal" data-bs-target="#addNewCard" id="" onclick="editExtraDetails('{{ $row->id }}', '{{ $row->type }}')">
              <small class="fw-bolder">Edit Extra</small>
            </a>
          </div>
          <a href="javascript:void(0);" class="text-body" id="" onclick="removeExtra('{{ $row->id }}', '{{ $row->type }}')"><i data-feather="trash-2" class="font-medium-3 text-danger"></i></a>
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
              class="stretched-link text-nowrap add_new_extra"
            >
              <span class="btn btn-primary mb-1" id="exampleModalLabel">Add New Extra</span>
            </a>
            <p class="mb-0">Add extra, if it does not exist</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/ Role cards -->
  </div>
</div>

@include('content/_partials/_modals/modal-add-new-extra')
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
  <script src="{{ asset(mix('js/scripts/users/extra.js')) }}"></script>
@endsection

