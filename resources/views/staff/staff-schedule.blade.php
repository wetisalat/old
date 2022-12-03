@extends('layouts/contentLayoutMaster')
@section('title', 'Staff Leave')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('staff-leave') }}">
<meta name="save-leave-url" content="{{ route('leave') }}">

<style type="text/css">
    .md-switching-view-cont .mbsc-segmented {
        max-width: 350px;
        margin: 0 auto;
    }
    
    .md-switching-view-cont .mbsc-calendar-grid-item {
        height: 490px;
        box-sizing: border-box;
    }
    
    .cal-header-picker {
        flex: 1 0 auto;
    }
    
    .cal-header-nav {
        width: 200px;
    }
    
    /* material header order */
    
    .mbsc-material.cal-header-prev {
        order: 1;
    }
    
    .mbsc-material.cal-header-next {
        order: 2;
    }
    
    .mbsc-material.cal-header-nav {
        order: 3;
    }
    
    .mbsc-material .cal-header-picker {
        order: 4;
    }
    
    .mbsc-material .cal-header-today {
        order: 5;
    }
    
    /* windows header order */
    
    .mbsc-windows.cal-header-nav {
        order: 1;
    }
    
    .mbsc-windows.cal-header-prev {
        order: 2;
    }
    
    .mbsc-windows.cal-header-next {
        order: 3;
    }
    
    .mbsc-windows .cal-header-picker {
        order: 4;
    }
    
    .mbsc-windows .cal-header-today {
        order: 5;
    }

    .md-meal-planner-calendar .md-meal-planner-event-title {
        font-size: 12px;
    }
    .md-meal-planner-calendar .md-meal-planner-event-desc {
        opacity: .6;
    }
    .mbsc-calendar-width-md .mbsc-schedule-event-all-day-inner
    {
        height: 40px;
    }
    .md-custom-event-time {
        font-size: 13px;
        color: #666;
        padding-top: 3px;
    }
    /* Tooltip Styles */
    .md-tooltip .mbsc-popup-content {
        padding: 0;
    }

    .md-tooltip {
        font-size: 15px;
        font-weight: 600;
    }

    .md-tooltip-header {
        padding: 12px 16px;
        color: #eee;
    }

    .md-tooltip-info {
        padding: 16px 16px 60px 16px;
        position: relative;
        line-height: 32px;
    }

    .md-tooltip-time,
    .md-tooltip-status-button {
        float: right;
    }

    .md-tooltip-title {
        margin-bottom: 15px;
    }

    .md-tooltip-text {
        font-weight: 300;
    }

    .md-tooltip-info .mbsc-button {
        font-size: 14px;
        margin: 0;
    }

    .md-tooltip-info .mbsc-button.mbsc-material {
        font-size: 12px;
    }

    .md-tooltip-view-button {
        position: absolute;
        bottom: 16px;
        left: 16px;
    }

    .md-tooltip-delete-button {
        position: absolute;
        bottom: 16px;
        right: 16px;
    }
    
    .md-custom-event-cont {
        font-size: 12px;
        font-weight: 600;
        position: relative;
        left: 0.2em;
        min-height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #000;
        border-radius: 0.25em;
        box-sizing: border-box;
        height: 100%;
    }
    .md-custom-event-details {
        padding: 0 10px;
    }
    .mbsc-ios.mbsc-schedule-event-all-day {
        padding: 0 0.5em 0 .25em;
    }
     :fullscreen::backdrop {
        background-color: #f8f8f8;
    } 
    :-webkit-full-screen::backdrop{
        background-color: #f8f8f8;
    }
    :-moz-full-screen::backdrop {
        background-color: #f8f8f8;
    }
  </style>
@endsection

