
@extends('layouts/contentLayoutMaster')

@section('title', 'Leave modal')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
@endsection

@section('page-style')
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-flat-pickr.css')) }}">
<link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/pickers/form-pickadate.css')) }}">
@endsection

@section('content')
<section>
  <div class="card">
    <div class="card-header">
        <h4 class="card-title">For Leave modal</h4>
    </div>
    <div class="card-body">

      <div class="row">
        <div class="demo-inline-spacing">
            <div class="form-check form-check-inline">
              <input
              class="form-check-input"
              type="radio"
              name="inlineRadioOptions"
              id="inlineRadio1"
              value="option1"
              checked
              />
              <label class="form-check-label" for="inlineRadio1">Full day</label>
            </div>
          <div class="form-check form-check-inline">
            <input
            class="form-check-input"
            type="radio"
            name="inlineRadioOptions"
            id="inlineRadio2"
            value="option2"
            />
            <label class="form-check-label" for="inlineRadio2">Partial day</label>
          </div>
        </div>
      </div> 

    <!-- Full day -->
      <div class="row">
      <div class="col-md-4 col-12">
          <label class="form-label" for="fp-multiple">Select the dates</label>
          <input type="text" id="fp-multiple" class="form-control flatpickr-multiple" placeholder="YYYY-MM-DD" />
        </div>
      <!-- Harf day -->
      <div class="col-md-2 col-12">
              <label class="form-label" for="fp-default">From</label>
              <input type="text" id="hd-from" class="form-control flatpickr-time text-start" placeholder="HH:MM" />
            </div>
            <div class="col-md-2 col-12">
              <label class="form-label" for="fp-time">To</label>
              <input type="text" id="hd-to" class="form-control flatpickr-time text-start" placeholder="HH:MM" />
            </div>
          </div>

    <!-- Staff -->
      <div class="row">
        <div class="col-md-12">
        <label class="form-label" for="select2-basic">Select a staff</label>
            <select class="select2 form-select" id="select2-staff">
              <option value="AK">Alaska</option>
              <option value="HI">Hawaii</option>
              <option value="CA">California</option>
              <option value="NV">Nevada</option>
              <option value="OR">Oregon</option>
            </select>
        </div>
      </div>  

    <!-- Reason -->
    <div class="row">
        <div class="col-md-12">
          <label class="form-label" for="select2-basic">Select a reason</label>
            <select class="select2 form-select" id="select2-reason">
              <option value="">Select a reason type</option>
              <option value="">Arr??t maladie</option>
              <option value="">Cong?? pay??</option>
              <option value="">Repos hebdomadaire</option>
              <option value="">Absence injustifi??e</option>
              <option value="">Accident du travail</option>
              <option value="">Ch??mage partiel</option>
              <option value="">Cong?? maternit??</option>
              <option value="">Cong?? parental</option>
              <option value="">Cong?? paternit??</option>
              <option value="">Cong?? sans solde</option>
              <option value="">??v??nement familial</option>
              <option value="">Formation</option>
              <option value="">Indisponibilit?? ponctuel</option>
              <option value="">Jour f??ri??</option>
              <option value="">Maladie professionnelle</option>
              <option value="">Mise ?? pied conservatoire</option>
              <option value="">Mise ?? pied disciplinaire</option>
              <option value="">Repos compensateur d'habillement</option>
              <option value="">Repos compensateur de nuit</option>
              <option value="">Visite m??dicale</option>
            </select>
        </div>
      </div>       

    <!-- Note -->
      <div class="row">
        <div class="col-md-12">
          <label class="d-block form-label" for="validationBioBootstrap">Note</label>
            <textarea
            class="form-control"
            id="validationBioBootstrap"
            name="validationBioBootstrap"
            rows="3"
            ></textarea>
        </div>
      </div> 

    </div>
  </div>  
</section>  
@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.time.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
@endsection
@section('page-script')
  <!-- Page js files -->
  <script src="{{ asset(mix('js/scripts/forms/pickers/form-pickers.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/forms/form-select2.js')) }}"></script>
@endsection
