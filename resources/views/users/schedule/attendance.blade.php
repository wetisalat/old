@extends('layouts/contentLayoutMaster')

@section('title', 'Attendance')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('staff-leave') }}">
<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }

    body,
    html {
        height: 100%;
    }

    .md-shift-management-calendar .mbsc-schedule-event {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 36px;
    }
    
    .md-shift-management-calendar .mbsc-timeline-slots {
        height: 94px;
    }
    
    .md-shift-management-calendar .mbsc-timeline-header-placeholder {
        height: 120px;
    }
    
    .md-shift-management-calendar .mbsc-timeline-resource {
        display: flex;
        align-items: center;
    }
    
    .md-shift-management-calendar .mbsc-timeline-slot {
        width: 200px;
    }
    
    .md-shift-header-controls {
        flex: 1 0 auto;
        display: flex;
        justify-content: end;
    }
    
    .md-shift-header-controls .mbsc-checkbox {
        padding: 18px 0 18px 45px;
    }
    
    .md-shift-cal-view.mbsc-textfield-wrapper {
        margin: 12px 12px 12px 28px;
    }
    
    .md-shift-cal-view .mbsc-select.mbsc-textfield {
        height: 32px;
        width: 120px;
    }
    
    .md-shift-cal-view .mbsc-icon.mbsc-select-icon {
        width: 20px;
        height: 20px;
        top: 7px;
    }
    
    .md-shift-resource {
        font-size: 18px;
    }
    
    .md-shift-resource-icon {
        margin-right: 10px;
    }
    
    .md-shift-header {
        margin: 3px 6px;
        display: flex;
        flex-direction: column;
    }
    
    .md-shift-name {
        font-size: 15px;
    }
    
    .md-shift-time {
        opacity: .5;
        font-size: 12px;
        margin-left: 5px;
    }
    
    .md-shift-count {
        margin-top: 6px;
        margin-right: 12px;
        display: inline-block;
        width: 26px;
        height: 20px;
    }
    
    .md-shift-icon {
        padding-right: 3px;
    }
    </style>
@endsection

@section('content')
<section >
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body border-bottom">
                    <div mbsc-page class="attendance-shift-management">
                        <div style="height:100%">
                            <div id="attendance-shift-management" class="md-shift-management-calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection


@section('vendor-script')
  {{-- vendor files --}}
  <script src="{{ asset('vendors/js/mobiscroll/mobiscroll.jquery.min.js') }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
@php

$user_id = Auth::id();
$themeMode = \App\Models\ThemeMode::where('user_id', '=', $user_id)->first();
$lang = 'en';

