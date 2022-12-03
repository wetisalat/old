<!-- edit card modal  -->
<div class="modal fade" id="schedule" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-sm-5 mx-50 pb-5">
        <h1 class="text-center mb-1">New Shift</h1>
        <p class="text-center">Add a new shift for your staffs</p>

        <!-- form -->
        <div class="row gy-1 gx-2 mt-75">

            @php
                $staffs = \App\Models\User::where('user_id', '=', Auth::id())->where('role_id', '=', 2)->get()->toArray();
                $shifts = \App\Models\Shift::where('user_id', '=', Auth::id())->get()->toArray();
                $locations = \App\Models\Location::where('user_id', '=', Auth::id())->get()->toArray();
                $todos = \App\Models\Todo::where('user_id', '=', Auth::id())->get()->toArray();
            @endphp
            <!-- Staff -->
            <div class="col-md-12">
                <label class="form-label" for="select2-multiple">Select a staff</label>
                <select class="select2 form-select" id="select-staff" name="staff_id" multiple>
                    @foreach($staffs as $key => $staff)
                    <option value="{{ $staff['id'] }}">{{ $staff['name'] }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Shfit -->
            <div class="col-xl-4 col-md-6 col-12">
                <label class="form-label" for="select2-limited">Select a shift</label>
                <select class="select2 form-select" id="select-shift" name="shift_id" multiple>
                    @foreach($shifts as $key => $shift)
                        <option value="{{ $shift['id'] }}">{{ $shift['name'] }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Locations -->
            <div class="col-xl-4 col-md-6 col-12">
                <label class="form-label2" for="select2-limited">Select a locations</label>
                <select class="select2 form-select" id="select-location" name="location_id" multiple>
                    @foreach($locations as $key => $location)
                        <option value="{{ $location['id'] }}">{{ $location['name'] }}</option>
                    @endforeach
                </select>
            </div>

                <!-- ToDo -->
                <div class="col-xl-4 col-md-6 col-12">
                <label class="form-label" for="select2-basic">ToDo</label>
                <select class="select2 form-select" id="select2-basic" name="todo_id">
                    @foreach($todos as $key => $todo)
                    <option value="{{ $todo['id'] }}">{{ $todo['title'] }}</option>
                    @endforeach
                </select>
            </div>
            <!-- ToDo Ends -->

            <!-- Reccurents -->
            <div class="demo-inline-spacing">

                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch10">Monday</label>
                    <div class="form-check form-switch form-check-primary">
                        <input type="checkbox" class="form-check-input" id="customSwitch10" name="days"/>
                        <label class="form-check-label" for="customSwitch10">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch11">Tuesday</label>
                    <div class="form-check form-switch form-check-primary">
                        <input type="checkbox" class="form-check-input" id="customSwitch11" name="days"/>
                        <label class="form-check-label" for="customSwitch11">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch111">Wednesday</label>
                    <div class="form-check form-switch form-check-primary">
                        <input type="checkbox" class="form-check-input" id="customSwitch111" name="days"/>
                        <label class="form-check-label" for="customSwitch111">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch12">Thursday</label>
                    <div class="form-check form-switch form-check-primary">
                        <input type="checkbox" class="form-check-input" id="customSwitch12" name="days"/>
                        <label class="form-check-label" for="customSwitch12">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch14">Friday</label>
                    <div class="form-check form-switch form-check-primary">
                        <input type="checkbox" class="form-check-input" id="customSwitch14" name="days"/>
                        <label class="form-check-label" for="customSwitch14">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch13">Saturday</label>
                    <div class="form-check form-switch form-check-dark">
                        <input type="checkbox" class="form-check-input" id="customSwitch13" name="days"/>
                        <label class="form-check-label" for="customSwitch13">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <label class="form-check-label mb-50" for="customSwitch15">Sunday</label>
                    <div class="form-check form-switch form-check-dark">
                        <input type="checkbox" class="form-check-input" id="customSwitch15" name="days"/>
                        <label class="form-check-label" for="customSwitch15">
                            <span class="switch-icon-left"><i data-feather="check"></i></span>
                            <span class="switch-icon-right"><i data-feather="x"></i></span>
                        </label>
                    </div>
                </div>
                <!-- Reccurents Ends -->

                <!-- Break -->
                <form action="#" class="invoice-repeater">
                    <div data-repeater-list="invoice">
                        <div data-repeater-item>
                            <div class="row d-flex align-items-end">
                                <div class="col-md-3 col-12">
                                    <div class="mb-1">
                                        <label class="form-label" for="fp-default">Break time start</label>
                                        <input type="text" id="break-time-start"
                                               class="form-control flatpickr-time text-start" placeholder="HH:MM"/>
                                    </div>
                                </div>

                                <div class="col-md-3 col-12">
                                    <div class="mb-1">
                                        <label class="form-label" for="fp-time">Break time start</label>
                                        <input type="text" id="break-time-end"
                                               class="form-control flatpickr-time text-start" placeholder="HH:MM"/>
                                    </div>
                                </div>

                                <div class="col-md-3 col-12">
                                    <div class="mb-1">
                                        <label class="form-label" for="staticprice">Time</label>
                                        <input type="text" readonly class="form-control-plaintext" id="staticprice"
                                               value="30min"/>
                                    </div>
                                </div>

                                <div class="col-md-3 col-12 mb-50">
                                    <div class="mb-1">
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger"
                                                data-repeater-delete type="button">
                                            <i data-feather='trash'></i>
                                        </button>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success"
                                                data-repeater-create="button">
                                            <i data-feather='plus'></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Break  Ends-->

            <!-- Lunch -->
                    <form action="#" class="invoice-repeater">
                        <div data-repeater-list="invoice">
                            <div data-repeater-item>
                                <div class="row d-flex align-items-end">
                                    <div class="col-md-10 col-12">
                                        <div class="mb-1">
                                            <label class="form-label" for="select2-basic">Lunch</label>
                                            <select class="select2 form-select" id="select2-lunch">
                                                <option value="indemnite-repas">Indemnité repas</option>
                                                <option value="avantage-en-nature">Avantage en nature</option>
                                                <option value="titre-restaurant">Titre restaurant</option>
                                                <option value="prime-de-panier">Prime de panier</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-2 col-12 mb-50">
                                        <div class="mb-1">
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger"
                                                    data-repeater-delete type="button">
                                                <i data-feather='trash'></i>
                                            </button>
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success"
                                                    data-repeater-create="button">
                                                <i data-feather='plus'></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                            </div>
                        </div>
                    </form>

            <!-- Note -->
            <div class="col-md-12">
                <label class="d-block form-label" for="validationBioBootstrap">Note</label>
                <textarea
                    class="form-control"
                    id="validationBioBootstrap"
                    name="note"
                    rows="3"
                ></textarea>
            </div>
            <!-- Note Ends -->



          <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary me-1 mt-1">Submit</button>
            <button type="reset" class="btn btn-outline-secondary mt-1" data-bs-dismiss="modal" aria-label="Close">
              Cancel
            </button>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>
<!--/ edit card modal  -->
