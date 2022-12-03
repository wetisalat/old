<!-- edit card modal  -->
<div class="modal fade" id="cancel" tabindex="-1" aria-labelledby="editCardTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header bg-transparent">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body px-sm-5 mx-50 pb-5">
          <h1 class="text-center mb-1" id="editCardTitle">Cancel Subscribtion</h1>
          <p class="text-center">Cancelation reason</p>

          <!-- form -->
          <form id="editCardValidation" class="row gy-1 gx-2 mt-75" action="{{ route('cancel') }}" method="POST">
                @csrf
            <div class="col-12">
              <div class="form-group">
                <label class="input-label" for="exampleFormControlSelect1">Cancelation reason </label>
                <select id="reason" name="reason" required class="form-control">
                  <option>Choose an option</option>
                    <option value="Too expensive">Too expensive</option>
                    <option value="Lacks features">Lacks features</option>
                    <option value="Not what I expected">Not what I expected</option>
                </select>
              </div>
            </div>
            </div>

            <div class="col-12 text-center pb-2">
              <button type="submit" class="btn btn-primary me-1 mt-1">Cancel Subscriptions</button>
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