if(session()->has('locale'))
{
    $lang = session()->get('locale');

    if($lang == 'pt')
    {
        $lang .= '-PT';
    }
}
@endphp
<script>

    mobiscroll.setOptions({
        locale: mobiscroll.localeEn,                // Specify language like: locale: mobiscroll.localePl or omit setting to use default
        theme: 'ios',                               // Specify theme like: theme: 'ios' or omit setting to use default
        themeVariant:  theme,                    // More info about themeVariant: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-themeVariant
        timeFormat: 'HH:mm', // Specify the time format for each view
        dateFormat: 'DDDD, DD MMMM YYYY' // Specify the date format for each view
    });
    
    $(function () {
        var calendar;
        var resources = [{
            id: 1,
            name: 'Presence',
            icon: '&#129333;',
            children: [{
                id: 11,
                name: 'Jude Chester',
                color: '#1dab2f'
            }, {
                id: 13,
                name: 'Ryan Melicent',
                color: '#1dab2f'
            }]
        }, {
            id: 2,
            name: 'Absence',
            icon: '&#128718;',
            children: [{
                id: 21,
                name: 'Breanne Lorinda',
                color: '#ff1717'
            }, {
                id: 22,
                name: 'Jenifer Kalyn',
                color: '#ff1717'
            }]
        }, {
            id: 3,
            name: 'Late',
            icon: '&#x1f9f9;',
            children: [{
                id: 31,
                name: 'Meredith Chantelle',
                color: '#f7961e'
            }]
        }, {
            id: 4,
            name: 'Leave',
            icon: '&#x2615;&#xfe0f;',
            children: [{
                id: 41,
                name: 'Layton Candace',
                color: '#7056ff'
            }]
        }];
    
        var data = [ 
            {
                start: '2022-03-13T02:00',
                end: '2022-03-17T10:00',
                title: 'Derek',
                resource: 21,
                slot: 1
            },
            {
                start: '2022-03-13T02:00',
                end: '2022-03-17T10:00',
                title: 'Florence',
                resource: 46,
                slot: 1
            }, {
                start: '2022-03-13T08:00',
                end: '2022-03-17T12:00',
                title: 'Willis',
                resource: 12,
                slot: 2
            }, {
                start: '2022-03-18T08:00',
                end: '2022-03-13T12:00',
                title: 'Jewell',
                resource: 32,
                slot: 2            
            }, {
                start: '2022-03-19T11:00',
                end: '2022-03-19T11:59',
                title: 'Fred',
                resource: 71,
                slot: 5
            }  
        ];
    
        var slots = [{
            id: 1,
            name: 'Check-In'
        }, {
            id: 2,
            name: 'Check-Out'
        }, {
            id: 3,
            name: 'Break'
        }, {
            id: 4,
            name: 'Transport'
        }, {
            id: 5,
            name: 'Expenses'    
        }];
    
        calendar = $('#attendance-shift-management').mobiscroll().eventcalendar({
        onEventClick: function (event, inst) {
        },
        onEventDoubleClick: function (event, inst) {
        },
            view: {                                 // More info about view: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-view
                timeline: {
                    type: 'week',
                    eventList: true,
                    weekNumbers: true,
                }
            },
            dateFormatLong: 'DDD D MMM YYYY',
            firstDay: 1,
            data: data,                             // More info about data: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-data
            resources: resources,                   // More info about resources: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-resources
            slots: slots,                           // More info about slots: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-slots
            invalid: [{                             // More info about invalid: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-invalid
                recurring: {
                    repeat: 'daily'
                },
                resource: [1, 2, 3, 4]
            }],
            clickToCreate: true,                    // More info about clickToCreate: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-clickToCreate
            dragToMove: true,                       // More info about dragToMove: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-dragToMove
            renderSlot: function (args) {           // More info about renderSlot: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-renderSlot
                var slot = args.slot;
                var date = formatDate(args.date);
                var shiftsElm = '';
                var shiftList = getShiftsNrs(date, slot.id);
                var length = 0;
    
                if (shiftList.length > 0) {
                    for (var i = 0; i < shiftList.length; ++i) {
                        if (shiftList[i]) {
                            shiftsElm += '<div class="md-shift-count">' +
                                '<span class="md-shift-icon">' + resources[i].icon + '</span>' +
                                '<span class="md-shift-nr md-shift-nr-' + date + '-' + slot.id + '-' + (i + 1) + '">' +
                                shiftList[i] + '</span></div>' + (length === 3 ? '<br />' : '');
                            ++length;
                        }
                    }
                } else {
                    shiftsElm += '<div class="md-shift-count">&#x1f636; empty...</div>';
                }
    
                return '<div class="md-shift-header">' +
                    '<div class="md-shift-name">' + slot.name + '<span class="md-shift-time">' + '</span></div>' +
                    '<div class="md-shift-counts-' + date + '-' + slot.id + '">' + shiftsElm + '</div></div>';
            },
            renderHeader: function () {             // More info about renderHeader: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-renderHeader
                return '<div mbsc-calendar-nav></div>' +
                    '<div class="md-shift-header-controls">' +
                    '<label>Check-In' +
                    '<input mbsc-checkbox type="checkbox" data-theme="material" class="md-shift-filter" value="1" checked>' +
                    '</label>' +
                    '<label>Check-Out' +
                    '<input mbsc-checkbox type="checkbox" data-theme="material" class="md-shift-filter" value="2" checked>' +
                    '</label>' +
                    '<label>Break' +
                    '<input mbsc-checkbox type="checkbox" data-theme="material" class="md-shift-filter" value="3" checked>' +
                    '</label>' +
                    '<label>Transport' +
                    '<input mbsc-checkbox type="checkbox" data-theme="material" class="md-shift-filter" value="4" checked>' +
                    '</label>' +
                    '<label>Expenses' +
                    '<input mbsc-checkbox type="checkbox" data-theme="material" class="md-shift-filter" value="5" checked>' +
                    '</label>' +
                    '<label class="md-shift-cal-view">' +
                    '<input mbsc-input id="shift-management-view" data-dropdown="true" data-input-style="box" />' +
                    '</label>' +
                    '<select id="shift-management-select">' +
                    '<option value="day">Day</option>' +
                    '<option value="week" selected>Week</option>' +
                    '</select>' +
                    '</div>' +
                    '<div mbsc-calendar-prev></div>' +
                    '<div mbsc-calendar-today></div>' +
                    '<div mbsc-calendar-next></div>';
            },
            renderResource: function (resource) {   // More info about renderResource: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-renderResource
                var parent = resource.children;
                return '<div class="' + (parent ? 'md-shift-resource' : '') +
                    '" style="color:' + (parent ? parent[0].color : '') + '">' +
                    (parent ? '<span class="md-shift-resource-icon">' + resource.icon + '</span>' : '') +
                    resource.name + '</div>';
            },
            extendDefaultEvent: function (event) {  // More info about extendDefaultEvent: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-extendDefaultEvent
                return {
                    title: getEmployeeName(event)
                }
            },
            onEventCreate: function (args, inst) {  // More info about onEventCreate: https://docs.mobiscroll.com/5-15-1/eventcalendar#event-onEventCreate
                return addUpdateEvent(args.event, inst);
            },
            onEventUpdate: function (args, inst) {  // More info about onEventUpdate: https://docs.mobiscroll.com/5-15-1/eventcalendar#event-onEventUpdate
                var event = $.extend({}, args.event);
                if (addUpdateEvent(event, inst)) {
                    event.title = getEmployeeName(event);
                    if (event.title) {
                        inst.updateEvent(event);
                    }
                } else {
                    return false;
                }
            },
        }).mobiscroll('getInst');
    
        function addUpdateEvent(event, inst) {
            var date = event.start.setHours(0);
            var events = inst.getEvents(date);
            var ev = events.find(function (e) {
                return new Date(e.start).setHours(0) === date && e.resource === event.resource && e.slot === event.slot;
            });
            return ev ? false : true;
        }
    
        function getEmployeeName(event) {
            for (var i = 0; i < resources.length; ++i) {
                for (var j = 0; j < resources[i].children.length; ++j) {
                    var employee = resources[i].children[j];
                    if (employee.id === event.resource) {
                        return employee.name.substr(0, employee.name.indexOf(' '));
                    }
                }
            }
        }
    
        function getShiftsNrs(date, slotId) {
            var shifts = calendar ? calendar.getEvents(date) : data;
            var shiftNrs = [];
    
            for (var i = 0; i < shifts.length; ++i) {
                var shift = shifts[i];
                // get slot id from resource id
                var resourceNr = +shift.resource.toString().charAt(0);
                if (shift.slot == slotId && date == formatDate(shift.start)) {
                    shiftNrs[resourceNr - 1] = (shiftNrs[resourceNr - 1] || 0) + 1;
                }
            }
            return shiftNrs;
        }
    
        function formatDate(date) {
            return mobiscroll.util.datetime.formatDate('DD-MM-YYYY', new Date(date));
        }
    
        // Mobiscroll Event Calendar initialization
        $('#shift-management-select').mobiscroll().select({
            inputElement: document.getElementById('shift-management-view'),
            touchUi: false,
            onChange: function (event, inst) {
                if (event.value == 'day') {
                    calendar.setOptions({
                        view: {                                 // More info about view: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-view
                            timeline: {
                                type: 'day',
                                eventList: true
                            }
                        }
                    });
                } else {
                    calendar.setOptions({
                        view: {                                 // More info about view: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-view
                            timeline: {
                                type: 'week',
                                eventList: true,
                                weekNumbers: true,
                            }
                        }
                    });
                }
            }
        });
    
        $('.md-shift-filter').change(function () {
            var selected = [];
            var displayedSlots = [];
    
            $('.md-shift-filter:checked').each(function () {
                selected.push(+$(this).val());
                $(this).mobiscroll('getInst').setOptions({ disabled: false });
            });
    
            for (var i = 0; i < slots.length; ++i) {
                var slot = slots[i];
    
                if (selected.indexOf(slot.id) > -1) {
                    displayedSlots.push(slot);
                }
            }
    
            if (selected.length === 1) {
                $('.md-shift-filter[value=' + selected[0] + ']').mobiscroll('getInst').setOptions({ disabled: true });
            }
    
            calendar.setOptions({ slots: displayedSlots });
    
        });
    });
</script>
@include('users.schedule.include-common-script')
@endsection