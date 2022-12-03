@extends('layouts/contentLayoutMaster')
@section('title', 'Staff Leave')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('staff-leave') }}">
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
                                <select id="reason-leave-single-select" multiple>
                                    <option value="Reason_1">Reason 1</option>
                                    <option value="Reason_2">Reason 2</option>
                                    <option value="Reason_3">Reason 3</option>
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
                            </div>
                            <div class="mbsc-button-group">
                                <button class="mbsc-button-block" id="meal-delete" mbsc-button data-color="danger" data-variant="outline">Delete meal</button>
                            </div>
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
var calendar;
var theme = "{{ isset($themeMode) ? ($themeMode->status == 1 ? 'dark' : 'light') : 'dark' }}";
mobiscroll.setOptions({
    theme: 'ios',                    // Specify theme like: theme: 'ios' or omit setting to use default
    themeVariant:  theme,
    locale: mobiscroll.locale['{{ $lang }}'],
    timeFormat: 'HH:mm', // Specify the time format for each view
    dateFormat: 'DDDD, DD MMMM YYYY', // Specify the date format for each view
    clickToCreate: true,
    dragToCreate: true,
    dragToMove: true,
    dragToResize: true
});

$(function () {
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

    function addMealPopup() {
        // hide delete button inside add popup
        $deleteButton.hide();
        deleteMeal = true;
        restoreMeal = false;

        // set popup header text and buttons for adding
        popup.setOptions({
            headerText: '<div>New leave</div><div class="md-meal-type">' +
                formatDate('DDDD, DD MMMM YYYY', new Date(tempMeal.start)) + '</div>',
            buttons: [
                'cancel',
                {
                    text: 'Add',
                    keyCode: 'enter',
                    handler: function () {
                        calendar.updateEvent(tempMeal);
                        createOrUpdateEvent(tempMeal, 1);

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

        // $('.meal-planner-type').each(function (i, elm) {
        //     $(elm).mobiscroll('getInst').checked = + elm.value == tempMeal.resource;
        // });

        popup.open();
    }

    function editMealPopup(args) {
        var ev = args.event;
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
                        createOrUpdateEvent(updated_event);

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
        $notes.mobiscroll('getInst').value = ev.notes || '';

        // $('.meal-planner-type').each(function (i, elm) {
        //     $(elm).mobiscroll('getInst').checked = +elm.value == tempMeal.resource;
        // });

        popup.open();
    }

    calendar = $('#demo-day-week-view').mobiscroll().eventcalendar({
        onEventClick: function (event, inst) {
        },
        onEventDoubleClick: function (event, inst) {
        },
        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
            calendar: {
                labels: true         // More info about labels: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-labels
            }
        },
        dateFormatLong: 'DDD D MMM YYYY',
        firstDay: 1,
        colors: [
            {
                background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
            }
        ],
        // resources: resources,
        renderHeader: function () {  // More info about renderHeader: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-renderHeader
            return '<div mbsc-calendar-nav class="cal-header-nav"></div>' +
                '<div class="cal-header-picker">' +
                '<label>{{ __("Year") }}<input mbsc-segmented type="radio" name="view" value="year" class="md-view-change"></label>' +
                '<label>{{ __("Month") }}<input mbsc-segmented type="radio" name="view" value="month" class="md-view-change" checked></label>' +
                '<label>{{ __("Week") }}<input mbsc-segmented type="radio" name="view" value="week" class="md-view-change"></label>' +
                '</div>' +
                '<div mbsc-calendar-prev class="cal-header-prev"></div>' +
                '<div mbsc-calendar-today class="cal-header-today"></div>' +
                '<div mbsc-calendar-next class="cal-header-next"></div>';
        },
        dragToCreate: false,
        dragToResize: false,
        dragToMove: true,
        clickToCreate: true,
        extendDefaultEvent: function (ev) {
            return {
                title: 'New meal',
                allDay: true
            };
        },
        onEventCreated: function (args, inst) {
            tempMeal = args.event;
            addMealPopup();
        },
        onEventClick: function (args, inst) {
            oldMeal = $.extend({}, args.event);
            tempMeal = args.event;

            if (!popup.isVisible()) {
                editMealPopup(args);
            }
        },
        onEventUpdated: function (event, inst) {
            createOrUpdateEvent(event.event);
        },
    }).mobiscroll('getInst');

    var all_events = JSON.parse('{!! $events !!}');
    console.log(all_events)
    calendar.setEvents(all_events);

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
        tempMeal.notes = ev.target.value;
    });

    $deleteButton.on('click', function () {
        // delete current event on button click
        calendar.removeEvent(tempMeal);

        // save a local reference to the deleted event
        var deletedMeal = tempMeal;

        popup.close();

        mobiscroll.snackbar({
            button: {
                action: function () {
                    calendar.addEvent(deletedMeal);
                },
                text: 'Undo'
            },
            duration: 10000,
            message: 'Meal deleted'
        });

        createOrUpdateEvent(tempMeal, 2);
    });

    $('#staff-leave-single-select').mobiscroll().select({
        display: 'center',
        inputElement: document.getElementById('staff-leave-input'),
        touchUi: true
    });
    $('#reason-leave-single-select').mobiscroll().select({
        display: 'center',
        inputElement: document.getElementById('reason-leave-input'),
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
            tempEvent.start = date[0];
            tempEvent.end = date[1];
        }
    }).mobiscroll('getInst');

    /*************** All day End *****************/
    $('.md-view-change').change(function (ev) {
        switch (ev.target.value) {
            case 'year':
                calendar.setOptions({
                    view: {
                        calendar: { type: 'year', labels: true }
                    },
                    colors: []
                })
                break;
            case 'month':
                calendar.setOptions({
                    view: {
                        calendar: { type: 'month', labels: true }
                    },
                    colors: [
                        {
                            background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                        }
                    ],
                })
                break;
            case 'week':
                calendar.setOptions({
                    view: {
                        timeline: {
                            type: 'week',
                            eventList: true,
                        }
                    },
                    renderScheduleEventContent: function (args) {
                        var event = args;
                        return '<div class="md-meal-planner-event">' +
                            '<div class="md-meal-planner-event-title">' + event.title + '</div>' +
                            '<div class="md-meal-planner-event-desc">Name: here</div>' +
                            '</div>';
                    },
                    colors: [
                        {
                            background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                        }
                    ],
                })
                break;
        }
    });

});
</script>
@include('users.schedule.include-common-script')
@endsection
