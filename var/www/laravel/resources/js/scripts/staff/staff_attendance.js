/**
 * DataTables Basic
 */

$(function () {
    'use strict';

    var dt_basic_table = $('.datatables-basic'),
        dt_date_table = $('.dt-date'),
        dt_complex_header_table = $('.dt-complex-header'),
        dt_row_grouping_table = $('.dt-row-grouping'),
        dt_multilingual_table = $('.dt-multilingual'),
        assetPath = '../../../app-assets/';

    if ($('body').attr('data-framework') === 'laravel') {
        assetPath = $('body').attr('data-asset-path');
    }

    // DataTable with buttons
    // --------------------------------------------------------------------

    if (dt_basic_table.length) {
        var minDate, maxDate;

        $.fn.dataTable.ext.search.push(
            function (settings, data, dataIndex) {
                var min = minDate;
                var max = maxDate;
                var startDate = moment(data[1], 'DD-MM-YYYY HH:mm').toDate();
                var endDate = moment(data[2], 'DD-MM-YYYY HH:mm').toDate();

                if (
                    (min === undefined && max === undefined) ||
                    (min === undefined && endDate <= max) ||
                    (min <= startDate && max === undefined) ||
                    (min <= startDate && endDate <= max)
                ) {
                    return true;
                }
                return false;
            }
        );

        var dt_basic = dt_basic_table.DataTable({
            "bInfo": false,

            "bAutoWidth": true,

            ajax:
                {
                    url: 'staff/attendanceList',
                    type: 'GET',
                },
            columns: [
                {data: 'id'},
                {data: 'arrival_date'},
                // { data: 'departure_date' },
                {data: 'firstname'},
                {data: 'arrival_hour'},
                {data: 'departure_date'},
                {data: 'break_duration'},
                {data: 'break_duration'},
                {data: 'hours_worked'},
                {data: 'over_time'},
                {data: 'status'},
                {data: ''}
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
                    // Invoice ID
                    targets: 1,
                    width: '80px',
                    render: function (data, type, full, meta) {
                        return moment(full['arrival_date']).format('DD-MM-YYYY')
                    }
                },
                {
                    // User full name and username
                    targets: 2,
                    width: '170px',
                    responsivePriority: 4,
                    render: function (data, type, full, meta) {
                        var $name = full['firstname'] + [' '] + full['lastname'],
                            $email = full['email'],
                            $contract_type_name = full['contract_type_name'],
                            $image = full['profile_photo_path']
                        if ($image) {
                            // For Avatar image
                            var $output =
                                '<img src="' + $image + '" alt="Avatar" height="32" width="32">';
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
                            '<a href="' + assetPath + 'staff/' + full['id'] + '/view/account" class="user_name text-truncate text-body"><span class="fw-bolder">' +
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
                    // checkin
                    targets: 3,
                    visible: true,
                    width: '42px',
                    render: function (data, type, full, meta) {
                        var $badge_class = 'badge-light-success';
                        var checkInTime = checkinTime(full);

                        return (
                            '<div class="d-flex align-items-center col-actions">' +

                            '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + checkInTime + ' </span>'+

                            '<a class="me-25" style="padding-left: 15px;" href="javascript:void(0);" Onclick="checkInCheckOutPic(this)"  data-pic="' + full['arrival_picture'] + '" data-bs-toggle="tooltip" ' +
                            'data-bs-placement="top" title="Departure picture">' +
                            feather.icons['eye'].toSvg({class: 'font-medium-2 text-body'}) +
                            '</a>' +

                            '<a style="padding-left: 15px;" class="me-25" href="javascript:void(0);" Onclick="checkInLocation(this)"  data-string="' + full['gps_in'] + '" data-bs-toggle="tooltip" ' +
                            'data-bs-placement="top" title="Arrival Location">' +
                            feather.icons['map'].toSvg({class: 'font-medium-2 text-body'}) +
                            '</a>' +

                            '</div>'
                        )
                    }
                },

                {
                    // Checkout
                    targets: 4,
                    visible: true,
                    width: '42px',
                    render: function (data, type, full, meta) {
                        var $badge_class = 'badge-light-success';
                        var checkTime = checkOutTime(full);

                        var checkOutHtml =  '<div class="d-flex align-items-center col-actions">' +
                            '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + checkTime + ' </span>';

                        if(full['departure_picture'] == null){
                            checkOutHtml += '<span style="padding-left: 15px;" class="me-25"> ' +  feather.icons['eye'].toSvg({class: 'font-medium-2 text-body'})  + ' </span>';
                        }else {
                            checkOutHtml += '<a class="me-25" style="padding-left: 15px;"  href="javascript:void(0);" Onclick="checkInCheckOutPic(this)"  data-pic="' + full['departure_picture'] + '" data-bs-toggle="tooltip" ' +
                                'data-bs-placement="top" title="Departure picture">' +
                                feather.icons['eye'].toSvg({class: 'font-medium-2 text-body'}) +
                                '</a>';
                        }

                        if(full['gps_out'] == null){
                            checkOutHtml += '<span style="padding-left: 14px;" class="me-25"> ' +  feather.icons['map'].toSvg({class: 'font-medium-2 text-body'})  + ' </span>';
                        }else {
                            checkOutHtml += '<a style="padding-left: 15px;" class="me-25" href="javascript:void(0);" Onclick="checkInLocation(this)"  data-string="' + full['gps_out'] + '" data-bs-toggle="tooltip" ' +
                                'data-bs-placement="top" title="Arrival Location">' +
                                feather.icons['map'].toSvg({class: 'font-medium-2 text-body'}) +
                                '</a>';
                        }

                        '</div>';

                        return checkOutHtml;
                    }
                },

                {
                    // Break Time
                    targets: 5,
                    width: '98px',
                    render: function (data, type, full, meta) {
                        var $latTime = getBreakTime(full);

                        var $breakTime = null;
                        if($latTime == 0){
                            $breakTime = '00min'
                        }else {
                            $breakTime = $latTime;
                        }

                        var $badge_class = 'badge-light-success';
                        return '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + $breakTime + ' </span>';
                    }
                },

                {
                    // LatTime
                    targets: 6,
                    width: '98px',
                    render: function (data, type, full, meta) {
                        var $badge_class = 'badge-light-warning';
                        var $latTime = null;

                        if(full['is_csv'] == 1){
                            $latTime = csvLateTime(full['late_time']);
                        }else {
                            $latTime = getLatTime(full);
                        }
                        return '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + $latTime + ' </span>';
                    }
                },

                {
                    // WorkingTime
                    targets: 7,
                    width: '98px',
                    render: function (data, type, full, meta) {
                        var $badge_class = 'badge-light-success';
                        var $workingTime = null;

                        if(full['is_csv'] == 1){
                            $workingTime = csvLateTime(full['hours_worked']);
                        }else {
                            $workingTime = getWorkingTime(full);
                        }

                        return '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + $workingTime + ' </span>';
                    }
                },


                {
                    // OverTime
                    targets: 8,
                    width: '98px',
                    render: function (data, type, full, meta) {
                        var $overTime = null;
                        if(full['is_csv'] == 1){
                            $overTime = csvLateTime(full['over_time']);
                        }else {
                            $overTime = getOverTime(full);
                        }

                        var $badge_class = 'badge-light-success';
                        return '<span class="badge rounded-pill ' + $badge_class + '" text-capitalized> ' + $overTime + ' </span>';
                    }
                },

                {
                    // Status
                    targets: 9,
                    width: '98px',
                    render: function (data, type, full, meta) {
                        var $status_number = full['status_name'];
                        // console.log($status_number);
                        var $status = {
                            accept: {title: 'Accepted', class: ' badge-light-success'},
                            pending: {title: 'Pending', class: ' badge-light-warning'},
                            refuse: {title: 'Rejected', class: ' badge-light-danger'}
                        };
                        if (typeof $status[$status_number] === 'undefined') {
                            return data;
                        }
                        return (
                            '<span class="badge rounded-pill ' +
                            $status[$status_number].class +
                            '">' +
                            $status[$status_number].title +
                            '</span>'
                        );
                    }
                },

                {
                    // Actions
                    targets: -1,
                    title: 'Actions',
                    width: '80px',
                    orderable: false,
                    render: function (data, type, full, meta) {
                        return (
                            '<div class="d-flex align-items-center col-actions">' +
                            '<button class="btn btn-icon btn-icon rounded-circle btn-success me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Accept" data-status="accept" data-leave-id="' + full['id'] + '"></button>' +
                            '<button type="button" class="btn btn-icon btn-icon rounded-circle btn-warning me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Pending" data-status="pending" data-leave-id="' + full['id'] + '"></button>' +
                            '<button type="button" class="btn btn-icon btn-icon rounded-circle btn-danger me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Refuse" data-status="refuse" data-leave-id="' + full['id'] + '"></button>' +
                            '</div>'
                        );
                    }
                }
            ],
            order: [[1, 'desc']],
            dom:
                '<"row d-flex justify-content-between align-items-center m-1"' +
                '<"col-lg-6 d-flex align-items-center"B<"dt-toolbar"><"dt-action-buttons text-xl-end text-lg-start text-lg-end text-start ">>' +
                '<"col-lg-6 d-flex align-items-center justify-content-lg-end flex-lg-nowrap flex-wrap pe-lg-1 p-0"f <"csv-action-button ml-1">>' +
                '>t' +
                '<"d-flex justify-content-between mx-2 row"' +
                '<"col-sm-12 col-md-6"il>' +
                '<"col-sm-12 col-md-6"p>' +
                '>',
            language: {
                paginate: {
                    // remove previous & next text from pagination
                    previous: '&nbsp;',
                    next: '&nbsp;'
                },
                sLengthMenu: "_MENU_"
            },
            // Buttons with Dropdown
            buttons: [
                {
                    extend: 'collection',
                    className: 'btn btn-outline-secondary dropdown-toggle me-2',
                    text: feather.icons['share-2'].toSvg({ class: 'font-small-4 me-50' }) + 'Action',
                    buttons: [
                        {
                            text: feather.icons['thumbs-up'].toSvg({ class: 'font-small-4 me-50' }) + 'Accept',
                            className: 'dropdown-item dt-btn-accept',
                            exportOptions: { columns: [3, 4, 5, 6, 7] },
                            action: function ( e, dt, node, config ) {
                                expenseOnChangeStatus('accept');
                            }
                        },
                        {
                            text: feather.icons['alert-octagon'].toSvg({ class: 'font-small-4 me-50' }) + 'Pending',
                            className: 'dropdown-item  dt-btn-pending',
                            exportOptions: { columns: [3, 4, 5, 6, 7] },
                            action: function ( e, dt, node, config ) {
                                expenseOnChangeStatus('pending');
                            }
                        },
                        {
                            text: feather.icons['thumbs-down'].toSvg({ class: 'font-small-4 me-50' }) + 'Refuse',
                            className: 'dropdown-item  dt-btn-refuse',
                            exportOptions: { columns: [3, 4, 5, 6, 7] },
                            action: function ( e, dt, node, config ) {
                                expenseOnChangeStatus('refuse');
                            }
                        },
                        {
                            text: feather.icons['trash-2'].toSvg({ class: 'font-small-4 me-50' }) + 'Delete',
                            className: 'dropdown-item  dt-btn-refuse',
                            exportOptions: { columns: [3, 4, 5, 6, 7] },
                            action: function ( e, dt, node, config ) {
                                expenseOnChangeStatus('delete');
                            }
                        }
                    ],
                    init: function (api, node, config) {
                        $(node).removeClass('btn-secondary');
                        $(node).parent().removeClass('btn-group');
                        setTimeout(function () {
                            $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                        }, 50);
                    }
                },
            ],
            responsive: {
                details: {
                    display: $.fn.dataTable.Responsive.display.modal({
                        header: function (row) {
                            var data = row.data();
                            return 'Details of ' + data['full_name'];
                        }
                    }),
                    type: 'column',
                    renderer: function (api, rowIdx, columns) {
                        var data = $.map(columns, function (col, i) {
                            return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
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
                                : '';
                        }).join('');
                        return data ? $('<table class="table"/>').append('<tbody>' + data + '</tbody>') : false;
                    }
                }
            },
            drawCallback: function () {
                $(document).find('[data-bs-toggle="tooltip"]').tooltip();
            }
        });


        // checkInTime cal
        function checkinTime(event) {
            var arivalTime = event.arrival_hour;
            var time = 0;
            if(arivalTime !== null){
                time = checkInCheckOutFormat(arivalTime);
            }else {
                time = '00min'
            }
            return time;
        }

        // checkOutTime
        function checkOutTime(event) {
            var checkOut = event.departure_hour;
            var time = 0;
            if(checkOut !== null){
                time = checkInCheckOutFormat(checkOut);
            }else {
                time = '00min'
            }
            return time;
        }

        // Break Time
        function getBreakTime(event) {
            // shift break
            var shiftBreak = event.break_time;
            var bTime = 0;
            if(shiftBreak !== ''){
                var numb = shiftBreak.match(/\d/g);
                numb = numb.join("");
                bTime += +numb;
            }

            var latTimeCal = bTime * 60000;   // Shift break time

            // staff break
            var breakDuration = event.break_duration; // Staff take break
            var result = null;
            if (breakDuration !== null) {
                var [hours, minutes, seconds] = breakDuration.split(':');
                if (hours !== '00' && minutes !== '00') {
                    var brH = hours * 1000 * 60 * 60;
                    var brM = minutes * 1000 * 60;
                    result = brH + brM;
                } else if (hours !== '00') {
                    result = minutes * 1000 * 60;
                } else {
                    result = minutes * 1000 * 60;
                }
            }

            var breakTime = null;
            if(result > latTimeCal){
                breakTime = latTimeCal;
            }else {
                breakTime = result;
            }

            var timeCal = timeCalculation(breakTime);
            var latTime = null;
            if (timeCal[0] !== '00') {
                latTime = timeCal[0] + 'h' + timeCal[1] + 'min';
            } else {
                latTime = timeCal[1] + 'min';
            }

            if(latTime !== 'aNhaNmin'){
                return latTime;
            }else {
                return '00min';
            }
        }


        // LatTime
        function getLatTime(event) {
            // shift break
            var shiftBreak = event.break_time;
            var bTime = 0;
            if(shiftBreak !== ''){
                var numb = shiftBreak.match(/\d/g);
                numb = numb.join("");
                bTime += +numb;
            }

            var latTimeCal = bTime * 60000;   // Shift break time

            // staff break
            var breakDuration = event.break_duration; // Staff take break
            var result = null;
            if (breakDuration !== null) {
                var [hours, minutes, seconds] = breakDuration.split(':');
                if (hours !== '00' && minutes !== '00') {
                    var brH = hours * 1000 * 60 * 60;
                    var brM = minutes * 1000 * 60;
                    result = brH + brM;
                } else if (hours !== '00') {
                    result = minutes * 1000 * 60;
                } else {
                    result = minutes * 1000 * 60;
                }
            }


            var arrivalDate = event.arrival_date;
            var getStartTime = event.start_time;
            var arrivalTime = event.arrival_hour;

            var toDayDate = moment(arrivalDate).format("MM DD YYYY");
            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var arrivalDate = new Date(`${toDayDate} ${arrivalTime}`);

            var staffLate = Math.abs(arrivalDate.getTime() - startDate.getTime());

            var workTime = null;
            if (result > latTimeCal){
                var overBreak = result - latTimeCal;
                workTime = staffLate + overBreak;
            }else {
                workTime = staffLate;
            }

            var timeCal = timeCalculation(workTime);
            var latTime = null;
            if (timeCal[0] !== '00') {
                latTime = timeCal[0] + 'h' + timeCal[1] + 'min';
            } else {
                latTime = timeCal[1] + 'min';
            }

            if(latTime !== 'aNhaNmin'){
                return latTime;
            }else {
                return '00min';
            }
        }


        // Working Time
        function getWorkingTime(event) {

            var arrivalDate = event.arrival_date;
            var getArrivalHour = event.arrival_hour;
            var getDepartureHour = event.departure_hour;
            var getStartTime = event.start_time;
            var endTime = event.end_time;

            var breakDuration = event.break_duration;
            var result = null;
            if (breakDuration !== null) {
                var [hours, minutes, seconds] = breakDuration.split(':');
                if (hours !== '00' && minutes !== '00') {
                    var brH = hours * 1000 * 60 * 60;
                    var brM = minutes * 1000 * 60;
                    result = brH + brM;
                } else if (hours !== '00') {
                    result = minutes * 1000 * 60;
                } else {
                    result = minutes * 1000 * 60;
                }
            }

            // Shift break
            var shiftBreak = event.break_time;
            var bTime = 0;
            if(shiftBreak !== ''){
                var numb = shiftBreak.match(/\d/g);
                numb = numb.join("");
                bTime += +numb;
            }

            var latTimeCal = bTime * 60000;


            var toDayDate = moment(arrivalDate).format("MM DD YYYY");
            var arrivalDate = new Date(`${toDayDate} ${getArrivalHour}`);
            var departureDate = new Date(`${toDayDate} ${getDepartureHour}`);

            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var endDate = new Date(`${toDayDate} ${endTime}`);

            var workedHours = Math.abs((departureDate.getTime() - arrivalDate.getTime()));
            var totalWorkedHours = workedHours - result;

            // Working Time
            var workingTime = Math.abs(endDate.getTime() - startDate.getTime());
            var totalWorkingTime = workingTime - latTimeCal;

            //Over time
            var totalHours = 0;
            if(totalWorkedHours > totalWorkingTime){
                totalHours = totalWorkingTime;
            }else {
                totalHours = totalWorkedHours;
            }


            var result = timeCalculation(totalHours);

            var latTime = null;
            if (result[0] !== '00' && result[1] !== '00') {
                latTime = result[0] + 'h' + result[1];
            } else if (result[0] !== '00') {
                latTime = result[0] + 'h' + '00';
            } else {
                latTime = result[1] + 'min';
            }


            if(event.hours_worked == null){
                return '00min';
            }else {
                if(latTime !== 'aNhaN'){
                    return latTime;
                }else {
                    return '0h00';
                }
            }
        }


        // OverTime
        function getOverTime(event) {

            var arrivalDate = event.arrival_date;
            var getArrivalHour = event.arrival_hour;
            var getDepartureHour = event.departure_hour;

            var getStartTime = event.start_time;
            var endTime = event.end_time;


            // Break Duration
            var breakDuration = event.break_duration;
            var result = null;
            if (breakDuration !== null) {
                var [hours, minutes, seconds] = breakDuration.split(':');
                if (hours !== '00' && minutes !== '00') {
                    var brH = hours * 1000 * 60 * 60;
                    var brM = minutes * 1000 * 60;
                    result = brH + brM;
                } else if (hours !== '00') {
                    result = minutes * 1000 * 60;
                } else {
                    result = minutes * 1000 * 60;
                }
            }

            // Shift break
            var shiftBreak = event.break_time;
            var bTime = 0;
            if(shiftBreak !== ''){
                var numb = shiftBreak.match(/\d/g);
                numb = numb.join("");
                bTime += +numb;
            }

            var latTimeCal = bTime * 60000;


            var toDayDate = moment(arrivalDate).format("MM DD YYYY");
            var arrivalDate = new Date(`${toDayDate} ${getArrivalHour}`);
            var departureDate = new Date(`${toDayDate} ${getDepartureHour}`);

            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var endDate = new Date(`${toDayDate} ${endTime}`);


            // Working Hour
            var workedHours = Math.abs(departureDate.getTime() - arrivalDate.getTime());
            var totalHours = workedHours - result;


            // Working Time
            var workingTime = Math.abs(endDate.getTime() - startDate.getTime());
            var totalWorkingTime = workingTime - latTimeCal;

            //Over time
            var overTime = 0;
            if(totalHours > totalWorkingTime){
                overTime = totalHours - totalWorkingTime;
            }

            var result = timeCalculation(overTime);

            var latTime = null;
            if (result[0] !== '00' && result[1] !== '00') {
                latTime = result[0] + 'h' + result[1];
            } else if (result[0] !== '00') {
                latTime = result[0] + 'h' + '00';
            } else {
                latTime = result[1] + 'min';
            }

            if(event.hours_worked == null){
                return '00min';
            }else {
                if(latTime !== 'aNhaN'){
                    return latTime;
                }else {
                    return '0h00';
                }
            }
        }


        function calculateTime(event) {
            var arrivalDate = event.arrival_date;
            var getStartTime = event.start_time;
            var arrivalTime = event.arrival_hour;
            var toDayDate = moment(arrivalDate).format("MM DD YYYY");
            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var arrivalDate = new Date(`${toDayDate} ${arrivalTime}`);
            var lateTime = Math.abs(startDate.getTime() - arrivalDate.getTime());
            return [lateTime];
        }


        function timeCalculation(timeDiff) {
            var hh = Math.floor(timeDiff / 1000 / 60 / 60);
            hh = ('0' + hh).slice(-2)
            timeDiff -= hh * 1000 * 60 * 60
            var mm = Math.floor(timeDiff / 1000 / 60);
            mm = ('0' + mm).slice(-2)
            return [hh, mm];
        }


        // Time Format calculation
        function timeFormat(event) {
            var [hours, minutes, seconds] = event.split(':');
            var time = null;
            if (hours !== '00' && minutes !== '00') {
                time = hours + 'h' + minutes;
            } else if (hours !== '00') {
                time = hours + 'H' + '00';
            } else {
                time = minutes + 'min'
            }
            return time;
        }


        function checkInCheckOutFormat(event) {
            var [hours, minutes, seconds] = event.split(':');
            var time = null;
            if (hours !== '00' && minutes !== '00') {
                time = hours + 'h' + minutes;
            } else if (hours !== '00') {
                time = hours + 'H' + '00';
            } else {
                time = '00' + 'H' + minutes
            }
            return time;
        }

        // CSV Late Time Calculation
        function csvLateTime(event){
            var latTime = timeFormat(event);
            return latTime;
        }


    }

    $("div.dt-toolbar").html(
        '<input type="text" id="fp-range" class="form-control dt-range-datepicker" placeholder="Datepicker Range" />'
    );

    $('.dt-range-datepicker').daterangepicker({
            "drops": "auto",
            "showWeekNumbers": true,
            "showISOWeekNumbers": true,
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear',
                format: 'DD/MM/YYYY'
            },
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            "linkedCalendars": false,
            "alwaysShowCalendars": true,
            "startDate": moment().subtract(1, 'month').startOf('month'),
            "endDate": moment().subtract(1, 'month').endOf('month')
        },
        function (start, end, label) {
            minDate = start.toDate();
            maxDate = end.toDate();

            dt_basic.draw();
        });

    $('.dt-range-datepicker').on('apply.daterangepicker', function (ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $('.dt-range-datepicker').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
        minDate = undefined;
        maxDate = undefined;
        dt_basic.draw();
    });



    // CSV File uploader button
    $("div.csv-action-button").html(
        '<form id="csv_svae_form" method="POST" enctype="multipart/form-data">'+
        '<input class="form-control" type="file" id="csvFile" name="csv_file"/>' +
        '</form>'
    );

    $("#csvFile").on('change', function (event) {
        var fileData = this.files[0];
        var fileType = fileData.type;
        var match = "text/csv";

        if(fileType ){
            let myForm = document.getElementById('csv_svae_form');
            let formData = new FormData(myForm);
            sendRequest(formData);
        }else {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Your uploaded file format is not allowed. Please upload csv only.',
            })
        }

        function sendRequest(event) {
            $.ajax({
                type: 'POST',
                data: event,
                dataType: 'JSON',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                contentType: false,
                cache: false,
                processData: false,
                url: 'staff/csv-file',
                success: function (response) {
                    if (response.success === 'Success'){
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your files are succesfull uploaded!',
                            showConfirmButton: false,
                            timer: 1500,
                            customClass: {
                                confirmButton: 'btn btn-primary'
                            },
                            buttonsStyling: false
                        }).then(() => {
                            window.location.reload();
                        });
                    }else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Please check your csv data',
                        }).then(() => {
                            window.location.reload();
                        })
                    }
                }
            });
        }
    })



    $('table').on('click', '.col-actions .btn', function (e) {
        var status = $(this).data('status');
        var attendanceId = $(this).data('leave-id');

        // $(this).tooltip('hide')

        $.ajax({
            url: 'staff/attendance/status/' + attendanceId,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST',
            data: {_method: 'PATCH', 'status': status},
            success: function (response) {
                getLeaveStatistics();
                dt_basic.ajax.reload();

                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500,
                    customClass: {
                        confirmButton: 'btn btn-primary'
                    },
                    buttonsStyling: false
                }).then(() => {
                    window.location.reload();
                });
            }
        });
    });

    // Flat Date picker
    if (dt_date_table.length) {
        dt_date_table.flatpickr({
            monthSelectorType: 'static',
            dateFormat: 'm/d/Y'
        });
    }

    getLeaveStatistics();
    function getLeaveStatistics() {
        $.ajax({
            url: 'staff/attendance/statistics',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST',
            data: {_method: 'PATCH', 'status': status},
            success: function (res) {
                $.each(res.data, function (k, v) {
                    $('#' + v.status + '-count').html(v.total);
                });
            }
        });
    }
});


