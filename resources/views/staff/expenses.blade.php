@extends('layouts/contentLayoutMaster')

@section('title', 'Expense records list')

@section('vendor-style')
    {{-- vendor css files --}}
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/dataTables.bootstrap5.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/responsive.bootstrap5.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/buttons.bootstrap5.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/rowGroup.bootstrap5.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/flatpickr/flatpickr.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
@endsection

@section('content')
    <!-- Basic table -->
    <section id="basic-datatable">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <table class="datatables-basic table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Attachment</th>
                            <th>Comment</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <!-- Modal to add new record -->
        <div class="modal modal-slide-in fade" id="modals-slide-in">
            <div class="modal-dialog sidebar-sm">
                <form class="add-new-record modal-content pt-0" enctype="multipart/form-data">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="modal-header mb-1">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                    </div>
                    <div class="modal-body flex-grow-1">

                        <input type="hidden" name="oldId" value="" id="oldId">

                        <div class="mb-1">
                            <label class="form-label" for="basic-icon-default-date">Date</label>
                            <input
                                type="text"
                                class="form-control dt-date"
                                id="record_date"
                                name="record_date"
                                placeholder="DD-MM-YYYY"
                                aria-label="DD-MM-YYYY"
                            />
                            <span id="error_record_date" class="text-danger"></span>
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="record_type">Type</label>
                            <select class="select2 w-100" name="record_type" id="record_type">
                                <option value="" selected="selected">-</option>
                                <option value="Billets Transports">Billets Transports</option>
                                <option value="Carburant">Carburant</option>
                                <option value="Péage">Péage</option>
                                <option value="Parking">Parking</option>
                                <option value="Taxi">Taxi</option>
                                <option value="Hébergement frais réels">Hébergement frais réels</option>
                                <option value="Restauration">Restauration</option>
                                <option value="Matériel">Matériel</option>
                                <option value="Véhicule">Véhicule</option>
                                <option value="Forfait téléphonique">Forfait téléphonique</option>
                                <option value="Nuitée">Nuitée</option>
                                <option value="Forfait repas">Forfait repas</option>
                                <option value="Autre">Autre</option>
                            </select>
                            <span id="error_record_type" class="text-danger"></span>
                        </div>
                        <div class="mb-1">
                            <label class="form-label" for="">Amount</label>
                            <input
                                type="text"
                                id="record_salary"
                                class="form-control dt-salary"
                                name="record_salary"
                                placeholder="$1200"
                                aria-label="$1200"
                            />
                            <span id="error_record_salary" class="text-danger"></span>
                        </div>

                        <div class="mb-1">
                            <label for="attachment" class="form-label">Attachement</label>
                            <input class="form-control" type="file" name="attachment" id="attachment" required />
                            <input type="hidden" id="imageUrl" value="">

                            <span id="error_attachment" class="text-danger"></span>
                        </div>

                        <div class="mb-4">
                            <label class="d-block form-label" for="">Comment</label>
                            <textarea
                                class="form-control"
                                id="comment"
                                name="comment"
                                rows="3"
                            ></textarea>
                        </div>
                        <button type="button" class="btn btn-primary data-submit me-1">Submit</button>
                        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--/ Basic table -->

@endsection


@section('vendor-script')
    {{-- vendor files --}}
    <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/jquery.dataTables.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.bootstrap5.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.responsive.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/responsive.bootstrap5.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.checkboxes.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.buttons.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/jszip.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/pdfmake.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/vfs_fonts.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.html5.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.print.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.rowGroup.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/pickers/flatpickr/flatpickr.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
@endsection
@section('page-script')
    {{-- Page js files --}}
    <script src="{{ asset(mix('js/scripts/staff/expenses.js')) }}"></script>
    <script src="{{ asset(mix('js/scripts/forms/form-select2.js')) }}"></script>
@endsection
