<!-- Edit Staff Account Details modal -->
<div class="modal fade" id="addNewEmployeeDetailModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class="text-center mb-1" id="addNewAddressTitle">Edit Staff Account Details</h1>
        <p class="text-center mb-2 pb-75">Enter The Employee Details</p>

        <form method="post" id="addNewAddressForm" class="add-new-staff row gy-1 gx-2" action="{{ route('staff-add-account') }}">
          @csrf
          <input type="hidden" id="option" name="option" value="0"/>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
          <div class="col-12 col-md-6">
            <label class="form-label" for="gender">Gender</label>
            <select class="form-select" id="Gender" name="staff-gender">
                <option value="" selected="selected">Selected Gender</option>
                <option value="FEMALE" for="female" @if (isset($staff[0]->gender) && $staff[0]->gender == "FEMALE") {{ 'selected' }} @endif>Female</option>
                <option value="MALE" for="male" @if (isset($staff[0]->gender) && $staff[0]->gender == "MALE") {{ 'selected' }} @endif>Male</option>
            </select>
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="username">Username</label>
            <input
                type="text"
                id="Usernamen"
                class="form-control"
                placeholder="Username"
                name="staff-username"
                value="{{ $users[0]->username ? $users[0]->username : '' }}"
                data-msg="Please enter the username"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="firstname">First name</label>
            <input
                type="text"
                id="Firstname"
                class="form-control"
                placeholder="firstname"
                name="staff-firstname"
                value="{{ $users[0]->firstname ? $users[0]->firstname : '' }}"
              data-msg="Please enter the first name"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="lastname">Lastname</label>
            <input
                type="text"
                id="lastname"
                class="form-control"
                placeholder="Lastname"
                name="staff-lastname"
                value="{{ $users[0]->lastname ? $users[0]->lastname : '' }}"
              data-msg="Please enter your last name"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="email">Email</label>
            <input
                type="email"
                id="email"
                class="form-control"
                name="staff-email"
                placeholder="Email"
                value="{{ $users[0]->email ? $users[0]->email : '' }}"
                data-msg="Please enter the email address"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="phone">Mobile</label>
            <input 
                id="phone" 
                type="text" 
                class="form-control"
                name="staff-phone"
                placeholder="06xxxxxxxx"
                value="{{ $users[0]->phone ? $users[0]->phone : '' }}"
                data-msg="Please enter the mobile phone"
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
<!-- / Edit Staff Account Details modal -->
