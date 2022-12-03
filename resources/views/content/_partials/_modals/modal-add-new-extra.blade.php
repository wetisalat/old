<!-- add new card modal  -->
<div class="modal fade" id="addNewCard" tabindex="-1" aria-labelledby="addNewCardTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-sm-5 mx-50 pb-5">
        <h1 class="text-center mb-1" id="addNewCardTitle">Add New Extra</h1>
        <p class="text-center">Add Extra for future timming</p>

        <!-- form -->
        <form id="extraDataForm" class="row gy-1 gx-2 mt-75">
          <div class="col-12">
            <label class="form-label" for="">Extra Type</label>
              <select
                id="extraType"
                name="type"
                class="form-control"
                required
              >
                <option>Select</option>
                <option value="lunch">Lunch</option>
                <option value="night">Night</option>
                <option value="transport">Transport</option>
              </select>
            </div>

          <div class="col-md-6">
            <label class="form-label" for="">Name</label>
            <input type="text" id="extraName" name="extra_name" class="form-control" />
            <select
                id="extraNameDropdown"
                name="lunch_id"
                class="form-control"
                required
              >
                <option>Select</option>
                @foreach($lunch as $row)
                  <option value="{{ $row->id }}">{{ $row->name }}</option>
                @endforeach
              </select>
          </div>
          <div class="col-md-6">
            <label class="form-label" for="extraAmount">Amount</label>
            <input type="text" id="extraAmount" name="amount" class="form-control" />
          </div>

            <input type="hidden" name="extraId" id="extraId" >

          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-1" id="submitExtraData">Submit</button>
            <button type="submit" class="btn btn-primary me-1 mt-1 d-none" id="updateExtraData">Update</button>
            <button type="reset" class="btn btn-outline-secondary mt-1" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--/ add new card modal  -->
