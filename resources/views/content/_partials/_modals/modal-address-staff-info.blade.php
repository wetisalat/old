<!-- Edit Staff Address Info modal -->
<div class="modal fade" id="AddressStaffInfoModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class=" text-center mb-1" id="addNewAddressTitle">Edit Staff Address Info</h1>
        <p class="text-center mb-2 pb-75">Enter The Staff Address Info.</p>

        <form method="post" id="addNewAddressForm" class="add-staff-info row gy-1 gx-2" action="{{ route('staff-add-account') }}">
          @csrf
          <input type="hidden" id="option" name="option" value="1"/>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
          <div class="col-12">
            <label class="form-label" for="address">Address</label>
            <input
              type="text"
              id="address"
              class="form-control"
              name="info-address"
              placeholder="Address"
              value="{{ isset($staff[0]->address)  ?  $staff[0]->address : '' }}"
              data-msg="Please enter the Address"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="postcode">Postcode</label>
            <input
              type="text"
              id="postcode"
              class="form-control"
              name="info-postcode"
              placeholder="75000"
              value="{{ $users[0]->postcode ? $users[0]->postcode : '' }}"
              data-msg="Please enter the Postcode"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="city">City</label>
              <input
                type="text"
                id="city"
                class="form-control"
                name="info-city"
                placeholder="Paris"
                value="{{ $users[0]->city ? $users[0]->city : '' }}"
                data-msg="Please enter the City"
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
<!-- / Edit Staff Address Info modal -->
