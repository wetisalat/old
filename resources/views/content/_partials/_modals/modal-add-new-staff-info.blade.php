<!-- Edit Staff Personal Info modal -->
<div class="modal fade" id="addNewStaffInfoModal" tabindex="-1" aria-labelledby="addNewAddressTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-4 mx-50">
        <h1 class=" text-center mb-1" id="addNewAddressTitle">Edit Staff Personal Info</h1>
        <p class="text-center mb-2 pb-75">Enter The Staff Personal Info.</p>

        <form method="post" id="addNewAddressForm" class="add-staff-info row gy-1 gx-2" action="{{ route('staff-add-account') }}">
          @csrf
          <input type="hidden" id="option" name="option" value="1"/>
          <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
          <div class="col-12 col-md-6">
            <label class="form-label" for="dob">Birth date</label>
            <input 
              id="dob" 
              type="text" 
              class="form-control date-mask"
              name="info-birthday"
              placeholder="DD-MM-YYYY"
              value="{{ $users[0]->birthday ? $users[0]->birthday : '' }}"
              data-msg="Please enter the birth date"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="placebirth">Place Birth</label>
            <input
                type="text"
                id="placebirth"
                class="form-control"
                placeholder="Country"
                name="info-placebirth"
                value="{{ isset($staff[0]->placebirth)  ?  $staff[0]->placebirth : '' }}"
               data-msg="Please enter the place birth"
            />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="nationality">Nationality</label>
            <select id="modalAddressCountry" id="nationality" name="info-nationality" class="select2 form-select">
              <option value="">Select a Country</option>
              <option value="--">Not Specified</option>
              <option value="Afghanistan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Afghanistan") {{ 'selected' }} @endif>Afghanistan</option>
              <option value="Albania" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Albania") {{ 'selected' }} @endif>Albania</option>
              <option value="Algeria" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Algeria") {{ 'selected' }} @endif>Algeria</option>
              <option value="American Samoa" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "American Samoa") {{ 'selected' }} @endif>American Samoa</option>
              <option value="Andorra" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Andorra") {{ 'selected' }} @endif>Andorra</option>
              <option value="Angola" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Angola") {{ 'selected' }} @endif>Angola</option>
              <option value="Anguilla" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Anguilla") {{ 'selected' }} @endif>Anguilla</option>
              <option value="Antarctica" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Antarctica") {{ 'selected' }} @endif>Antarctica</option>
              <option value="Antigua and Barbuda" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Antigua and Barbuda") {{ 'selected' }} @endif>Antigua and Barbuda</option>
              <option value="Argentina" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Argentina") {{ 'selected' }} @endif>Argentina</option>
              <option value="Armenia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Armenia") {{ 'selected' }} @endif>Armenia</option>
              <option value="Aruba" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Aruba") {{ 'selected' }} @endif>Aruba</option>
              <option value="Australia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Australia") {{ 'selected' }} @endif>Australia</option>
              <option value="Austria" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Austria") {{ 'selected' }} @endif>Austria</option>
              <option value="Azerbaijan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Azerbaijan") {{ 'selected' }} @endif>Azerbaijan</option>
              <option value="Bahamas" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bahamas") {{ 'selected' }} @endif>Bahamas</option>
              <option value="Bahrain" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bahrain") {{ 'selected' }} @endif>Bahrain</option>
              <option value="Bangladesh" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bangladesh") {{ 'selected' }} @endif>Bangladesh</option>
              <option value="Barbados" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Barbados") {{ 'selected' }} @endif>Barbados</option>
              <option value="Belarus" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Belarus") {{ 'selected' }} @endif>Belarus</option>
              <option value="Belgium" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Belgium") {{ 'selected' }} @endif>Belgium</option>
              <option value="Belize" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Belize") {{ 'selected' }} @endif>Belize</option>
              <option value="Benin" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Benin") {{ 'selected' }} @endif>Benin</option>
              <option value="Bermuda" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bermuda") {{ 'selected' }} @endif>Bermuda</option>
              <option value="Bhutan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bhutan") {{ 'selected' }} @endif>Bhutan</option>
              <option value="Bolivia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bolivia") {{ 'selected' }} @endif>Bolivia</option>
              <option value="Bosnia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bosnia") {{ 'selected' }} @endif>Bosnia and Herzegowina</option>
              <option value="Botswana" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Botswana") {{ 'selected' }} @endif>Botswana</option>
              <option value="Bouvet Island" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bouvet Island") {{ 'selected' }} @endif>Bouvet Island</option>
              <option value="Brazil" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Brazil") {{ 'selected' }} @endif>Brazil</option>
              <option value="British Indian Ocean Territory" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "British Indian Ocean Territory") {{ 'selected' }} @endif>British Indian Ocean Territory</option>
              <option value="Brunei Darussalam" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Brunei Darussalam") {{ 'selected' }} @endif>Brunei Darussalam</option>
              <option value="Bulgaria" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Bulgaria") {{ 'selected' }} @endif>Bulgaria</option>
              <option value="Burkina Faso" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Burkina Faso") {{ 'selected' }} @endif>Burkina Faso</option>
              <option value="Burundi" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Burundi") {{ 'selected' }} @endif>Burundi</option>
              <option value="Cambodia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cambodia") {{ 'selected' }} @endif>Cambodia</option>
              <option value="Cameroon" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cameroon") {{ 'selected' }} @endif>Cameroon</option>
              <option value="Canada" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Canada") {{ 'selected' }} @endif>Canada</option>
              <option value="Cape Verde" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cape Verde") {{ 'selected' }} @endif>Cape Verde</option>
              <option value="Cayman Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cayman Islands") {{ 'selected' }} @endif>Cayman Islands</option>
              <option value="Central African Republic" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Central African Republic") {{ 'selected' }} @endif>Central African Republic</option>
              <option value="Chad" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Chad") {{ 'selected' }} @endif>Chad</option>
              <option value="Chile" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Chile") {{ 'selected' }} @endif>Chile</option>
              <option value="China" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "China") {{ 'selected' }} @endif>China</option>
              <option value="Christmas Island" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Christmas Island") {{ 'selected' }} @endif>Christmas Island</option>
              <option value="Cocos (Keeling) Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cocos (Keeling) Islands") {{ 'selected' }} @endif>Cocos (Keeling) Islands</option>
              <option value="Colombia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Colombia") {{ 'selected' }} @endif>Colombia</option>
              <option value="Comoros" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Comoros") {{ 'selected' }} @endif>Comoros</option>
              <option value="Congo" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Congo") {{ 'selected' }} @endif>Congo</option>
              <option value="Congo, the Democratic Republic of the" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Congo, the Democratic Republic of the") {{ 'selected' }} @endif>Congo, the Democratic Republic of the</option>
              <option value="Cook Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cook Islands") {{ 'selected' }} @endif>Cook Islands</option>
              <option value="Costa Rica" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Costa Rica") {{ 'selected' }} @endif>Costa Rica</option>
              <option value="Cote d'Ivoire" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cote d'Ivoire") {{ 'selected' }} @endif>Cote d'Ivoire</option>
              <option value="Croatia (Hrvatska)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Croatia (Hrvatska)") {{ 'selected' }} @endif>Croatia (Hrvatska)</option>
              <option value="Cuba" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cuba") {{ 'selected' }} @endif>Cuba</option>
              <option value="Cyprus" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Cyprus") {{ 'selected' }} @endif>Cyprus</option>
              <option value="Czech Republic" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Czech Republic") {{ 'selected' }} @endif>Czech Republic</option>
              <option value="Denmark" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Denmark") {{ 'selected' }} @endif>Denmark</option>
              <option value="Djibouti" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Djibouti") {{ 'selected' }} @endif>Djibouti</option>
              <option value="Dominica" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Dominica") {{ 'selected' }} @endif>Dominica</option>
              <option value="Dominican Republic" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Dominican Republic") {{ 'selected' }} @endif>Dominican Republic</option>
              <option value="East Timor" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "East Timor") {{ 'selected' }} @endif>East Timor</option>
              <option value="Ecuador" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Ecuador") {{ 'selected' }} @endif>Ecuador</option>
              <option value="Egypt" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Egypt") {{ 'selected' }} @endif>Egypt</option>
              <option value="El Salvador" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "El Salvador") {{ 'selected' }} @endif>El Salvador</option>
              <option value="Equatorial Guinea" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Equatorial Guinea") {{ 'selected' }} @endif>Equatorial Guinea</option>
              <option value="Eritrea" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Eritrea") {{ 'selected' }} @endif>Eritrea</option>
              <option value="Estonia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Estonia") {{ 'selected' }} @endif>Estonia</option>
              <option value="Ethiopia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Ethiopia") {{ 'selected' }} @endif>Ethiopia</option>
              <option value="Falkland Islands (Malvinas)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Falkland Islands (Malvinas)") {{ 'selected' }} @endif>Falkland Islands (Malvinas)</option>
              <option value="Faroe Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Faroe Islands") {{ 'selected' }} @endif>Faroe Islands</option>
              <option value="Fiji" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Fiji") {{ 'selected' }} @endif>Fiji</option>
              <option value="Finland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Finland") {{ 'selected' }} @endif>Finland</option>
              <option value="France" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "France") {{ 'selected' }} @endif>France</option>
              <option value="France, Metropolitan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "France, Metropolitan") {{ 'selected' }} @endif>France, Metropolitan</option>
              <option value="French Guiana" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "French Guiana") {{ 'selected' }} @endif>French Guiana</option>
              <option value="French Polynesia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "French Polynesia") {{ 'selected' }} @endif>French Polynesia</option>
              <option value="French Southern Territories" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "French Southern Territories") {{ 'selected' }} @endif>French Southern Territories</option>
              <option value="Gabon" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Gabon") {{ 'selected' }} @endif>Gabon</option>
              <option value="Gambia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Gambia") {{ 'selected' }} @endif>Gambia</option>
              <option value="Georgia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Georgia") {{ 'selected' }} @endif>Georgia</option>
              <option value="Germany" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Germany") {{ 'selected' }} @endif>Germany</option>
              <option value="Ghana" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Ghana") {{ 'selected' }} @endif>Ghana</option>
              <option value="Gibraltar" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Gibraltar") {{ 'selected' }} @endif>Gibraltar</option>
              <option value="Greece" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Greece") {{ 'selected' }} @endif>Greece</option>
              <option value="Greenland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Greenland") {{ 'selected' }} @endif>Greenland</option>
              <option value="Grenada" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Grenada") {{ 'selected' }} @endif>Grenada</option>
              <option value="Guadeloupe" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guadeloupe") {{ 'selected' }} @endif>Guadeloupe</option>
              <option value="Guam" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guam") {{ 'selected' }} @endif>Guam</option>
              <option value="Guatemala" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guatemala") {{ 'selected' }} @endif>Guatemala</option>
              <option value="Guinea" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guinea") {{ 'selected' }} @endif>Guinea</option>
              <option value="Guinea-Bissau" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guinea-Bissau") {{ 'selected' }} @endif>Guinea-Bissau</option>
              <option value="Guyana" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Guyana") {{ 'selected' }} @endif>Guyana</option>
              <option value="Haiti" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Haiti") {{ 'selected' }} @endif>Haiti</option>
              <option value="Heard and Mc Donald Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Heard and Mc Donald Islands") {{ 'selected' }} @endif>Heard and Mc Donald Islands</option>
              <option value="Holy See (Vatican City State)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Holy See (Vatican City State)") {{ 'selected' }} @endif>Holy See (Vatican City State)</option>
              <option value="Honduras" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Honduras") {{ 'selected' }} @endif>Honduras</option>
              <option value="Hong Kong" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Hong Kong") {{ 'selected' }} @endif>Hong Kong</option>
              <option value="Hungary" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Hungary") {{ 'selected' }} @endif>Hungary</option>
              <option value="Iceland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Iceland") {{ 'selected' }} @endif>Iceland</option>
              <option value="India" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "India") {{ 'selected' }} @endif>India</option>
              <option value="Indonesia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Indonesia") {{ 'selected' }} @endif>Indonesia</option>
              <option value="Iran (Islamic Republic of)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Iran (Islamic Republic of)") {{ 'selected' }} @endif>Iran (Islamic Republic of)</option>
              <option value="Iraq" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Iraq") {{ 'selected' }} @endif>Iraq</option>
              <option value="Ireland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Ireland") {{ 'selected' }} @endif>Ireland</option>
              <option value="Israel" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Israel") {{ 'selected' }} @endif>Israel</option>
              <option value="Italy" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Italy") {{ 'selected' }} @endif>Italy</option>
              <option value="Jamaica" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Jamaica") {{ 'selected' }} @endif>Jamaica</option>
              <option value="Japan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Japan") {{ 'selected' }} @endif>Japan</option>
              <option value="Jordan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Jordan") {{ 'selected' }} @endif>Jordan</option>
              <option value="Kazakhstan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Kazakhstan") {{ 'selected' }} @endif>Kazakhstan</option>
              <option value="Kenya" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Kenya") {{ 'selected' }} @endif>Kenya</option>
              <option value="Kiribati" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Kiribati") {{ 'selected' }} @endif>Kiribati</option>
              <option value="Korea, Democratic People's Republic of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Korea, Democratic People's Republic of") {{ 'selected' }} @endif>Korea, Democratic People's Republic of</option>
              <option value="Korea, Republic of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Korea, Republic of") {{ 'selected' }} @endif>Korea, Republic of</option>
              <option value="Kuwait" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Kuwait") {{ 'selected' }} @endif>Kuwait</option>
              <option value="Kyrgyzstan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Kyrgyzstan") {{ 'selected' }} @endif>Kyrgyzstan</option>
              <option value="Lao People's Democratic Republic" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Lao People's Democratic Republic") {{ 'selected' }} @endif>Lao People's Democratic Republic</option>
              <option value="Latvia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Latvia") {{ 'selected' }} @endif>Latvia</option>
              <option value="Lebanon" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Lebanon") {{ 'selected' }} @endif>Lebanon</option>
              <option value="Lesotho" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Lesotho") {{ 'selected' }} @endif>Lesotho</option>
              <option value="Liberia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Liberia") {{ 'selected' }} @endif>Liberia</option>
              <option value="Libyan Arab Jamahiriya" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Libyan Arab Jamahiriya") {{ 'selected' }} @endif>Libyan Arab Jamahiriya</option>
              <option value="Liechtenstein" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Liechtenstein") {{ 'selected' }} @endif>Liechtenstein</option>
              <option value="Lithuania" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Lithuania") {{ 'selected' }} @endif>Lithuania</option>
              <option value="Luxembourg" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Luxembourg") {{ 'selected' }} @endif>Luxembourg</option>
              <option value="Macau" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Macau") {{ 'selected' }} @endif>Macau</option>
              <option value="Macedonia, The Former Yugoslav Republic of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Macedonia, The Former Yugoslav Republic of") {{ 'selected' }} @endif>Macedonia, The Former Yugoslav Republic of</option>
              <option value="Madagascar" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Madagascar") {{ 'selected' }} @endif>Madagascar</option>
              <option value="Malawi" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Malawi") {{ 'selected' }} @endif>Malawi</option>
              <option value="Malaysia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Malaysia") {{ 'selected' }} @endif>Malaysia</option>
              <option value="Maldives" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Maldives") {{ 'selected' }} @endif>Maldives</option>
              <option value="Mali" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mali") {{ 'selected' }} @endif>Mali</option>
              <option value="Malta" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Malta") {{ 'selected' }} @endif>Malta</option>
              <option value="Marshall Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Marshall Islands") {{ 'selected' }} @endif>Marshall Islands</option>
              <option value="Martinique" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Martinique") {{ 'selected' }} @endif>Martinique</option>
              <option value="Mauritania" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mauritania") {{ 'selected' }} @endif>Mauritania</option>
              <option value="Mauritius" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mauritius") {{ 'selected' }} @endif>Mauritius</option>
              <option value="Mayotte" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mayotte") {{ 'selected' }} @endif>Mayotte</option>
              <option value="Mexico" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mexico") {{ 'selected' }} @endif>Mexico</option>
              <option value="Micronesia, Federated States of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Micronesia, Federated States of") {{ 'selected' }} @endif>Micronesia, Federated States of</option>
              <option value="Moldova, Republic of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Moldova, Republic of") {{ 'selected' }} @endif>Moldova, Republic of</option>
              <option value="Monaco" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Monaco") {{ 'selected' }} @endif>Monaco</option>
              <option value="Mongolia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mongolia") {{ 'selected' }} @endif>Mongolia</option>
              <option value="Montserrat" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Montserrat") {{ 'selected' }} @endif>Montserrat</option>
              <option value="Morocco" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Morocco") {{ 'selected' }} @endif>Morocco</option>
              <option value="Mozambique" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Mozambique") {{ 'selected' }} @endif>Mozambique</option>
              <option value="Myanmar" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Myanmar") {{ 'selected' }} @endif>Myanmar</option>
              <option value="Namibia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Namibia") {{ 'selected' }} @endif>Namibia</option>
              <option value="Nauru" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Nauru") {{ 'selected' }} @endif>Nauru</option>
              <option value="Nepal" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Nepal") {{ 'selected' }} @endif>Nepal</option>
              <option value="Netherlands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Netherlands") {{ 'selected' }} @endif>Netherlands</option>
              <option value="Netherlands Antilles" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Netherlands Antilles") {{ 'selected' }} @endif>Netherlands Antilles</option>
              <option value="New Caledonia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "New Caledonia") {{ 'selected' }} @endif>New Caledonia</option>
              <option value="New Zealand" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "New Zealand") {{ 'selected' }} @endif>New Zealand</option>
              <option value="Nicaragua" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Nicaragua") {{ 'selected' }} @endif>Nicaragua</option>
              <option value="Niger" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Niger") {{ 'selected' }} @endif>Niger</option>
              <option value="Nigeria" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Nigeria") {{ 'selected' }} @endif>Nigeria</option>
              <option value="Niue" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Niue") {{ 'selected' }} @endif>Niue</option>
              <option value="Norfolk Island" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Norfolk Island") {{ 'selected' }} @endif>Norfolk Island</option>
              <option value="Northern Mariana Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Northern Mariana Islands") {{ 'selected' }} @endif>Northern Mariana Islands</option>
              <option value="Norway" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Norway") {{ 'selected' }} @endif>Norway</option>
              <option value="Oman" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Oman") {{ 'selected' }} @endif>Oman</option>
              <option value="Pakistan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Pakistan") {{ 'selected' }} @endif>Pakistan</option>
              <option value="Palau" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Palau") {{ 'selected' }} @endif>Palau</option>
              <option value="Panama" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Panama") {{ 'selected' }} @endif>Panama</option>
              <option value="Papua New Guinea" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Papua New Guinea") {{ 'selected' }} @endif>Papua New Guinea</option>
              <option value="Paraguay" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Paraguay") {{ 'selected' }} @endif>Paraguay</option>
              <option value="Peru" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Peru") {{ 'selected' }} @endif>Peru</option>
              <option value="Philippines" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Philippines") {{ 'selected' }} @endif>Philippines</option>
              <option value="Pitcairn" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Pitcairn") {{ 'selected' }} @endif>Pitcairn</option>
              <option value="Poland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Poland") {{ 'selected' }} @endif>Poland</option>
              <option value="Portugal" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Portugal") {{ 'selected' }} @endif>Portugal</option>
              <option value="Puerto Rico" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Puerto Rico") {{ 'selected' }} @endif>Puerto Rico</option>
              <option value="Qatar" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Qatar") {{ 'selected' }} @endif>Qatar</option>
              <option value="Reunion" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Reunion") {{ 'selected' }} @endif>Reunion</option>
              <option value="Romania" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Romania") {{ 'selected' }} @endif>Romania</option>
              <option value="Russian Federation" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Russian Federation") {{ 'selected' }} @endif>Russian Federation</option>
              <option value="Rwanda" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Rwanda") {{ 'selected' }} @endif>Rwanda</option>
              <option value="Saint Kitts and Nevis" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Saint Kitts and Nevis") {{ 'selected' }} @endif>Saint Kitts and Nevis</option>
              <option value="Saint LUCIA" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Saint LUCIA") {{ 'selected' }} @endif>Saint LUCIA</option>
              <option value="Saint Vincent and the Grenadines" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Saint Vincent and the Grenadines") {{ 'selected' }} @endif>Saint Vincent and the Grenadines</option>
              <option value="Samoa" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Samoa") {{ 'selected' }} @endif>Samoa</option>
              <option value="San Marino" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "San Marino") {{ 'selected' }} @endif>San Marino</option>
              <option value="Sao Tome and Principe" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Sao Tome and Principe") {{ 'selected' }} @endif>Sao Tome and Principe</option>
              <option value="Saudi Arabia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Saudi Arabia") {{ 'selected' }} @endif>Saudi Arabia</option>
              <option value="Senegal" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Senegal") {{ 'selected' }} @endif>Senegal</option>
              <option value="Seychelles" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Seychelles") {{ 'selected' }} @endif>Seychelles</option>
              <option value="Sierra Leone" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Sierra Leone") {{ 'selected' }} @endif>Sierra Leone</option>
              <option value="Singapore" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Singapore") {{ 'selected' }} @endif>Singapore</option>
              <option value="Slovakia (Slovak Republic)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Slovakia (Slovak Republic)") {{ 'selected' }} @endif>Slovakia (Slovak Republic)</option>
              <option value="Slovenia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Slovenia") {{ 'selected' }} @endif>Slovenia</option>
              <option value="Solomon Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Solomon Islands") {{ 'selected' }} @endif>Solomon Islands</option>
              <option value="Somalia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Somalia") {{ 'selected' }} @endif>Somalia</option>
              <option value="South Africa" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "South Africa") {{ 'selected' }} @endif>South Africa</option>
              <option value="South Georgia and the South Sandwich Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "South Georgia and the South Sandwich Islands") {{ 'selected' }} @endif>South Georgia and the South Sandwich Islands</option>
              <option value="Spain" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Spain") {{ 'selected' }} @endif>Spain</option>
              <option value="Sri Lanka" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Sri Lanka") {{ 'selected' }} @endif>Sri Lanka</option>
              <option value="St. Helena" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "St. Helena") {{ 'selected' }} @endif>St. Helena</option>
              <option value="St. Pierre and Miquelon" @if (isset($staff[0]->nationality) && $staff[0]->nationality == ">St. Pierre and Miquelon") {{ 'selected' }} @endif>St. Pierre and Miquelon</option>
              <option value="Sudan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Sudan") {{ 'selected' }} @endif>Sudan</option>
              <option value="Suriname" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Suriname") {{ 'selected' }} @endif>Suriname</option>
              <option value="Svalbard and Jan Mayen Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Svalbard and Jan Mayen Islands") {{ 'selected' }} @endif>Svalbard and Jan Mayen Islands</option>
              <option value="Swaziland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Swaziland") {{ 'selected' }} @endif>Swaziland</option>
              <option value="Sweden" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Sweden") {{ 'selected' }} @endif>Sweden</option>
              <option value="Switzerland" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Switzerland") {{ 'selected' }} @endif>Switzerland</option>
              <option value="Syrian Arab Republic" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Syrian Arab Republic") {{ 'selected' }} @endif>Syrian Arab Republic</option>
              <option value="Taiwan, Province of China" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Taiwan, Province of China") {{ 'selected' }} @endif>Taiwan, Province of China</option>
              <option value="Tajikistan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tajikistan") {{ 'selected' }} @endif>Tajikistan</option>
              <option value="Tanzania, United Republic of" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tanzania, United Republic of") {{ 'selected' }} @endif>Tanzania, United Republic of</option>
              <option value="Thailand" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Thailand") {{ 'selected' }} @endif>Thailand</option>
              <option value="Togo" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Togo") {{ 'selected' }} @endif>Togo</option>
              <option value="Tokelau" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tokelau") {{ 'selected' }} @endif>Tokelau</option>
              <option value="Tonga" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tonga") {{ 'selected' }} @endif>Tonga</option>
              <option value="Trinidad and Tobago" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Trinidad and Tobago") {{ 'selected' }} @endif>Trinidad and Tobago</option>
              <option value="Tunisia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tunisia") {{ 'selected' }} @endif>Tunisia</option>
              <option value="Turkey" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Turkey") {{ 'selected' }} @endif>Turkey</option>
              <option value="Turkmenistan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Turkmenistan") {{ 'selected' }} @endif>Turkmenistan</option>
              <option value="Turks and Caicos Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Turks and Caicos Islands") {{ 'selected' }} @endif>Turks and Caicos Islands</option>
              <option value="Tuvalu" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Tuvalu") {{ 'selected' }} @endif>Tuvalu</option>
              <option value="Uganda" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Uganda") {{ 'selected' }} @endif>Uganda</option>
              <option value="Ukraine" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Ukraine") {{ 'selected' }} @endif>Ukraine</option>
              <option value="United Arab Emirates" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "United Arab Emirates") {{ 'selected' }} @endif>United Arab Emirates</option>
              <option value="United Kingdom" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "United Kingdom") {{ 'selected' }} @endif>United Kingdom</option>
              <option value="United States" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "United States") {{ 'selected' }} @endif>United States</option>
              <option value="United States Minor Outlying Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "United States Minor Outlying Islands") {{ 'selected' }} @endif>United States Minor Outlying Islands</option>
              <option value="Uruguay" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Uruguay") {{ 'selected' }} @endif>Uruguay</option>
              <option value="Uzbekistan" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Uzbekistan") {{ 'selected' }} @endif>Uzbekistan</option>
              <option value="Vanuatu" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Vanuatu") {{ 'selected' }} @endif>Vanuatu</option>
              <option value="Venezuela" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Venezuela") {{ 'selected' }} @endif>Venezuela</option>
              <option value="Viet Nam" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Viet Nam") {{ 'selected' }} @endif>Viet Nam</option>
              <option value="Virgin Islands (British)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Virgin Islands (British)") {{ 'selected' }} @endif>Virgin Islands (British)</option>
              <option value="Virgin Islands (U.S.)" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Virgin Islands (U.S.)") {{ 'selected' }} @endif>Virgin Islands (U.S.)</option>
              <option value="Wallis and Futuna Islands" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Wallis and Futuna Islands") {{ 'selected' }} @endif>Wallis and Futuna Islands</option>
              <option value="Western Sahara" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Western Sahara") {{ 'selected' }} @endif>Western Sahara</option>
              <option value="Yemen" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Yemen") {{ 'selected' }} @endif>Yemen</option>
              <option value="Yugoslavia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Yugoslavia") {{ 'selected' }} @endif>Yugoslavia</option>
              <option value="Zambia" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Zambia") {{ 'selected' }} @endif>Zambia</option>
              <option value="Zimbabwe" @if (isset($staff[0]->nationality) && $staff[0]->nationality == "Zimbabwe") {{ 'selected' }} @endif>Zimbabwe</option>
            </select>
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="nin">National Insurance Number</label>
            <input
              type="text"
              id="nin"
              class="form-control"
              name="info-nin"
              placeholder="National Insurance Number"
              value="{{ isset($staff[0]->nin)  ?  $staff[0]->nin : '' }}"
              data-msg="Please enter the National Insurance Number"
            />
          </div>
          <div class="col-12">
          <label class="form-label" for="document_type">Document type</label>
            <select id="modalDocumentType" id="document_type" name="info-document_type" class="select2 form-select">
              <option value="">Select a Document</option>
              <option value="Pièce d'identité" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Pièce d'identité") {{ 'selected' }} @endif>Pièce d'identité</option>
              <option value="Passeport" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Passeport") {{ 'selected' }} @endif>Passeport</option>
              <option value="Visa de long séjour" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Visa de long séjour") {{ 'selected' }} @endif>Visa de long séjour</option>
              <option value="Carte de séjour étudiant" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de séjour étudiant") {{ 'selected' }} @endif>Carte de séjour étudiant</option>
              <option value="Carte de séjour vie privée" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de séjour vie privée") {{ 'selected' }} @endif>Carte de séjour vie privée</option>
              <option value="Carte de séjour passeport talent" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de séjour passeport talent") {{ 'selected' }} @endif>Carte de séjour passeport talent</option>
              <option value="Carte de séjour salarié détaché" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de séjour salarié détaché") {{ 'selected' }} @endif>Carte de séjour salarié détaché</option>
              <option value="Carte de résident UE" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de résident UE") {{ 'selected' }} @endif>Carte de résident UE</option>
              <option value="Carte de séjour salarié / travailleur temporaire" @if (isset($staff[0]->document_type) && $staff[0]->document_type == "Carte de séjour salarié / travailleur temporaire") {{ 'selected' }} @endif>Carte de séjour salarié / travailleur temporaire</option>
            </select>
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="expiry_date">Expiry date</label>
            <input 
              id="expiry_date" 
              type="text" 
              class="form-control date-mask"
              name="info-expiry_date"
              placeholder="DD-MM-YYYY"
              value="{{ $staff[0]->expiry_date ? $staff[0]->expiry_date : '' }}"
              data-msg="Please enter the expiry date"
            />
          </div>
          <div class="col-12 col-md-6">
          <label class="form-label" for="identification_number">Identification Number</label>
            <input
              type="text"
              id="identification_number"
              class="form-control"
              name="info-identification_number"
              placeholder="Identification Number"
              value="{{ isset($staff[0]->identification_number)  ?  $staff[0]->identification_number : '' }}"
              data-msg="Please enter the Identification Number"
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
