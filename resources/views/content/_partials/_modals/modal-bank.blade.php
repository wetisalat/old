<!-- Wage modal -->
<div class="modal fade" id="bankModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-transparent">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body pb-5 px-sm-4 mx-50">
                    <h1 class=" text-center mb-1" id="addNewAddressTitle">Bank Information</h1>
                    <p class="text-center mb-2 pb-75">Set the Bank Information</p>

                        <form method="post" id="addNewAddressForm" class="add-bank-information row gy-1 gx-2" action="{{ route('bank-information') }}">
                            @csrf
                            <input type="hidden" id="id" name="id" value="{{$users[0]->id}}"/>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="bankName">Bank name</label>
                                    <input
                                        type="text"
                                        id="bankName"
                                        class="form-control"
                                        placeholder="Bank name"
                                        name="bank_name"
                                        value="{{ $users[0]->bank_name ? $users[0]->bank_name : '' }}"
                                        data-msg="Please enter the bank name"
                                    />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="">Account No.</label>
                                    <input
                                        type="number"
                                        id="accountNo"
                                        class="form-control"
                                        placeholder="Account no."
                                        name="account_no"
                                        value="{{ $users[0]->account_no ? $users[0]->account_no : '' }}"
                                        data-msg="Please enter the account number"
                                    />
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="form-label" for="ifscCode">IFSC Code</label>
                                    <input
                                        type="number"
                                        id="ifscCode"
                                        class="form-control"
                                        placeholder="IFSC Code"
                                        name="ifsc_code"
                                        value="{{ $users[0]->ifsc_code ? $users[0]->ifsc_code : '' }}"
                                        data-msg="Please enter the IFSC Code"
                                    />
                            </div>

                            <div class="col-12 col-md-6">
                                <label class="form-label" for="panNo">PAN No</label>
                                    <input
                                        type="text"
                                        id="panNo"
                                        class="form-control"
                                        placeholder="Pan no"
                                        name="pan_no"
                                        value="{{ $users[0]->pan_no ? $users[0]->pan_no : '' }}"
                                        data-msg="Please enter the PAN No"
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