@section('content')
<section >
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body border-bottom">
                    <div class="md-event-listing" style="height: 100%;">
                        <div id="demo-day-week-view" class="md-switching-view-cont md-meal-planner-calendar"></div>
                        <div id="meal-planner-popup" class="md-meal-planner-popup">                            
                            <div class="mbsc-form-group">                               
                                <label>
                                    Reason
                                    <input mbsc-input id="reason-leave-input" data-dropdown="true" />
                                </label>
                                <select id="reason-leave-single-select">
                                    @foreach($leave_reasons as $reason)
                                        <option value="{{ $reason->id }}">{{ $reason->name }}</option>
                                    @endforeach
                                </select>
                                <label>
                                    Description
                                    <textarea mbsc-textarea id="meal-notes-textarea"></textarea>
                                </label>
                            </div>
                            <div class="mbsc-form-group">
                                <label>
                                    <input mbsc-switch data-label="All-day" type="checkbox" checked id="event-all-day" />
                                </label>
                                <label>
                                    Start
                                    <input class="start-and-end" mbsc-input placeholder="Please select..." id="leave-start-input" />
                                </label>
                                <label>
                                    End
                                    <input class="start-and-end" mbsc-input placeholder="Please select..." id="leave-end-input" />
                                </label>
                                <div id="event-date"></div>
                                <!-- <label>
                                    Repeats
                                    <input mbsc-input id="repeat-leave-input" data-dropdown="true" />
                                </label>
                                <select id="repeat-leave-single-select">
                                    <option value="0" selected>Does not repeat</option>
                                    <option value="1">Repeat</option>
                                </select> -->
                            </div>
                            <div class="mbsc-button-group">
                                <button class="mbsc-button-block" id="meal-delete" mbsc-button data-color="danger" data-variant="outline">Delete meal</button>
                            </div>
                        </div>

                        <!-- Custom Schedule Tooltip Begin -->
                         <div id="custom-event-tooltip-popup" class="md-tooltip">
                            <div id="tooltip-event-header" class="md-tooltip-header">
                                <span id="tooltip-event-name-age" class="md-tooltip-name-age"></span>
                                <span id="tooltip-event-time" class="md-tooltip-time"></span>
                            </div>
                            <div class="md-tooltip-info">
                                <div class="md-tooltip-title">
                                    <button id="tooltip-event-edit" mbsc-button data-color="warning" data-variant="outline" class="md-tooltip-status-button">Edit Appointment</button>                                
                                </div>

                                <div class="md-tooltip-title">Location: <span id="tooltip-event-location" class="md-tooltip-location md-tooltip-text"></span></div>
                                <div class="md-tooltip-title">Todo: <span id="tooltip-event-todo" class="md-tooltip-todo md-tooltip-text"></span></div>   
                                <div class="md-tooltip-title">Pause: <span id="tooltip-event-pause" class="md-tooltip-pause md-tooltip-text"></span></div> 
                                <div class="md-tooltip-title">Lunch: <span id="tooltip-event-lunch" class="md-tooltip-lunch md-tooltip-text"></span></div> 
                                <!-- <div class="md-tooltip-title">Reason: <span id="tooltip-leave-reason" class="md-tooltip-reason md-tooltip-text"></span></div>   -->
                                <div class="md-tooltip-title">Description: <span id="tooltip-event-description" class="md-tooltip-description md-tooltip-text"></span></div>       
                                <!-- <button id="tooltip-event-view" mbsc-button data-color="secondary" class="md-tooltip-view-button">View patient file</button> -->
                           
                                <button id="tooltip-event-delete" mbsc-button data-color="danger" data-variant="outline" class="md-tooltip-delete-button">Delete appointment</button>
                            </div>
                        </div>
                        <!-- Custom Tooltip End -->   
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
var calendar;
var theme = "{{ isset($themeMode) && $themeMode->status == 1 ? 'dark' : 'light' }}";

mobiscroll.setOptions({
    theme: "{{ isset($themeMode) && $themeMode->status == 1 ? 'vuexy-theme' : 'ios' }}",                    // Specify theme like: theme: 'ios' or omit setting to use default
    themeVariant: theme,  
    timeFormat: 'HH:mm', // Specify the time format for each view
    dateFormat: 'DDDD, DD MMMM YYYY', // Specify the date format for each view
    locale: mobiscroll.locale['{{ $lang }}'],
    clickToCreate: true,
    dragToCreate: true,
    dragToMove: true,
    dragToResize: true
});

