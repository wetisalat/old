@extends('layouts/contentLayoutMaster')

@section('title', 'Staff schedule')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('staff-schedule') }}">
<style type="text/css">
    .md-custom-header-controls {
        display: flex;
        flex: 1 0 auto;
        justify-content: center;
        align-items: center;
    }

    .md-custom-header-nav,
    .md-custom-header-view {
        width: 180px;
    }

    .md-custom-header-button.mbsc-button {
        font-size: 20px;
        height: auto;
        padding: 0;
        margin: 0;
    }

    .md-custom-header .mbsc-segmented {
        width: 110px;
        float: right;
        margin-top: 0;
        margin-bottom: 0;
    }

    .md-custom-header .mbsc-material.mbsc-segmented,
    .md-custom-header .mbsc-windows.mbsc-segmented {
        padding: 0;
    }

    .md-custom-header .mbsc-segmented .mbsc-segmented-button {
        font-size: 20px;
        height: 32px;
        padding: 0;
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
                    <div class="md-event-listing-1" style="height: 100%;">
                        <div id="demo-work-week-hours" class="md-meal-planner-calendar"></div>
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
    theme: 'ios',
    themeVariant: theme,
    locale: mobiscroll.locale['{{ $lang }}'],
    clickToCreate: false,
    dragToCreate: false,
    dragToMove: false,
    dragToResize: false
});

$(function () {

    calendar = $('#demo-work-week-hours').mobiscroll().eventcalendar({
        // invalid: [
        //     {
        //     start: '12:00',
        //     end: '13:00',
        //     title: 'Lunch break',
        //     type: 'lunch',
        //     recurring: {
        //         repeat: 'weekly',
        //         weekDays: 'MO,TU,WE,TH,FR'
        //     }
        // }],
        view: {
            schedule: {
                type: 'week',
                startDay: 1,
                endDay: 7,
                startTime: '00:00',
                endTime: '24:00'
            }
        },
        colors: [
            {
                background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
            },
            {
                start: '00:00',
                end: '24:00',
                background: 'rgba(239, 239, 239, 0.75)',
                recurring: {
                    repeat: 'weekly',
                    weekDays: 'SA,SU'
                }
            }
        ],
        renderHeader: function () {
            return '<div mbsc-calendar-nav class="md-custom-header-nav"></div>' +
                '<div class="md-custom-header-controls">' +
                '<button id="nav-to-prev-page" mbsc-calendar-prev data-variant="flat" data-icon="material-arrow-back" class="md-custom-header-button cal-header-prev"></button>' +
                '<div mbsc-calendar-today class="cal-header-today"></div>' +
                '<button id="nav-to-next-page" mbsc-calendar-next data-variant="flat" data-icon="material-arrow-forward" class="md-custom-header-button cal-header-next"></button>' +
                '</div>' +
                '<div class="md-custom-header-view">' +
                '<label><input data-icon="material-list" mbsc-segmented type="radio" name="custom-header-view" value="schedule" class="md-custom-header-view-change" checked></label>' +
                '<label><input data-icon="calendar" mbsc-segmented type="radio" name="custom-header-view" value="calendar" class="md-custom-header-view-change"></label>' +
                '</div>';
        },
        onEventCreated: function (event, inst) {
            createOrUpdateEvent(event.event, 1);
        },
        onEventUpdated: function (event, inst) {
            createOrUpdateEvent(event.event);
        },
    }).mobiscroll('getInst');

    var all_events = JSON.parse('{!! $events !!}');
    calendar.setEvents(all_events);
    
    $('.md-custom-header-view-change').change(function (ev) {

        switch (ev.target.value) {
            case 'schedule':
                calendar.setOptions({
                    view: {
                        schedule: {
                            type: 'week',
                            startDay: 1,
                            endDay: 7,
                            startTime: '00:00',
                            endTime: '24:00'
                        }
                    }                  
                })
                break;
            case 'calendar':
                calendar.setOptions({
                    view: {
                        calendar: { type: 'month', labels: true }
                    }
                })
                break;
        }
    });

    $("#dm-localization-select").change(function () {
        var la = $(this).val();

        calendar.setOptions({
            locale: mobiscroll.locale[la]
        });
    });
});
</script>
@include('users.schedule.include-common-script')
@endsection
