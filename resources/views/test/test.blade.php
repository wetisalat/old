
@extends('layouts/contentLayoutMaster')

@section('title', 'Select')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
@endsection

@section('page-style')
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-pickadate.css')) }}">
@endsection

@section('content')


 <!-- Staff -->
            <div class="col-md-12">
              <label class="form-label" for="select2-multiple">Select a staff</label>
              <select class="select2 form-select" id="select-staff" multiple>
                  <option value="AK">Alaska</option>
                  <option value="HI">Hawaii</option>
                  <option value="CA">California</option>
                  <option value="NV">Nevada</option>
                  <option value="OR">Oregon</option>
              </select>
            </div>

            <!-- Shfit -->
            <div class="col-md-12">
            <label class="form-label" for="select2-limited">Select a type</label>
              <select class="select2 form-select" id="select-shitt" multiple>
                <optgroup label="Lunch">
                  <option value="lunch" selected>Lunch</option>
                  <option value="lunch2">Lunch 2</option>
                  <option value="lunch3">Lunch 3</option>
                  <option value="lunch4">Lunch 4</option>
                </optgroup>
                <optgroup label="Vacation">
                  <option value="vacation">Vacation</option>
                  <option value="vacation2">Vacation 2</option>
                  <option value="vacation3">Vacation 3</option>
                  <option value="vacation4">Vacation 4</option>
                </optgroup>
                <optgroup label="Extra">
                  <option value="extra">Extra</option>
                  <option value="extra2">Extra 2</option>
                  <option value="extra3">Extra 3</option>
                  <option value="extra4">Extra 4</option>
                </optgroup>
              </select>
            </div>

            <!-- Locations -->
            <div class="col-md-12">
            <label class="form-label" for="select2-limited">Select a locations</label>
              <select class="max-length form-select" id="select-location" multiple>
                <optgroup label="Figures">
                  <option value="romboid">Romboid</option>
                  <option value="trapeze" selected>Trapeze</option>
                  <option value="triangle">Triangle</option>
                  <option value="polygon">Polygon</option>
                </optgroup>
                <optgroup label="Colors">
                  <option value="red">Red</option>
                  <option value="green">Green</option>
                  <option value="blue">Blue</option>
                  <option value="purple">Purple</option>
                </optgroup>
              </select>
            </div>
            
<!-- Reccurents -->
<div class="demo-inline-spacing">
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch10">Monday</label>
              <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input" id="customSwitch10" checked />
                <label class="form-check-label" for="customSwitch10">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch11">Tuesday</label>
              <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input" id="customSwitch11" checked />
                <label class="form-check-label" for="customSwitch11">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch111">Wednesday</label>
              <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input" id="customSwitch111" checked />
                <label class="form-check-label" for="customSwitch111">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch12">Thursday</label>
              <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input" id="customSwitch12" checked />
                <label class="form-check-label" for="customSwitch12">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch14">Friday</label>
              <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input" id="customSwitch14" checked />
                <label class="form-check-label" for="customSwitch14">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch13">Saturday</label>
              <div class="form-check form-switch form-check-dark">
                <input type="checkbox" class="form-check-input" id="customSwitch13" checked />
                <label class="form-check-label" for="customSwitch13">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
            <div class="d-flex flex-column">
              <label class="form-check-label mb-50" for="customSwitch15">Sunday</label>
              <div class="form-check form-switch form-check-dark">
                <input type="checkbox" class="form-check-input" id="customSwitch15" checked />
                <label class="form-check-label" for="customSwitch15">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
            </div>
<!-- Reccurents Ends -->

<!-- Break -->
        <div class="card-body">
          <form action="#" class="invoice-repeater">
            <div data-repeater-list="invoice">
              <div data-repeater-item>
                <div class="row d-flex align-items-end">
                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                    <label class="form-label" for="fp-default">Break time start</label>
          <input type="text" id="break-time-start" class="form-control flatpickr-time text-start" placeholder="HH:MM" />
                    </div>
                  </div>

                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                    <label class="form-label" for="fp-time">Break time start</label>
          <input type="text" id="break-time-end" class="form-control flatpickr-time text-start" placeholder="HH:MM" />
                    </div>
                  </div>

                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                      <label class="form-label" for="staticprice">Time</label>
                      <input type="text" readonly class="form-control-plaintext" id="staticprice" value="30min" />
                    </div>
                  </div>

                  <div class="col-md-2 col-12 mb-50">
                    <div class="mb-1">
                      <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger" data-repeater-delete type="button">
                      <i data-feather='trash'></i>
                      </button>
                      <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success" data-repeater-create="button">
                      <i data-feather='plus'></i>
                      </button>
                    </div>
                  </div>
                </div>
                <hr />
              </div>
            </div>
          </form>
        </div>
        </div>
    <!-- Break  Ends-->

    <!-- Lunch -->
    <div class="card-body">
          <form action="#" class="invoice-repeater">
            <div data-repeater-list="invoice">
              <div data-repeater-item>
                <div class="row d-flex align-items-end">
                <div class="col-md-4 col-12">
                    <div class="mb-1">
                    <label class="form-label" for="select2-basic">Lunch</label>
              <select class="select2 form-select" id="select2-lunch">
                <option value="indemnite-repas">Indemnité repas</option>
                <option value="avantage-en-nature">Avantage en nature</option>
                <option value="titre-restaurant">Titre restaurant</option>
                <option value="prime-de-panier">Prime de panier</option>
              </select>
              </div>
              </div>

                  <div class="col-md-2 col-12 mb-50">
                    <div class="mb-1">
                      <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger" data-repeater-delete type="button">
                      <i data-feather='trash'></i>
                      </button>
                      <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success" data-repeater-create="button">
                      <i data-feather='plus'></i>
                      </button>
                    </div>
                  </div>
                </div>
                <hr />
              </div>
            </div>
          </form>
        </div>
        </div>
    <!-- Lunch Ends-->

    <!-- ToDo -->
    <div class="col-md-12">
              <label class="form-label" for="select2-basic">ToDo</label>
              <select class="select2 form-select" id="select2-basic">
                <option value="AK">Alaska</option>
                <option value="HI">Hawaii</option>
                <option value="CA">California</option>
                <option value="NV">Nevada</option>
                <option value="OR">Oregon</option>
              </select>
            </div> 
<!-- ToDo Ends --> 

    <!-- Note -->
    <div class="col-md-12">
    <label class="d-block form-label" for="validationBioBootstrap">Note</label>
              <textarea
                class="form-control"
                id="validationBioBootstrap"
                name="validationBioBootstrap"
                rows="3"
              ></textarea>
              </div>
<!-- Note Ends --> 


</div>


  

  
@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.time.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/repeater/jquery.repeater.min.js')) }}"></script>
@endsection
@section('page-script')
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/forms/form-select2.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-repeater.js')) }}"></script>
@endsection
