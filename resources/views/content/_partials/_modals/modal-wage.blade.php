<!-- Wage modal -->
<div class="modal fade" id="wageModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class=" text-center mb-1" id="addNewAddressTitle">Qualification</h1>

        <form method="post" id="addNewAddressForm" class="add-wage row gy-1 gx-2" action="{{ route('staff-add-salary') }}">
          @csrf
          <input type="hidden" id="option" name="option" value="0"/>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>

          <div class="col-12 col-md-4">
          <label class="form-label" for="contract_status">Statut</label>
          <select id="modalContractStatus" id="contract_status" name="wage-contract_status" class="select2 form-select">
              <option value="Cadre" @if (isset($staff[0]->contract_status) && $staff[0]->contract_status == "Cadre") {{ 'selected' }} @endif>Cadre</option>
              <option value="Non Cadre" @if (isset($staff[0]->contract_status) && $staff[0]->contract_status == "Non Cadre") {{ 'selected' }} @endif>Non Cadre</option>
              <option value="Ouvriers et employés" @if (isset($staff[0]->contract_status) && $staff[0]->contract_status == "Ouvriers et employés") {{ 'selected' }} @endif>Ouvriers et employés</option>
              <option value="Techniciens et agents de maîtrise" @if (isset($staff[0]->contract_status) && $staff[0]->contract_status == "Techniciens et agents de maîtrise") {{ 'selected' }} @endif>Techniciens et agents de maîtrise</option>
            </select>
          </div>
          <div class="col-12 col-md-4">
          <label class="form-label" for="categorie_professionnelle">Catégorie professionnelle</label>
          <select id="modalCategorieProfessionnelle" id="categorie_professionnelle" name="wage-categorie_professionnelle" class="select2 form-select">
              <option value="Employés" @if (isset($staff[0]->categorie_professionnelle) && $staff[0]->categorie_professionnelle == "Employés") {{ 'selected' }} @endif>Employés</option>
              <option value="Agents de maîtrise" @if (isset($staff[0]->categorie_professionnelle) && $staff[0]->categorie_professionnelle == "Agents de maîtrise") {{ 'selected' }} @endif>Agents de maîtrise</option>
              <option value="Ingénieurs et Cadres (IC)" @if (isset($staff[0]->categorie_professionnelle) && $staff[0]->categorie_professionnelle == "Ingénieurs et Cadres (IC)") {{ 'selected' }} @endif>Ingénieurs et Cadres (IC)</option>
              <option value="Ouvriers" @if (isset($staff[0]->categorie_professionnelle) && $staff[0]->categorie_professionnelle == "Ouvriers") {{ 'selected' }} @endif>Ouvriers</option>
            </select>
          </div>
          <div class="col-12 col-md-4">

          <label class="form-label" for="echelon">Echelon</label>
          <select id="modalTimeType" id="echelon" name="wage-echelon" class="select2 form-select">
              <option value="1" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "1") {{ 'selected' }} @endif>1</option>
              <option value="2" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "2") {{ 'selected' }} @endif>2</option>
              <option value="3" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "3") {{ 'selected' }} @endif>3</option>
              <option value="4" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "4") {{ 'selected' }} @endif>4</option>
              <option value="5" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "5") {{ 'selected' }} @endif>5</option>
              <option value="6" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "6") {{ 'selected' }} @endif>6</option>
              <option value="7" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "7") {{ 'selected' }} @endif>7</option>
              <option value="8" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "8") {{ 'selected' }} @endif>8</option>
              <option value="9" @if (isset($staff[0]->echelon) && $staff[0]->echelon == "9") {{ 'selected' }} @endif>9</option>
            </select>
          </div>

          <div class="col-12 col-md-4">
            <label class="form-label" for="team">Location</label>
            <select class="form-control" name="location_id" id="location_id">
                <option value="" selected="selected">Select location</option>
                @foreach($locations as $location)
                    <option value="{{ $location->id }}" @if (isset($staff[0]->location_id) && $staff[0]->location_id == $location->id) {{ 'selected' }} @endif>{{ $location->name }}</option>
                @endforeach
            </select>
          </div>
          <div class="col-12 col-md-4">
            <label class="form-label" for="position">Position</label>
              <input
                      type="text"
                      id="position"
                      class="form-control"
                      placeholder="Position"
                      name="position"
                      value="{{ isset($staff[0]->position)  ?  $staff[0]->position : '' }}"
                      data-msg="Please enter the position"
              />

          </div>


          <div class="col-12 col-md-4">

              @php
                  $shiftId = [];
                    if (isset($users[0]->shift_id)){
                      $shiftId = explode(",", $users[0]->shift_id);
                    }
              @endphp

          <label class="form-label" for="shiftId">Select Shift</label>

              <select class="select2 w-100" name="shift_id[]" id="shiftId" multiple>
                  <optgroup label="shifts">
                      @foreach($shifts as $sftData)
                          <option value="{{$sftData->id}}" <?php echo in_array($sftData->id, $shiftId) ? 'selected' : ''; ?>>{{$sftData->name}}</option>
                      @endforeach
                  </optgroup>
              </select>

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
