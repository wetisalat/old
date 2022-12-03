<!-- add new card modal  -->
<div class="modal fade" id="addNewCard" tabindex="-1" aria-labelledby="addNewCardTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-sm-5 mx-50 pb-5">
        <h1 class="text-center mb-1" id="addNewCardTitle">Add New Shift</h1>
        <p class="text-center">Add Shift for future timming</p>

        <!-- form -->
        <form id="addNewCardValidation" class="row gy-1 gx-2 mt-75" onsubmit="return false" name="addShift" onmouseleave="calculate()">
          <div class="col-8">
            <label class="form-label" for="">Shift Name</label>
              <input
                type="text"
                id="shiftName"
                name="shiftname"
                class="form-control"
                placeholder="Shift Name"
                data-msg="Please enter Shift Name"
                required
              />
            </div>

          <div class="col-md-4">
            <label class="form-label" for="">Working Time</label>
            <input type="text" id="workingTime" name="working_time" class="form-control text-start" placeholder="HH:MM" />
          </div>

          <div class="col-md-4">
            <label class="form-label" for="">Start Time</label>
            <input type="text" id="startTime" name="start_time" class="form-control flatpickr-time text-start" placeholder="HH:MM" required />
          </div>

          <div class="col-md-4" >
          <label class="form-label" for="">End Time</label>
            <input type="text" id="endingTime" name="ending_time" class="form-control flatpickr-time text-start" placeholder="HH:MM" />
          </div>

          <div class="col-md-4">
            <label class="form-label" for="workingTime">Break Time</label>
            <input type="text" id="breakTime" name="break_time" class="form-control text-start" placeholder="HH:MM" />
          </div>

            <input type="hidden" name="shiftId" id="shiftId" >

          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-1" id="submitShiftData">Submit</button>
            <button type="submit" class="btn btn-primary me-1 mt-1 d-none" id="updateShiftData">Update</button>
            <button type="reset" class="btn btn-outline-secondary mt-1" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--/ add new card modal  -->