function checkInLocation(element) {
    var checkIn = $(element).data("string");
    if(checkIn !== null){
        $("#locationMap").modal('show');
        openInfowindow(checkIn);
    }
}


/**
 * openInfowindow
 */
function openInfowindow(geoLocation) {
    const geocoder = new google.maps.Geocoder();

    if (geoLocation !== null) {
        geocoder.geocode({'address': geoLocation}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                const latitude = results[0].geometry.location.lat();
                const longitude = results[0].geometry.location.lng();

                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 6,
                    center: {lat: latitude, lng: longitude},
                    fullscreenControl: false,
                    zoomControl: false,
                    scaleControl: true,
                    mapTypeControl: false,
                    streetViewControl: false,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                const marker = new google.maps.Marker({
                    position: {lat: latitude, lng: longitude},
                    map: map,
                });


                const contentString =
                    '<div id="content">' +
                    '<div id="siteNotice">' +
                    "</div>" +
                    '<div id="bodyContent">' +
                    '<p class="mb-2"><strong>' + geoLocation + '</strong></p>' +
                    "</div>" +
                    "</div>";


                const infoindow = new google.maps.InfoWindow({
                    content: contentString,
                });
                infoindow.open(map, marker);
            }
        });
    }
}

// Picture Model
function checkInCheckOutPic(element) {
    var checkInCheckOut = $(element).data("pic");

    if(checkInCheckOut !== null){
        Swal.fire({
            imageUrl: checkInCheckOut,
            imageWidth: 400,
            imageHeight: 200,
        })
    }
}



function expenseOnChangeStatus(status) {
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
                $('.dt-checkboxes:checked').each(function() {
                    updateStaffStatus(status, this.value, function(res) {
                        updated = true;
                        message = res.message;

                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: message,
                            showConfirmButton: false,
                            timer: 1500,
                            customClass: {
                                confirmButton: 'btn btn-primary'
                            },
                            buttonsStyling: false
                        }).then(() => {
                            window.location.reload();
                        });

                    });
                });

            } else if (result.dismiss === Swal.DismissReason.cancel) {

            }
        });

    }
}

function updateStaffStatus(status, leaveId, cb) {
    $.ajax({
        url: 'staff/attendance/status/' + leaveId,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        type: 'POST',
        data: {_method: 'PATCH', 'status': status },
        success: function(response) {
            cb(response);
        }
    });
}

