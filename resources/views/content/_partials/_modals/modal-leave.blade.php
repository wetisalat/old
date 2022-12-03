<!-- edit card modal  -->
<div class="modal fade" id="leave" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-sm-5 mx-50 pb-5">
        <h1 class="text-center mb-1">New Leave</h1>
        <p class="text-center">Add a new leave for your staffs</p>

        <!-- form -->
        <form class="row gy-1 gx-2 mt-75" onsubmit="return false">
          <div class="col-12">
          <label class="form-label" for="normalMultiSelect">Multiple Select</label>
            <select class="form-select" id="normalMultiSelect" multiple="multiple">
              <option selected="selected">Square</option>
              <option>Rectangle</option>
              <option selected="selected">Rombo</option>
              <option>Romboid</option>
              <option>Trapeze</option>
              <option>Triangle</option>
              <option selected="selected">Polygon</option>
              <option>Regular polygon</option>
              <option>Circumference</option>
              <option>Circle</option>
            </select>
          </div>
          <div class="col-12">
          <label class="form-label" for="first-name-icon">First Name</label>
            <div class="input-group input-group-merge">
              <span class="input-group-text"><i data-feather="user"></i></span>
              <input
                type="text"
                id="first-name-icon"
                class="form-control"
                name="fname-icon"
                placeholder="First Name"
              />
            </div>
          </div>

          <div class="col-md-6">
            <label class="form-label" for="modalEditCardName">Name On Card</label>
            <input type="text" id="modalEditCardName" class="form-control" placeholder="John Doe" />
          </div>

          <div class="col-6 col-md-3">
            <label class="form-label" for="modalEditCardExpiryDate">Exp. Date</label>
            <input type="text" id="modalEditCardExpiryDate" class="form-control expiry-date-mask" placeholder="MM/YY" />
          </div>

          <div class="col-6 col-md-3">
            <label class="form-label" for="modalEditCardCvv">CVV</label>
            <input
              type="text"
              id="modalEditCardCvv"
              class="form-control cvv-code-mask"
              maxlength="3"
              placeholder="654"
            />
          </div>

          <div class="col-12">
            <div class="d-flex align-items-center">
              <div class="form-check form-switch form-check-primary me-25">
                <input type="checkbox" class="form-check-input" id="editSaveCard" checked />
                <label class="form-check-label" for="editSaveCard">
                  <span class="switch-icon-left"><i data-feather="check"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>
              <label class="form-check-label fw-bolder" for="editSaveCard">Save Card for future billing?</label>
            </div>
          </div>

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
<!--/ edit card modal  -->
