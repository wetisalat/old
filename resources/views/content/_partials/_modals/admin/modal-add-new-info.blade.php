<!-- add new address modal -->
<div class="modal fade" id="addNewInfoModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class="address-title text-center mb-1" id="addNewAddressTitle">Add New Infos</h1>
        <p class="address-subtitle text-center mb-2 pb-75">Add infos for billing</p>

        <form id="addNewAddressForm" class="row gy-1 gx-2" method="POST" method="POST" onsubmit="return false">

            <input type="hidden" id="address_form" name="address_form" value="address_form">
            <input type="hidden" id="userId" name="user_id" value="{{ $user->id }}">

          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressFirstName">First Name</label>
            <input
              type="text"
              id="modalAddressFirstName"
              name="firstname"
              class="form-control"
              placeholder="John"
              value="{{ $user->firstname }}"
              data-msg="Please enter your first name"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressLastName">Last Name</label>
            <input
              type="text"
              id="modalAddressLastName"
              name="lastname"
              class="form-control"
              placeholder="Doe"
              value="{{ $user->lastname }}"
              data-msg="Please enter your last name"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressEmail">Email</label>
            <input
              type="text"
              id="modalAddressEmail"
              name="email"
              class="form-control"
              placeholder="John@demo.com"
              value="{{ $user->email }}"
              data-msg="Please enter the email"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressPhone">Phone Nummber</label>
            <input
              type="text"
              id="modalAddressPhone"
              name="phone"
              class="form-control"
              placeholder="+331 40 00 00 00"
              value="{{ $user->phone }}"
              data-msg="Please enter the phone number"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressNumberCompany">N° Company</label>
            <input
              type="text"
              id="modalAddressNumberCompany"
              name="n_company"
              class="form-control"
              placeholder="SDF754K77"
              value="{{ $user->n_company }}"
              data-msg="Please enter the N° Company"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="modalAddressVAT">VAT Number</label>
            <input
              type="text"
              id="modalAddressVAT"
              name="vat_number"
              class="form-control"
              placeholder="SDF754K77"
              value="{{ $user->vat_number }}"
              data-msg="Please enter the VAT Number"
            />
          </div>
          <div class="col-12">
            <label class="form-label" for="modalAddressAddress1">Address</label>
            <input
              type="text"
              id="modalAddressAddress1"
              name="address"
              class="form-control"
              value="{{ $user->address }}"
              placeholder="12, Business Park"
            />
          </div>
          <div class="col-12 col-md-4">
            <label class="form-label" for="modalAddressTown">City</label>
            <input
              type="text"
              id="modalAddressTown"
              name="city"
              class="form-control"
              value="{{ $user->city }}"
              placeholder="Los Angeles"
            />
          </div>
          <div class="col-12 col-md-4">
            <label class="form-label" for="modalAddressZipCode">Zip Code</label>
            <input
              type="text"
              id="modalAddressZipCode"
              name="postcode"
              class="form-control"
              placeholder="99950"
              value="{{ $user->postcode }}"
            />
          </div>
          <div class="col-12 col-md-4">
            <label class="form-label" for="modalAddressCountry">Country</label>
            <select id="modalAddressCountry" name="country" class="select2 form-select">
              <option value="">Select a Country</option>
              <option value="Australia" @if ('Australia' == $user->country) {{ 'selected' }} @endif>Australia</option>
              <option value="Bangladesh" @if ('Bangladesh' == $user->country) {{ 'selected' }} @endif>Bangladesh</option>
              <option value="Belarus"  @if ('Belarus' == $user->country) {{ 'selected' }} @endif>Belarus</option>
              <option value="Brazil" @if ('Brazil' == $user->country) {{ 'selected' }} @endif>Brazil</option>
              <option value="Canada" @if ('Canada' == $user->country) {{ 'selected' }} @endif>Canada</option>
              <option value="China" @if ('China' == $user->country) {{ 'selected' }} @endif>China</option>
              <option value="France" @if ('France' == $user->country) {{ 'selected' }} @endif>France</option>
              <option value="Germany" @if ('Germany' == $user->country) {{ 'selected' }} @endif>Germany</option>
              <option value="India" @if ('India' == $user->country) {{ 'selected' }} @endif>India</option>
              <option value="Indonesia" @if ('Indonesia' == $user->country) {{ 'selected' }} @endif>Indonesia</option>
              <option value="Israel" @if ('Israel' == $user->country) {{ 'selected' }} @endif>Israel</option>
              <option value="Italy" @if ('Italy' == $user->country) {{ 'selected' }} @endif>Italy</option>
              <option value="Japan" @if ('Japan' == $user->country) {{ 'selected' }} @endif>Japan</option>
              <option value="Korea" @if ('Korea' == $user->country) {{ 'selected' }} @endif>Korea, Republic of</option>
              <option value="Mexico" @if ('Mexico' == $user->country) {{ 'selected' }} @endif>Mexico</option>
              <option value="Philippines" @if ('Philippines' == $user->country) {{ 'selected' }} @endif>Philippines</option>
              <option value="Russia" @if ('Russia' == $user->country) {{ 'selected' }} @endif>Russian Federation</option>
              <option value="South Africa" @if ('South Africa' == $user->country) {{ 'selected' }} @endif>South Africa</option>
              <option value="Thailand" @if ('Thailand' == $user->country) {{ 'selected' }} @endif>Thailand</option>
              <option value="Turkey" @if ('Turkey' == $user->country) {{ 'selected' }} @endif>Turkey</option>
              <option value="Ukraine" @if ('Ukraine' == $user->country) {{ 'selected' }} @endif>Ukraine</option>
              <option value="United Arab Emirates" @if ('United Arab Emirates' == $user->country) {{ 'selected' }} @endif>United Arab Emirates</option>
              <option value="United Kingdom" @if ('United Kingdom' == $user->country) {{ 'selected' }} @endif>United Kingdom</option>
              <option value="United States" @if ('United States' == $user->country) {{ 'selected' }} @endif>United States</option>
            </select>
          </div>
          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-2 add-user-information">Submit</button>
            <button type="reset" class="btn btn-outline-secondary mt-2" data-bs-dismiss="modal" aria-label="Close">
              Discard
            </button>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>
<!-- / add new address modal -->
