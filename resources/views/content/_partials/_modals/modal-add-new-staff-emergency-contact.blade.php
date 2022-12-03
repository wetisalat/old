<!-- Edit Staff Personal Info modal -->
<div class="modal fade" id="emergencyContactModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class=" text-center mb-1" id="addNewAddressTitle">Edit Emergency Contact</h1>
        <p class="text-center mb-2 pb-75">Enter Emergency Contact</p>

        <form method="post" id="addNewAddressForm" class="add-emergency-contact row gy-1 gx-2" action="{{ route('emergency-contact') }}">
          @csrf

          <h4>Primary</h4>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
          <div class="col-12 col-md-6">
            <label class="form-label" for="primaryName">Name</label>
            <input
              id="primaryName"
              type="text"
              class="form-control date-mask"
              name="pri_name"
              placeholder="Name"
              value="{{ $users[0]->pri_name ? $users[0]->pri_name : '' }}"
              data-msg="Please enter the primary name"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="primaryRelationship">Relationship</label>
            <input
                type="text"
                id="primaryRelationship"
                class="form-control"
                placeholder="Relationship"
                name="pri_relationship"
                value="{{ $users[0]->pri_relationship ? $users[0]->pri_relationship : '' }}"
               data-msg="Please enter the primary relationship"
            />
          </div>
          <div class="col-12 col-md-12 mb-2">
            <label class="form-label" for="primaryPhone">Phone</label>
            <input
              type="number"
              id="primaryPhone"
              class="form-control"
              name="pri_phone"
              placeholder="Number"
              value="{{ $users[0]->pri_phone ? $users[0]->pri_phone : '' }}"
              data-msg="Please enter the Primary Phone Number"
            />
          </div>




            <h4 class="mt-2">Secondary</h4>
            <div class="col-12 col-md-6">
                <label class="form-label" for="secName">Name</label>
                <input
                    id="secName"
                    type="text"
                    class="form-control date-mask"
                    name="sec_name"
                    placeholder="Name"
                    value="{{ $users[0]->sec_name ? $users[0]->sec_name : '' }}"
                    data-msg="Please enter the secondary name"
                />
            </div>
            <div class="col-12 col-md-6">
                <label class="form-label" for="secRelationship">Relationship</label>
                <input
                    type="text"
                    id="secRelationship"
                    class="form-control"
                    placeholder="Relationship"
                    name="sec_relationship"
                    value="{{ $users[0]->sec_relationship ? $users[0]->sec_relationship : '' }}"
                    data-msg="Please enter the secondary relationship"
                />
            </div>
            <div class="col-12 col-md-12">
                <label class="form-label" for="secPhone">Phone</label>
                <input
                    type="number"
                    id="secPhone"
                    class="form-control"
                    name="sec_phone"
                    placeholder="Number"
                    value="{{ $users[0]->sec_phone ? $users[0]->sec_phone : '' }}"
                    data-msg="Please enter the secondary phone number"
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
<!-- / Edit Staff Personal Info modal -->
