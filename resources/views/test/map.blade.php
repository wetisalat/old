@extends('layouts/contentLayoutMaster')

@section('title', 'Map')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/maps/leaflet.min.css')) }}">
@endsection

@section('page-style')
 <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/maps/map-leaflet.css')) }}">
@endsection

@section('content')
<section class="maps-leaflet">
  <div class="row">
  @if (Auth::User()->role_id == 0)
    <!-- Admin Starts -->
    <div class="col-12">
      <div class="card mb-4">
        <div class="card-header">
          <h4 class="card-title">You are in Admin code</h4>
        </div>
        <h1></h1>
        </div>
      </div>
    </div>
    <!-- /Admin Ends -->
    @endcan

    @if (Auth::User()->role_id == 1)
        <!-- User Starts -->
        <div class="col-12">
      <div class="card mb-4">
        <div class="card-header">
          <h4 class="card-title">You are in User code</h4>
        </div>
        <h1></h1>
        </div>
        <div class="mb-1">
        <h1>Laravel current time is</h1>
        <h3>{{ date('d/m/Y H:i:s') }}</h3>
        </div>
      </div>
    </div>
    <!-- /User Ends -->
    @endcan

    @if (Auth::User()->role_id == 2)
        <!-- Staff Starts -->
        <div class="col-12">
      <div class="card mb-4">
        <div class="card-header">
          <h4 class="card-title">You are in Staff code</h4>
        </div>
        <h1></h1>
        </div>
      </div>
    </div>
    <!-- /Staff Ends -->
    @endcan
    
  </div>
</section>
@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/maps/leaflet.min.js'))}}"></script>
@endsection
@section('page-script')
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/maps/map-leaflet.js'))}}"></script>
@endsection
