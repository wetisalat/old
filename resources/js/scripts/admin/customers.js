/*=========================================================================================
    File Name: app-user-list.js
    Description: User List page
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent

==========================================================================================*/
$(function () {
    ;('use strict')

    var dtUserTable = $('.user-list-table'),
        newUserSidebar = $('.new-user-modal'),
        newUserForm = $('.add-new-user'),
        select = $('.select2'),
        dtContact = $('.dt-contact'),
        statusObj = {
            'pending': { title: 'Pending', class: 'badge-light-warning' },
            'active': { title: 'Active', class: 'badge-light-success' },
            'inactive': { title: 'Inactive', class: 'badge-light-secondary' }
        },
        verifiedObj = {
            'verified': { title: 'Verified', class: 'badge-light-success ' },
            'unverified': { title: 'Unverified', class: 'badge-light-danger' },
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

    // Users List datatable
    if (dtUserTable.length) {
        dtUserTable.DataTable({
            ajax: assetPath + 'admin/customerslist', // JSON file to add data
            columns: [
                // columns according to JSON
                { data: '' },
                { data: 'full_name' },
                { data: 'is_verified' },
                { data: 'plans' },
                { data: 'status' },
                { data: 'created_at' },
                { data: '' }
            ],
            columnDefs: [
                {
                    // For Responsive
                    className: 'control',
                    orderable: false,
                    responsivePriority: 2,
                    targets: 0,
                    render: function (data, type, full, meta) {
                        return ''
                    }
                },
                {
                    // User full name and username
                    targets: 1,
                    responsivePriority: 4,
                    render: function (data, type, full, meta) {
                        var $name = full['firstname'] + [' '] + full['lastname'],
                            $email = full['email'],
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
                            '<a href="'+assetPath +'admin/customers/'+full['id']+'/view/account" class="user_name text-truncate text-body"><span class="fw-bolder">' +
                            $name +
                            '</span></a>' +
                            '<small class="emp_post text-muted">' +
                            $email +
                            '</small>' +
                            '</div>' +
                            '</div>'
                        return $row_output
                    }
                },
                {
                    targets: 2,
                    render: function (data, type, full, meta) {
                        var $verified = full['is_verified']

                        return (
                            '<span class="badge rounded-pill ' +
                            verifiedObj[$verified].class +
                            '" text-capitalized>' +
                            verifiedObj[$verified].title +
                            '</span>'
                        )

                    }
                },

                {
                    targets: 3,
                    render: function (data, type, full, meta) {
                        var $planName = full['plans']
                        if ($planName != null){
                            return '<span class="badge rounded-pill badge-light-primary">' + $planName + '</span>'
                        }else {
                            return '<span class="text-nowrap">---</span>'
                        }
                    }
                },


                {
                    // User Status
                    targets: 4,
                    render: function (data, type, full, meta) {
                        var $status = full['status']
                        if ($status !== null){
                            return (
                                '<span class="badge rounded-pill ' +
                                statusObj[$status].class +
                                '" text-capitalized>' +
                                statusObj[$status].title +
                                '</span>'
                            )
                        }else {
                            return '<span class="text-nowrap">---</span>'
                        }

                    }
                },
                {
                    targets: 5,
                    render: function (data, type, full, meta) {
                        var $issuedDate = new Date(full['created_at'])
                        var $date = moment($issuedDate).format('DD-MM-YYYY')
                        return '<span class="text-nowrap">' + $date + '</span>'
                    }
                },
                {
                    // Actions
                    targets: -1,
                    title: 'Actions',
                    orderable: false,
                    render: function (data, type, full, meta) {
                        return (
                            '<div class="btn-group">' +
                            '<a class="btn btn-sm dropdown-toggle hide-arrow" data-bs-toggle="dropdown">' +
                            feather.icons['more-vertical'].toSvg({ class: 'font-small-4' }) +
                            '</a>' +
                            '<div class="dropdown-menu dropdown-menu-end">' +
                            // '<a href="'+assetPath +'admin/customers/'+full['id']+'/view/account" class="dropdown-item">' +
                            '<a href="'+assetPath +'admin/customers/'+ full['id']+'/view/account" class="dropdown-item">' +
                            feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) +
                            'Details</a>' +
                            '<a href="javascript:;" onClick=removeUser(' + full['id'] + '); class="dropdown-item delete-record">' +
                            feather.icons['trash-2'].toSvg({ class: 'font-small-4 me-50' }) +
                            'Delete</a></div>' +
                            '</div>' +
                            '</div>'
                        )
                    }
                }
            ],
            order: [[1, 'desc']],
            dom:
                '<"d-flex justify-content-between align-items-center header-actions mx-2 row mt-75"' +
                '<"col-sm-12 col-lg-4 d-flex justify-content-center justify-content-lg-start" l>' +
                '<"col-sm-12 col-lg-8 ps-xl-75 ps-0"<"dt-action-buttons d-flex align-items-center justify-content-center justify-content-lg-end flex-lg-nowrap flex-wrap"<"me-1"f>B>>' +
                '>t' +
                '<"d-flex justify-content-between mx-2 row mb-1"' +
                '<"col-sm-12 col-md-6"i>' +
                '<"col-sm-12 col-md-6"p>' +
                '>',
            language: {
                sLengthMenu: 'Show _MENU_',
                search: 'Search',
                searchPlaceholder: 'Search..'
            },
            // Buttons with Dropdown
            buttons: [
                {
                    extend: 'collection',
                    className: 'btn btn-outline-secondary dropdown-toggle me-2',
                    text: feather.icons['external-link'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                    buttons: [
                        {
                            extend: 'print',
                            text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
                            className: 'dropdown-item',
                            exportOptions: { columns: [1, 2, 3, 4, 5] }
                        },
                        {
                            extend: 'csv',
                            text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                            className: 'dropdown-item',
                            exportOptions: { columns: [1, 2, 3, 4, 5] }
                        },
                        {
                            extend: 'excel',
                            text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                            className: 'dropdown-item',
                            exportOptions: { columns: [1, 2, 3, 4, 5] }
                        },
                        {
                            extend: 'pdf',
                            text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                            className: 'dropdown-item',
                            exportOptions: { columns: [1, 2, 3, 4, 5] }
                        },
                        {
                            extend: 'copy',
                            text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                            className: 'dropdown-item',
                            exportOptions: { columns: [1, 2, 3, 4, 5] }
                        }
                    ],
                    init: function (api, node, config) {
                        $(node).removeClass('btn-secondary')
                        $(node).parent().removeClass('btn-group')
                        setTimeout(function () {
                            $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex mt-50')
                        }, 50)
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
                }
            },
            initComplete: function () {
                // Adding role filter once table initialized
                this.api()
                    .columns(2)
                    .every(function () {
                        var column = this
                        var label = $('<label class="form-label" for="UserRole">Verified</label>').appendTo('.user_role')
                        var select = $(
                            '<select id="UserRole" class="form-select text-capitalize mb-md-0 mb-2"><option value=""> Select One </option></select>'
                        )
                            .appendTo('.user_role')
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex($(this).val())
                                column.search(val ? '^' + val + '$' : '', true, false).draw()
                            })

                        column
                            .data()
                            .unique()
                            .sort()
                            .each(function (d, j) {
                                select.append('<option value="' + d + '" class="text-capitalize">' + d + '</option>')
                            })
                    })
                // Adding plan filter once table initialized
                this.api()
                    .columns(3)
                    .every(function () {
                        var column = this
                        var label = $('<label class="form-label" for="UserPlan">Plan</label>').appendTo('.user_plan')
                        var select = $(
                            '<select id="UserPlan" class="form-select text-capitalize mb-md-0 mb-2"><option value=""> Select Plan </option></select>'
                        )
                            .appendTo('.user_plan')
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex($(this).val())
                                column.search(val ? '^' + val + '$' : '', true, false).draw()
                            })

                        column
                            .data()
                            .unique()
                            .sort()
                            .each(function (d, j) {
                                if (d !== null){
                                    select.append('<option value="' + d + '" class="text-capitalize">' + d + '</option>')
                                }

                            })
                    })
                // Adding status filter once table initialized
                this.api()
                    .columns(4)
                    .every(function () {
                        var column = this
                        var label = $('<label class="form-label" for="FilterTransaction">Status</label>').appendTo('.user_status')
                        var select = $(
                            '<select id="FilterTransaction" class="form-select text-capitalize mb-md-0 mb-2xx"><option value=""> Select Status </option></select>'
                        )
                            .appendTo('.user_status')
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex($(this).val())
                                column.search(val ? '^' + val + '$' : '', true, false).draw()
                            })

                        column
                            .data()
                            .unique()
                            .sort()
                            .each(function (d, j) {
                                select.append(
                                    '<option value="' +
                                    statusObj[d].title +
                                    '" class="text-capitalize">' +
                                    statusObj[d].title +
                                    '</option>'
                                )
                            })
                    })
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
                phoneRegionCode: 'US'
            })
        })
    }
})


$(document).ready(function(){
    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('.dropdown-menu a').click(function(){
        $('.btn-outline-primary.dropdown-toggle').text($(this).text());
    });
});

function removeUser(userId) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        customClass: {
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
    }).then(function (result) {
        if (result.value) {
            $.ajax({
                type: 'POST',
                url: 'admin/customers/delete',
                data: {userId},
                success: function (response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then((response) => {
                        window.location.reload();
                    });

                }
            });


        } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire({
                title: 'Cancelled',
                text: 'Your imaginary file is safe :)',
                icon: 'error',
                customClass: {
                    confirmButton: 'btn btn-success'
                }
            });
        }
    });
}
