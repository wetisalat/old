$(function () {
    ;('use strict')

    var dtUserTable = $('.user-list-table'),
        newUserSidebar = $('.new-user-modal'),
        newUserForm = $('.add-new-user'),
        select = $('.select2'),
        dtContact = $('.dt-contact'),
        statusObj = {
            1: { title: 'Pending', class: 'badge-light-warning' },
            'active': { title: 'Active', class: 'badge-light-success' },
            3: { title: 'Inactive', class: 'badge-light-secondary' }
        }

    var assetPath = '../../../app-assets/',
        userView = 'app-user-view-account.html'

    if ($('body').attr('data-framework') === 'laravel') {
        assetPath = $('body').attr('data-asset-path')
        userView = assetPath + 'staff/view/account'
    }

    select.each(function () {
        var $this = $(this)
        $this.wrap('<div class="position-relative"></div>')
        $this.select2({
            // the following code is used to disable x-scrollbar when click in select input and
            // take 100% width in responsive also
            dropdownAutoWidth: true,
            width: '100%',
            dropdownParent: $this.parent()
        })
    })

    var dt_user_list;

    // Users List datatable
    if (dtUserTable.length) {
        dt_user_list = dtUserTable.DataTable({
            "bInfo" : false,
            "bAutoWidth": true,
            ajax: assetPath + 'staff/datauserlist', // JSON file to add data
            columns: [
                // columns according to JSON
                { data: 'id' },
                { data: 'fullname' },
                { data: 'phone' },
                { data: 'created_at' },
                { data: 'team' },
                { data: 'status' },
                { data: '' }
            ],
            columnDefs: [
                {
                    // For Checkboxes
                    targets: 0,
                    orderable: false,
                    responsivePriority: 3,
                    render: function (data, type, full, meta) {
                        return (
                            '<div class="form-check"> <input class="form-check-input dt-checkboxes" type="checkbox" value="' + full['id'] + '" id="checkbox' +
                            data +
                            '" /><label class="form-check-label" for="checkbox' +
                            data +
                            '"></label></div>'
                        );
                    },
                    checkboxes: {
                        selectAllRender: '<div class="form-check"> <input class="form-check-input" type="checkbox" value="" id="checkboxSelectAll" /><label class="form-check-label" for="checkboxSelectAll"></label></div>'
                    }
                },
                {
                    // User full name and username
                    targets: 1,
                    responsivePriority: 4,
                    render: function (data, type, full, meta) {
                        var $name = full['firstname'] + [' '] + full['lastname'],
                            $email = full['email'],
                            $contract_type_name = full['contract_type_name'],
                            $image = full['profile_photo_path']
                        if ($image) {
                            // For Avatar image
                            var $output =
                                '<img src="'+$image+'" alt="Avatar" height="32" width="32">';
                        } else {
                            // For Avatar badge
                            var stateNum = Math.floor(Math.random() * 6) + 1
                            var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary']
                            var $state = states[stateNum],
                                $name = full['firstname'] + [' '] + full['lastname'],
                                $initials = $name.match(/\b\w/g) || []
                            $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase()
                            $output = '<span class="avatar-content">' + $initials + '</span>'
                        }
                        var colorClass = $image === '' ? ' bg-light-' + $state + ' ' : ''
                        // Creates full output for row
                        var $row_output =
                            '<div class="d-flex justify-content-left align-items-center">' +
                            '<div class="avatar-wrapper">' +
                            '<div class="avatar ' +
                            colorClass +
                            ' me-1">' +
                            $output +
                            '</div>' +
                            '</div>' +
                            '<div class="d-flex flex-column">' +
                            '<a href="'+assetPath +'staff/'+full['id']+'/view/account" class="user_name text-truncate text-body"><span class="fw-bolder">' +
                            $name +
                            '</span></a>' +
                            '<small class="emp_post text-muted">' +
                            $contract_type_name +
                            '</small>' +
                            '</div>' +
                            '</div>'
                        return $row_output
                    }
                },
                {
                    targets: 2,
                    render: function (data, type, full, meta) {
                        var $phone = full['phone'];
                        if ($phone == null){
                            return '<span class="text-nowrap">-- </span>'
                        }
                        else {
                            return '<span class="text-nowrap">' + $phone + '</span>'
                        }
                    }
                },
                {
                    targets: 3,
                    render: function (data, type, full, meta) {

                        var $isActive = full['is_contact'];

                        if($isActive !== null && $isActive == 1){
                            var $activeDate = new Date(full['active_date']);
                            var $date = moment($activeDate).format('DD-MM-YYYY')
                        }else {
                            var $created_at = new Date(full['created_at']);
                            var $date = moment($created_at).format('DD-MM-YYYY')
                        }

                        return '<span class="text-nowrap">' + $date + '</span>'

                    }
                },
                {
                    targets: 4,
                    render: function (data, type, full, meta) {
                        var $team = full['team'];
                        return '<span class="text-nowrap">' + $team + '</span>'
                    }
                },
                {
                    // User Status
                    targets: 5,
                    render: function (data, type, full, meta) {
                        var $status = full['is_contact'];
                        var userId = full['id'];

                        if ($status == 1){
                            return (
                                '<span class="badge rounded-pill badge-light-success suspend-user" role="button" data-user-id="'+userId+'"> Active </span>'
                            )
                        }else {
                            return (
                                '<span class="badge rounded-pill badge-light-warning cancel-subscription" role="button" data-user-id="'+userId+'"> Unactive </span>'
                            )
                        }


                    }
                },
                {
                    // Actions
                    targets: -1,
                    title: 'Actions',
                    orderable: false,
                    render: function (data, type, full, meta) {
                        return (
                            '<div class="d-flex align-items-center col-actions">' +
                            '<a href="'+assetPath +'staff/'+full['id']+'/view/account" class="me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">' +
                            feather.icons['file-text'].toSvg({ class: 'font-medium-2 text-body' }) +
                            '</a>' +
                            '<a href="'+assetPath +'staff/attendance/'+full['id']+'" class="me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Activity">' +
                            feather.icons['activity'].toSvg({ class: 'font-medium-2 text-body' }) +
                            '</a>' +
                            '<a href="javascript:;" class="me-1 delete-record" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">' +
                            feather.icons['trash-2'].toSvg({ class: 'font-medium-2 text-body' }) +
                            '</a>' +
                            '</div>'
                        )
                    }
                }
            ],
            order: [[2, 'desc']],
            dom:
                '<"row d-flex justify-content-between align-items-center mx-1 py-0"' +
                '<"col-lg-6 d-flex align-items-center"B<"dt-toolbar"><"dt-action-buttons text-xl-end text-lg-start text-lg-end text-start ">>' +
                '<"col-lg-6 d-flex align-items-center justify-content-lg-end flex-lg-nowrap flex-wrap pe-lg-1"f>' +
                '>t' +
                '<"d-flex justify-content-between mx-2 row dt-footer"' +
                '<"col-sm-12 col-md-6"il>' +
                '<"col-sm-12 col-md-6"p>' +
                '>',
            language: {
                sLengthMenu: 'Show _MENU_',
                search: 'Search',
                searchPlaceholder: 'Search..',
                paginate: {
                    // remove previous & next text from pagination
                    previous: '&nbsp;',
                    next: '&nbsp;'
                }
            },
            // Buttons with Dropdown
            buttons: [
                {
                  extend: 'collection',
                  className: 'btn btn-outline-secondary dropdown-toggle me-2',
                  text: feather.icons['share-2'].toSvg({ class: 'font-small-4 me-50' }) + 'Action',
                  buttons: [
                    {
                      text: feather.icons['trash-2'].toSvg({ class: 'font-small-4 me-50' }) + 'Delete',
                      className: 'dropdown-item',
                      exportOptions: { columns: [1, 2, 3, 4, 5] }
                    },
                    {
                      text: feather.icons['shuffle'].toSvg({ class: 'font-small-4 me-50' }) + 'Change status',
                      className: 'dropdown-item',
                      exportOptions: { columns: [1, 2, 3, 4, 5] },
                      action: function ( e, dt, node, config ) {
                        staffListOnChangeStatus();
                      }
                    }
                  ],
                  init: function (api, node, config) {
                    $(node).removeClass('btn-secondary');
                    $(node).parent().removeClass('btn-group');
                    setTimeout(function () {
                      $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex mt-50');
                    }, 50);
                  }
                },
                {
                  text: 'Add New User',
                    className: 'add-new btn btn-primary',
                    attr: {
                        'data-bs-toggle': 'modal',
                        'data-bs-target': '#modals-slide-in'
                    },
                    init: function (api, node, config) {
                        $(node).removeClass('btn-secondary')
                    }
                }
            ],
            // For responsive popup
            responsive: {
                details: {
                    display: $.fn.dataTable.Responsive.display.modal({
                        header: function (row) {
                            var data = row.data()
                            return 'Details of ' + data['fullname']
                        }
                    }),
                    type: 'column',
                    renderer: function (api, rowIdx, columns) {
                        var data = $.map(columns, function (col, i) {
                            return col.columnIndex !== 6 // ? Do not show row in modal popup if title is blank (for check box)
                                ? '<tr data-dt-row="' +
                                col.rowIdx +
                                '" data-dt-column="' +
                                col.columnIndex +
                                '">' +
                                '<td>' +
                                col.title +
                                ':' +
                                '</td> ' +
                                '<td>' +
                                col.data +
                                '</td>' +
                                '</tr>'
                                : ''
                        }).join('')
                        return data ? $('<table class="table"/>').append('<tbody>' + data + '</tbody>') : false
                    }
                }
            },
            language: {
                paginate: {
                    // remove previous & next text from pagination
                    previous: '&nbsp;',
                    next: '&nbsp;'
                },
                sLengthMenu: "_MENU_"
            },
            initComplete: function () {
                $(document).find('[data-bs-toggle="tooltip"]').tooltip();
                // Adding role filter once table initialized
            },

            drawCallback: function () {
                $(document).find('[data-bs-toggle="tooltip"]').tooltip();
            }
        })
    }

    // Form Validation
    if (newUserForm.length) {
        newUserForm.validate({
            errorClass: 'error',
            rules: {
                'user-first': {
                    required: true
                },
                'user-last': {
                    required: true
                },
                'user-email': {
                    required: true
                },
                'user-password': {
                    required: true,
                    strongPassword: true
                },
                'user-confirma': {
                    required: true,
                    strongPassword: true,
                    equalTo: "#user-password"
                },
            }
        })

        newUserForm.on('submit', function (e) {
            var isValid = newUserForm.valid()
            e.preventDefault()
            if (isValid) {
                $this.unbind('submit').submit();
                newUserSidebar.modal('hide')
            }
        })
    }

    // Phone Number
    if (dtContact.length) {
        dtContact.each(function () {
            new Cleave($(this), {
                phone: true,
                phoneRegionCode: 'FR'
            })
        })
    }

    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function staffListOnChangeStatus() {
        var updated = false;
        var message;

        if($('.dt-checkboxes').is(':checked')) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes',
                cancelButtonText: 'No',
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-outline-danger ms-1'
                },
                buttonsStyling: false
            }).then(function (result) {
                if (result.value) {
                    var userIds = [];
                     
                    $('.dt-checkboxes:checked').each(async function() {
                           userIds.push(this.value)
                    }); 

                    $.ajax({
                        type:'POST',
                        url:'/staff/suspen/account',
                        data:{
                            id: userIds
                        },
                        success: function(response) {        
                            window.location.reload();
                        }
                    });
    
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    
                }
            });
            
        }
    }
})
