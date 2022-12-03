@extends('layouts/contentLayoutMaster')

@section('title', 'Edit Counpons')

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
        <h4 class="card-title">Edit Counpons</h4>
      </div>
      <div class="card-body py-2 my-25">
        <!-- form -->
        <form method="post" class="validate-form mt-2 pt-50" action="{{ url('admin/coupons', $coupon->id) }}">
            @csrf  
            <input type="hidden" name="_method" value="PUT">
            <div class="row">
            <div class="mb-1">
              <label class="form-label" for="">Coupon name</label>
              <input
                type="text"
                class="form-control"
                id="name"
                placeholder="Enter Coupon name.."
                name="name"
                value="{{ $coupon->name }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Coupon Code</label>
              <input
                type="text"
                class="form-control"
                id="gateway_id"
                placeholder="Exp: 25OFF"
                name="gateway_id"
                value="{{ $coupon->gateway_id }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Percentage Off</label>
              <input
                type="number"
                class="form-control"
                id="percent_off"
                placeholder="Enter Plan price.."
                name="percent_off"
                value="{{ $coupon->percent_off }}"
              />
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Duration</label>
              <select id="duration" class="select2 form-select" name="duration">
                <option value="once" @if ('once' == $coupon->duration) {{ 'selected' }} @endif>Once</option>
                <option value="repeating" @if ('repeating' == $coupon->duration) {{ 'selected' }} @endif>Repeating</option>
                <option value="forever" @if ('forever' == $coupon->duration) {{ 'selected' }} @endif>Forever</option>
              </select>
            </div>
            <div class="mb-1">
            <label class="form-label" for="">Duration in months</label>
            <i
              data-feather='info'
              data-bs-toggle="tooltip"
              data-bs-animation="false"
              title="Required only if duration is repeating, in which case it must be a positive integer that specifies the number of months the discount will be in effect."
             >
             </i>
              <input
                type="text"
                class="form-control"
                id="duration_in_months"
                placeholder="Duration.."
                name="duration_in_months"
                value="{{ $coupon->duration_in_months }}"
              />
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
