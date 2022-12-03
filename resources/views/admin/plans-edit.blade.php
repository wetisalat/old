@extends('layouts/contentLayoutMaster')

@section('title', 'Edit Plans')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel='stylesheet' href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
@endsection
@section('page-style')
  <!-- Page css files -->
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
@endsection

@section('content')
<div class="row">
  <div class="col-12">
    <!-- profile -->
    <div class="card">
      <div class="card-header border-bottom">
        <h4 class="card-title">Edit Plans</h4>
      </div>
      <div class="card-body py-2 my-25">
        <!-- form -->
        <form method="post" class="validate-form mt-2 pt-50" action="{{ url('admin/plans', $plan->id) }}">
            @csrf
            <input type="hidden" name="_method" value="PUT">
            <div class="row">
            <div class="mb-1">
              <label class="form-label" for="">Plan Name</label>
              <input
                type="text"
                class="form-control"
                id="plans-name"
                placeholder="Enter Plan name.."
                name="name"
                value="{{ $plan->title }}"
              />
            </div>
            <div class="mb-1">
              <label class="form-label" for="">Plan Description</label>
              <input
                type="text"
                class="form-control"
                id="plans-description"
                placeholder="Description.."
                name="description"
                value="{{ $plan->description }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Plan Price</label>
              <input
                type="number"
                class="form-control"
                id="plans-price"
                placeholder="Enter Plan price.."
                name="price"
                value="{{ $plan->price }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Plan Trial</label>
              <input
                type="number"
                class="form-control"
                id="plans-trial"
                placeholder="Enter Plan trial.."
                name="trial"
                value="{{ $plan->trial_period_days }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Plan Interval</label>
              <select id="plans-interval" name="interval" class="select2 form-select">
                <option value="day" @if ('day' == $plan->interval) {{ 'selected' }} @endif>Daily</option>
                <option value="week" @if ('week' == $plan->interval) {{ 'selected' }} @endif>Weekly</option>
                <option value="month" @if ('month' == $plan->interval) {{ 'selected' }} @endif>Monthly</option>
                <option value="year" @if ('year' == $plan->interval) {{ 'selected' }} @endif>Yearly</option>
              </select>
            </div>
            <div class="mb-1">
              <label class="form-label" for="">Max team member</label>
              <div class="input-group input-group-lg">
                  <input type="number"
                        class="touchspin"
                        id="plans-teams_limit"
                        name="teams_limit"
                        value="{{ $plan->teams_limit }}"
                    />
                </div>
            </div>
            <div class="col-12">
              <button type="submit" class="btn btn-primary mt-1 me-1">Upgrade</button>
            </div>
          </div>
        </form>
        <!--/ form -->
      </div>
    </div>
  </div>
</div>
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
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
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/spinner/jquery.bootstrap-touchspin.js'))}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/admin/plans.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-number-input.js'))}}"></script>
@endsection
