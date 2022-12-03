<!-- Wage modal -->
<div class="modal fade" id="salaryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-transparent">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body pb-5 px-sm-4 mx-50">
                    <h1 class=" text-center mb-1" id="addNewAddressTitle">Salary & Rate</h1>
                    <p class="text-center mb-2 pb-75">Set the salary for your staff</p>

                        <form method="post" id="addNewAddressForm" class="add-salary row gy-1 gx-2" action="{{ route('staff-add-salary') }}">
                            @csrf
                            <input type="hidden" id="option" name="option" value="1"/>
                            <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="monthly_salary">Monthly Salary</label>
                                    <input
                                        type="number"
                                        id="monthly_salary"
                                        class="form-control"
                                        placeholder="2500.00€"
                                        name="salary-monthly_salary"
                                        value="{{ isset($staff[0]->monthly_salary)  ?  $staff[0]->monthly_salary : '0.00' }}"
                                        data-msg="Please enter the monthly salary"
                                    />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="hiringdate">Hourly Salary</label>
                                    <input
                                        type="number"
                                        id="hourly_salary"
                                        class="form-control"
                                        placeholder="11.00€"
                                        name="salary-hourly_salary"
                                        value="{{ isset($staff[0]->hourly_salary)  ?  $staff[0]->hourly_salary : '0.00' }}"
                                        data-msg="Please enter the hourly Salary"
                                    />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="hiringdate">Overtime Salary</label>
                                    <input
                                        type="number"
                                        id="overtime_salary"
                                        class="form-control"
                                        placeholder="20.00€"
                                        name="salary-overtime_salary"
                                        value="{{ isset($staff[0]->overtime_salary)  ?  $staff[0]->overtime_salary : '0.00' }}"
                                        data-msg="Please enter the Overtime Salary"
                                    />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="bonus">Bonus (Prime)</label>
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
                            <div class="col-12 col-md-4">
                                <label class="form-label" for="weekly_working_time">Weekly working time</label>
                                    <input
                                        type="number"
                                        id="weekly_working_time"
                                        class="form-control"
                                        placeholder="35"
                                        name="salary-weekly_working_time"
                                        value="{{ isset($staff[0]->weekly_working_time)  ?  $staff[0]->weekly_working_time : '' }}"
                                        data-msg="Please enter the Weekly working time"
                                    />
                            </div>
                            <div class="col-12 col-md-4">
                                <label class="form-label" for="daily_breaks_time">Daily Breaks time</label>
                                    <input
                                        type="number"
                                        id="daily_breaks_time"
                                        class="form-control"
                                        placeholder="2"
                                        name="salary-daily_breaks_time"
                                        value="{{ isset($staff[0]->daily_breaks_time)  ?  $staff[0]->daily_breaks_time : '' }}"
                                        data-msg="Please enter the Daily Breaks time"
                                    />
                            </div>
                            <div class="col-12 col-md-4">
                                <label class="form-label" for="holiday">Holidays per year</label>
                                    <input
                                        type="number"
                                        id="holidays_per_year"
                                        class="form-control"
                                        placeholder="2"
                                        name="salary-holidays_per_year"
                                        value="{{ isset($staff[0]->holidays_per_year)  ?  $staff[0]->holidays_per_year : '' }}"
                                        data-msg="Please enter the Holidays per year"
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
</div>
<!-- / Wage modal -->
