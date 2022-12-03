<!-- Wage modal -->
<div class="modal fade" id="contractModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class=" text-center mb-1" id="addNewAddressTitle">Contract</h1>

        <form method="post" id="addNewAddressForm" class="add-wage row gy-1 gx-2" action="{{ route('staff-add-salary') }}">
          @csrf
          <input type="hidden" id="option" name="option" value="0"/>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>

            <div class="col-12 col-md-6">
            <label class="form-label" for="contract_type">Contract Type</label>
            <select id="modalContractType" id="contract_type" name="wage-contract_type" class="select2 form-select">
              <option value="">Select a Document</option>
              <option value="Apprenti" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Apprenti") {{ 'selected' }} @endif>Apprenti</option>
              <option value="CDD" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "CDD") {{ 'selected' }} @endif>CDD</option>
              <option value="CDD Saisonnier" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "CDD Saisonnier") {{ 'selected' }} @endif>CDD Saisonnier</option>
              <option value="CDI" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "CDI") {{ 'selected' }} @endif>CDI</option>
              <option value="CTT" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "CTT") {{ 'selected' }} @endif>CTT</option>
              <option value="CUI" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "CUI") {{ 'selected' }} @endif>CUI</option>
              <option value="Extra" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Extra") {{ 'selected' }} @endif>Extra</option>
              <option value="Mise à disposition" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Mise à disposition") {{ 'selected' }} @endif>Mise à disposition</option>
              <option value="Professionnalisation" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Professionnalisation") {{ 'selected' }} @endif>Professionnalisation</option>
              <option value="Stage" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Stage") {{ 'selected' }} @endif>Stage</option>
              <option value="Temporaire" @if (isset($staff[0]->contract_type) && $staff[0]->contract_type == "Temporaire") {{ 'selected' }} @endif>Temporaire</option>
            </select>
          </div>

          <div class="col-12 col-md-6">
            <label class="form-label" for="time_type">Time Type</label>
            <select id="modalTimeType" id="time_type" name="wage-time_type" class="select2 form-select">
              <option value="">Select a Time</option>
              <option value="Temps plein" @if (isset($staff[0]->time_type) && $staff[0]->time_type == "Temps plein") {{ 'selected' }} @endif>Temps plein</option>
              <option value="Temps partiel" @if (isset($staff[0]->time_type) && $staff[0]->time_type == "Temps partiel") {{ 'selected' }} @endif>Temps partiel</option>
            </select>
          </div>

          <div class="col-12 col-md-6">
          <label class="form-label" for="hiring_date">Hiring Date</label>
            <input
                type="text"
                id="hiring_date"
                class="form-control flatpickr-basic"
                placeholder="DD-MM-YYYY"
                name="wage-hiring_date"
                value="{{ isset($staff[0]->hiring_date)  ?  $staff[0]->hiring_date : '' }}"
               data-msg="Please enter the hiring date"
            />
          </div>
          <div class="col-12 col-md-6">
          <label class="form-label" for="end_date">End Date</label>
            <input
                type="text"
                id="end_date"
                class="form-control flatpickr-basic"
                placeholder="DD-MM-YYYY"
                name="wage-end_date"
                value="{{ isset($staff[0]->end_date)  ?  $staff[0]->end_date : '' }}"
               data-msg="Please enter the End Date"
            />
          </div>
          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-2">Submit</button>
            <button type="reset" class="btn btn-outline-secondary mt-2" data-bs-dismiss="modal" aria-label="Close">
              Discard
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
  </div>
  </div>
</div>
<!-- / Wage modal -->
