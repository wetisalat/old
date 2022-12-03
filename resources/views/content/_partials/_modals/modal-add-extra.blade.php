<!-- add new shift modal  -->
<div class="modal fade" id="addNewCard" tabindex="-1" aria-labelledby="addNewCardTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-sm-5 mx-50 pb-5">
        <h1 class="text-center mb-1" id="addNewCardTitle">Add New Shift</h1>
        <p class="text-center">Add a shift for future timming</p>

        <!-- form -->
        <form id="addNewCardValidation" class="row gy-1 gx-2 mt-75" onsubmit="return false">
          <div class="col-12">
            <label class="form-label" for="shiftName">Shift name</label>
            <div class="input-group input-group-merge">
            <input
              type="text"
              id="shiftName"
              name="shiftName"
              class="form-control"
              placeholder="Shift Name"
              value=""
              data-msg="Please enter the Shift name"
              required
            />
            </div>
          </div>

          <div class="col-md-6">
          <label class="form-label" for="startTime">Start time</label>
            <input type="text" class="form-control start-time" name="start_time" placeholder="hh:mm:ss" id="startTime" required />
          </div>

          <div class="col-md-6">
            <label class="form-label" for="endingTime">Ending time</label>
            <input type="text" class="form-control ending-time" name="ending_time" placeholder="hh:mm:ss" id="endingTime" required />
          </div>

          <div class="col-md-6">
            <label for="breakTime">Break time</label>
            <input type="text" class="form-control break-time" name="break_time" placeholder="hh:mm:ss" id="breakTime" />

          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-1">Submit</button>
            <button type="reset" class="btn btn-outline-secondary mt-1" data-bs-dismiss="modal" aria-label="Close">
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--/ add new shift modal  -->