$(function () {
    var now = new Date();
    var today = new Date(now.setMinutes(59));
    var yesterday = new Date(now.getFullYear(), now.getMonth(), now.getDate() - 1);

    var popup;
    var oldMeal;
    var tempMeal;
    var deleteMeal;
    var formatDate = mobiscroll.util.datetime.formatDate;
    var $name = $('#meal-name-input');
    var $calories = $('#meal-calories-input');
    var $notes = $('#meal-notes-textarea');
    var $deleteButton = $('#meal-delete');
    var $types = $('#meal-type-segmented');

    var selected = [1];
    var events = [];
    
    var $allDay = $('#event-all-day');
    var range;
    var tempEvent = {};
    var resources = []
    var currentEvent;
    var datePickerResponsive = {
        medium: {
            controls: ['calendar'],
            touchUi: false
        }
    };
    var datetimePickerResponsive = {
        medium: {
            controls: ['calendar', 'time'],
            touchUi: false
        }
    }
                    
    var timer;        
    var $tooltip = $('#custom-event-tooltip-popup');
    var $tooltipEditEvent = $('#tooltip-event-edit');
    var $tooltipViewEvent = $('#tooltip-event-view');
    var $tooltipDeleteEvent = $('#tooltip-event-delete');
    var $tooltipEventTodo = $('#tooltip-event-todo');
    var $tooltipEventLocation = $('#tooltip-event-location');
    var $tooltipEventPause = $('#tooltip-event-pause');
    var $tooltipEventLunch = $('#tooltip-event-lunch');
    var $tooltipEventDescription = $('#tooltip-event-description');
    var $tooltipLeaveReason = $('#tooltip-leave-reason');

    var $header = $('#tooltip-event-header');
    var $data = $('#tooltip-event-name-age');
    var $time = $('#tooltip-event-time');
    var $status = $('#tooltip-event-title');       
    var $eventName = $('#tooltip-event-name');
    var $eventEmail = $('#tooltip-event-email');

    function addMealPopup() {
        // hide delete button inside add popup
        $deleteButton.hide();
        deleteMeal = true;
        restoreMeal = false;

        // set popup header text and buttons for adding
        popup.setOptions({
            headerText: '<div>New Leave</div><div class="md-meal-type">' +
                formatDate('DDDD, DD MMMM YYYY', new Date(tempMeal.start)) + '</div>',
            buttons: [
                'cancel',
                {
                    text: 'Add',
                    keyCode: 'enter',
                    handler: function () {
                        tempMeal.resource = {!! auth()->user()->id !!};
                        calendar.updateEvent(tempMeal);

                        createOrUpdateLeave(tempMeal, 1);

                        deleteMeal = false;
                        popup.close();
                    },
                    cssClass: 'mbsc-popup-button-primary'
                }
            ]
        });

        // fill popup with a new event data
        $name.mobiscroll('getInst').value = tempMeal.title;
        $calories.mobiscroll('getInst').value = '';
        $notes.mobiscroll('getInst').value = '';
        range.setVal([tempMeal.start, tempMeal.end]);

        // $('.meal-planner-type').each(function (i, elm) {
        //     $(elm).mobiscroll('getInst').checked = + elm.value == tempMeal.resource;
        // });

        popup.open();
    }

    function editMealPopup(args) {
        var ev = args ? args.event : currentEvent;
        // var resource = resources.find(function (obj) { return obj.id === ev.resource });

        $deleteButton.show();

        deleteMeal = false;
        restoreMeal = true;

        // // set popup header text and buttons for editing
        popup.setOptions({
            headerText: '<div>' + ev.title + '</div><div class="md-meal-type">' +
                formatDate('DDDD, DD MMMM YYYY', new Date(ev.start)) + '</div>',
            buttons: [
                'cancel',
                {
                    text: 'Save',
                    keyCode: 'enter',
                    handler: function () {
                        // update event with the new properties on save button click
                        var updated_event = {
                            id: ev.id,
                            title: tempMeal.title,
                            calories: tempMeal.calories,
                            notes: tempMeal.notes,
                            start: ev.start,
                            end: ev.end,
                            // resource: tempMeal.resource,
                            allDay: true,
                        };

                        calendar.updateEvent(updated_event);
                        createOrUpdateLeave(updated_event);

                        restoreMeal = false;
                        popup.close();
                    },
                    cssClass: 'mbsc-popup-button-primary'
                }
            ]
        });

        // fill popup with the selected event data
        $name.mobiscroll('getInst').value = ev.title || '';
        $calories.mobiscroll('getInst').value = ev.calories || '';
        $notes.mobiscroll('getInst').value = ev.description || '';
        range.setVal([ev.start, ev.end]);
        leaveReasonSelect.setVal(ev.reason);

        // $('.meal-planner-type').each(function (i, elm) {
        //     $(elm).mobiscroll('getInst').checked = +elm.value == tempMeal.resource;
        // });

        popup.open();
    }

    var all_events = {!! json_encode($events) !!};
    all_events = all_events.concat({!! json_encode($leave) !!});

    var leave = {!! json_encode($leave) !!};

    leave = leave.map(function(leaveRow) {
        leaveRow.title = '';

        return leaveRow;
    });

    calendar = $('#demo-day-week-view').mobiscroll().eventcalendar({
        onEventClick: function (event, inst) {
        },
        onEventDoubleClick: function (event, inst) {
        },
        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
            calendar: {
                weekNumbers: true,
                labels: true         // More info about labels: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-labels
            }
        },
        dateFormatLong: 'DDD D MMM YYYY',
        firstDay: 1,
        invalid: [{
            recurring: {
                repeat: 'daily',
                until: yesterday
            }
        }, {
            start: yesterday,
            end: today
        }],
        colors: leave,
        data: all_events,
        renderHeader: function () {  // More info about renderHeader: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-renderHeader
            return '<div mbsc-calendar-nav class="cal-header-nav"></div>' +
                '<div class="cal-header-picker">' +
                '<label>{{ __("Year") }}<input mbsc-segmented type="radio" name="view" value="year" class="md-view-change"></label>' +
                '<label>{{ __("Month") }}<input mbsc-segmented type="radio" name="view" value="month" class="md-view-change" checked></label>' +
                '<label>{{ __("Week") }}<input mbsc-segmented type="radio" name="view" value="week" class="md-view-change"></label>' +
                '<label>{{ __("Day") }}<input mbsc-segmented type="radio" name="view" value="day" class="md-view-change"></label>' +
                '</div>' +
                '<div mbsc-calendar-prev class="cal-header-prev"></div>' +
                '<div mbsc-calendar-today class="cal-header-today"></div>' +
                '<div mbsc-calendar-next class="cal-header-next"></div>';
        },
        renderScheduleEvent: function (data) {
            var color = '#000';

            if (data.color)
            {
                color = data.color;
            }

            return '<div class="md-custom-event-cont" style="background:' + color + ';">' +
                    '<div class="md-custom-event-wrapper">' +
                    '<div class="md-custom-event-time" style="text-align: center; font-weight: 600;">' 
                        + '<div>' + (data.title ? data.title : '') + '</div>'
                    '</div></div></div>';
        },
        dragToCreate: false,
        dragToResize: false,
        dragToMove: true,
        clickToCreate: true,
        extendDefaultEvent: function (ev) {
            return {
                title: 'New leave',
                allDay: true
            };
        },
        onEventCreate: function (args) {
            var oldEvent = args.event.original ? args.event.original : args.event;
            var start = oldEvent && oldEvent.start ? oldEvent.start : null;

            // handle recurring events
            if (start && start < today) {
                calendar.updateEvent(oldEvent);
                mobiscroll.toast({
                    message: 'Can\'t move past event'
                });
                return false;
            }
        },
        onEventUpdate: function (args) {
            var oldEvent = args.oldEvent;
            var start = oldEvent && oldEvent.start ? oldEvent.start : null;
            var oldEventOccurrence = args.oldEventOccurrence;
            var occurrenceStart = oldEventOccurrence && oldEventOccurrence.start ? oldEventOccurrence.start : null;

            // handle recurring events
            if ((start && start < today) || (occurrenceStart && occurrenceStart < today)) {
                inst.updateEvent(oldEvent);
                return false;
            }
        },
        onEventCreated: function (args, inst) {
            tempMeal = args.event;
            addMealPopup();
        },
        onEventCreateFailed: function (event) {
            console.log(event)
            if (!event.originEvent) {
                mobiscroll.toast({
                    message: 'Can\'t create event in the past'
                });
            }
        },
        onEventUpdateFailed: function (event) {
            if (!event.oldEventOccurrence) {
                mobiscroll.toast({
                    message: 'Can\'t move event in the past'
                });
            }
        },    
        onEventClick: function (args, inst) {
            oldMeal = $.extend({}, args.event);
            tempMeal = args.event;

            if (!popup.isVisible() && tempMeal.user_id === tempMeal.staff_id) {
                editMealPopup(args);
            }
        },
        onEventUpdated: function (event, inst) {
            createOrUpdateLeave(event.event);
        },
        onEventHoverIn: function (args, inst) {
            console.log("hover event")
            var event = args.event;

            event.staff_id = parseInt(event.staff_id);

            var startTime = new Date(event.start);
            var endTime = new Date(event.end);
                
            var timeDiff = endTime.getTime() - startTime.getTime();

            var time = formatDate('HH:mm', startTime) + ' - ' + formatDate('HH:mm', endTime);

            if(event.eventType === 'leave') {
                time = formatDate('DD-MM-YYYY', new Date(event.start)) + ' - ' + formatDate('DD-MM-YYYY', new Date(event.end));
                $header.css('color', '#000');
            }

            if(timeDiff && event.eventType === 'schedule' ) {
                time += ' ( ' + timeConvert(timeDiff) + ' )';
            }

            var button = {};
            
            currentEvent = event;

            if (event.confirmed) {
                button.text = 'Cancel appointment';
                button.type = 'warning';
            } else {
                button.text = 'Confirm appointment';
                button.type = 'success';
            }

            if(event.eventType === 'schedule') {
                $tooltipEditEvent.text( 'Edit Appointment' );
                $tooltipDeleteEvent.text( 'Delete Appointment' );
            } else {
                $tooltipEditEvent.text( 'Edit Leave' );
                $tooltipDeleteEvent.text( 'Delete Leave' );

                if(event.user_id === event.staff_id) {
                    $tooltipEditEvent.show();
                    $tooltipDeleteEvent.show();                
                } else {
                    $tooltipEditEvent.hide();
                    $tooltipDeleteEvent.hide();
                }
            }

            $header.css('background-color', event.color);
            $data.text(currentEvent.title);
            $time.text(time);

            $status.text(event.confirmed ? 'Confirmed' : 'Canceled');

            if(event.todo_title) {
                $tooltipEventTodo.text(event.todo_title).closest('div').show();
            } else {
                $tooltipEventTodo.closest('div').hide();
            }

            if(event.location_name) {
                $tooltipEventLocation.text(event.location_name).closest('div').show();
            } else {
                $tooltipEventLocation.closest('div').hide();
            }

            if(event.pause) {
                $tooltipEventPause.text(event.pause).closest('div').show();
            } else {
                $tooltipEventPause.closest('div').hide();
            }

            if(event.description) {
                $tooltipEventDescription.text(event.description).closest('div').show();
            } else {
                $tooltipEventDescription.closest('div').hide();
            }

            if(event.lunch) {
                $tooltipEventLunch.text(event.lunch).closest('div').show();
            } else {
                $tooltipEventLunch.closest('div').hide();
            }

            clearTimeout(timer);
            timer = null;

            tooltip.setOptions({ anchor: args.domEvent.target });

            // show popup if event is created by staff
            if(event.user_id === event.staff_id) {
                tooltip.open();
            }
        },
        onEventHoverOut: function (args) {
            if (!timer) {
                timer = setTimeout(function () {
                    tooltip.close();
                }, 200);
            }
        },
    }).mobiscroll('getInst');

    var popup = $('#meal-planner-popup').mobiscroll().popup({
        display: 'bottom',
        contentPadding: false,
        fullScreen: true,
        onClose: function () {
            if (deleteMeal) {
                calendar.removeEvent(tempMeal);
            } else if (restoreMeal) {
                calendar.updateEvent(oldMeal);
            }
        },
        responsive: {
            medium: {
                display: 'center',
                width: 400,
                fullScreen: false,
                touchUi: false,
                showOverlay: false
            }
        }
    }).mobiscroll('getInst');   

    // $('.meal-planner-type').on('change', function (ev) {
    //     tempMeal.resource = +ev.target.value;
    // });

    $name.on('change', function (ev) {
        tempMeal.title = ev.target.value;
    });

    $calories.on('change', function (ev) {
        tempMeal.calories = ev.target.value;
    });

    $notes.on('change', function (ev) {
        tempMeal.description = ev.target.value;
    });

    $deleteButton.on('click', function () {
        // delete current event on button click
        calendar.removeEvent(tempMeal);

        // save a local reference to the deleted event
        var deletedMeal = tempMeal;

        popup.close();

        createOrUpdateLeave(tempMeal, 2);

        mobiscroll.snackbar({
            button: {
                action: function () {
                    calendar.addEvent(deletedMeal);
                },
                text: 'Undo'
            },
            duration: 10000,
            message: 'Leave deleted'
        });
        
    });

    $('#staff-leave-single-select').mobiscroll().select({
        display: 'center',
        inputElement: document.getElementById('staff-leave-input'),
        touchUi: true
    });
    var leaveReasonSelect = $('#reason-leave-single-select').mobiscroll().select({
        display: 'center',
        inputElement: document.getElementById('reason-leave-input'),
        touchUi: true,
        onChange: function(ev, inst) {
            tempMeal.reason = ev.value
        }
    }).mobiscroll('getInst');
    $('#repeat-leave-single-select').mobiscroll().select({
        display: 'center',
        inputElement: document.getElementById('repeat-leave-input'),
        touchUi: true
    });
    /*************** All day Begin *****************/
    $allDay.on('change', function () {
        var checked = this.checked

        // change range settings based on the allDay
        range.setOptions({
            controls: checked ? ['date'] : ['datetime'],
            responsive: checked ? datePickerResponsive : datetimePickerResponsive
        });

        // update current event's allDay property
        tempEvent.allDay = checked;
    });
    range = $('#event-date').mobiscroll().datepicker({
        controls: ['date'],
        select: 'range',
        startInput: '#leave-start-input',
        endInput: '#leave-end-input',
        showRangeLabels: false,
        touchUi: true,
        responsive: datePickerResponsive,
        dateFormat: 'DDD D MMM YYYY',
        timeFormat: 'HH:mm',
        onChange: function (args) {
            var date = args.value;

            // update event's start date
            tempMeal.start = date[0];
            tempMeal.end = date[1];
        }
    }).mobiscroll('getInst');

    /*************** All day End *****************/
    $('.md-view-change').change(function (ev) {
        switch (ev.target.value) {
            case 'year':
                calendar.setOptions({
                    view: {
                        calendar: { type: 'year', weekNumbers: true, labels: true }
                    },
                    // colors: []
                })
                break;
            case 'month':
                calendar.setOptions({
                    view: {
                        calendar: { type: 'month', weekNumbers: true, labels: true }
                    },
                    // colors: [
                    //     {
                    //         background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                    //     }
                    // ],
                })
                break;
                case 'day':
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-view
                            schedule: {
                                type: 'week',
                                allDay: true,
                                weekNumbers: true
                            },
                            // colors: [
                            //     {
                            //         background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                            //     }
                            // ],
                        }
                    })
                break;
            case 'week':
                calendar.setOptions({
                    view: {
                        timeline: {
                            type: 'week',
                            eventList: true,
                            weekNumbers: true
                        }
                    },
                    // renderScheduleEventContent: function (args) {
                    //     var event = args;
                    //     return '<div class="md-meal-planner-event">' +
                    //         '<div class="md-meal-planner-event-title">' + event.title + '</div>' +
                    //         '<div class="md-meal-planner-event-desc">Name: here</div>' +
                    //         '</div>';
                    // },
                    // colors: [
                    //     {
                    //         background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                    //     }
                    // ],
                })
                break;
        }
    });

    var tooltip = $tooltip.mobiscroll().popup({
        display: 'anchored',
        touchUi: false,
        showOverlay: false,
        contentPadding: false,
        closeOnOverlayClick: false,
        width: 450
    }).mobiscroll('getInst');

    $tooltip.mouseenter(function (ev) {
        if (timer) {
            clearTimeout(timer);
            timer = null;
        }
    });

    $tooltip.mouseleave(function (ev) {
        timer = setTimeout(function () {
            tooltip.close();
        }, 200);
    });

    $tooltipEditEvent.on('click', function(ev) {
        tempMeal = currentEvent;
        editMealPopup();
    });

    $tooltipDeleteEvent.on('click', function (ev) {           
            
        if(currentEvent.eventType === 'leave') {
            // delete current event on button click
            calendar.removeEvent(currentEvent);

            // save a local reference to the deleted event
            var deletedMeal = currentEvent;

           $.ajax({
                url: '{{ url("staff/leave")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'DELETE'},
                success: function(data) {
                    popup.close();

                    mobiscroll.snackbar({
                        button: {
                            action: function () {
                                calendar.addEvent(deletedMeal);
                            },
                            text: 'Undo'
                        },
                        duration: 10000,
                        message: 'Leave deleted'
                    });

                    getStaffEventsAjax();
                }
            });
        }
    });    


    function timeConvert(n) {
        var num = n/60000; // convert to minutes
        var hours = (num / 60); // convert to hours
        var rhours = Math.floor(hours);
        var minutes = (hours - rhours) * 60;
        var rminutes = Math.round(minutes);
        return rhours + " hrs " + rminutes + " mins";
    }

    $('#print-schedule').on('click', function () {
        calendar.print();
    });

    $('#view-fullscreen').on('click', function(e) {
        var element = document.body;
        openFullscreen(element);
    });

});
</script>
@include('users.schedule.include-common-script')
@endsection