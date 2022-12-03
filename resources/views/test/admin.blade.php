
@extends('layouts/contentLayoutMaster')

@section('title', 'Location List')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/forms/wizard/bs-stepper.min.css')) }}">

@endsection

@section('page-style')
  <!-- Page css files -->
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-wizard.css')) }}">
@endsection

@section('content')
<!-- Hoverable rows start -->
<div class="row" id="table-hover-row">
  <div class="col-12">

    <div class="card">
        <div class="card-header">
          <h4 class="card-title mb-50">Location List</h4>
          <button
            class="btn btn-primary btn-sm edit-address"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#locationModal"
          >
            Add
          </button>
        </div>
      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Project</th>
              <th>Client</th>
              <th>Users</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/angular.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Angular"
                />
                <span class="fw-bold">Angular Project</span>
              </td>
              <td>Peter Charls</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-primary me-1">Active</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/react.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="React"
                />
                <span class="fw-bold">React Project</span>
              </td>
              <td>Ronald Frest</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-success me-1">Completed</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/vuejs.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Vuejs"
                />
                <span class="fw-bold">Vuejs Project</span>
              </td>
              <td>Jack Obes</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-info me-1">Scheduled</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <img
                  src="{{asset('images/icons/bootstrap.svg')}}"
                  class="me-75"
                  height="20"
                  width="20"
                  alt="Bootstrap"
                />
                <span class="fw-bold">Bootstrap Project</span>
              </td>
              <td>Jerry Milton</td>
              <td>
                <div class="avatar-group">
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Lilian Nenez"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-5.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-6.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                  <div
                    data-bs-toggle="tooltip"
                    data-popup="tooltip-custom"
                    data-bs-placement="top"
                    class="avatar pull-up my-0"
                    title="Alberto Glotzbach"
                  >
                    <img
                      src="{{asset('images/portrait/small/avatar-s-7.jpg')}}"
                      alt="Avatar"
                      height="26"
                      width="26"
                    />
                  </div>
                </div>
              </td>
              <td><span class="badge rounded-pill badge-light-warning me-1">Pending</span></td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow py-0" data-bs-toggle="dropdown">
                    <i data-feather="more-vertical"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">
                      <i data-feather="edit-2" class="me-50"></i>
                      <span>Edit</span>
                    </a>
                    <a class="dropdown-item" href="#">
                      <i data-feather="trash" class="me-50"></i>
                      <span>Delete</span>
                    </a>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- Hoverable rows end -->
@include('content/_partials/_modals/modal-location')
@endsection


@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/forms/wizard/bs-stepper.min.js')) }}"></script>
@endsection

@section('page-script')
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/users/modal-location.js')) }}"></script>
@endsection