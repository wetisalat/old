@extends('layouts/contentLayoutMaster')

@section('title', 'Analyse')

@section('vendor-style')
{{-- vendor css files --}}
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">

<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }
    
    .mbsc-material .mbsc-calendar-title {
        font-size: 1.428572em;
        font-weight: 400;
        text-transform: none;
        line-height: 1.4em;
    }
    
    .md-event-listing .mbsc-segmented {
        max-width: 350px;
        margin: 0 auto;
        padding: 1px;
    }
    
    .md-event-listing-picker {
        flex: 1 0 auto;
    }
    
    .md-event-listing-nav {
        width: 200px;
    }
    
    /* material header order */
    
    .mbsc-material.md-event-listing-prev {
        order: 1;
    }
    
    .mbsc-material.md-event-listing-next {
        order: 2;
    }
    
    .mbsc-material.md-event-listing-nav {
        order: 3;
    }
    
    .mbsc-material .md-event-listing-picker {
        order: 4;
    }
    
    .mbsc-material .md-event-listing-today {
        order: 5;
    }
    
    /* windows header order */
    
    .mbsc-windows.md-event-listing-nav {
        order: 1;
    }
    
    .mbsc-windows.md-event-listing-prev {
        order: 2;
    }
    
    .mbsc-windows.md-event-listing-next {
        order: 3;
    }
    
    .mbsc-windows .md-event-listing-picker {
        order: 4;
    }
    
    .mbsc-windows .md-event-listing-today {
        order: 5;
    }

    .mbsc-schedule-event {
        margin-top: 8px;
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
                <div mbsc-page class="analyse-range-view">
  <div style="height:100%">
      <div  class="md-event-listing">
        <div id="analyse-range-view"></div>
        <div id="analyse-date-range"></div>
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

var theme = "{{ isset($themeMode) ? ($themeMode->status == 1 ? 'dark' : 'light') : 'light' }}";
    mobiscroll.setOptions({
        locale: mobiscroll.localeEn,
        theme: "{{ isset($themeMode) && $themeMode->status == 1 ? 'vuexy-theme' : 'ios' }}",
        themeVariant: theme,  
        locale: mobiscroll.locale['{{ $lang }}'],
        timeFormat: 'HH:mm', // Specify the time format for each view
        dateFormat: 'DDDD, DD MMMM YYYY', // Specify the date format for each view
        clickToCreate: false,
        dragToCreate: false,
        dragToMove: false,
        dragToResize: false
    });



    
    $(function () {
        var formatDate = mobiscroll.util.datetime.formatDate;
        var startDate, endDate;
    
        var myCalendar = $('#analyse-range-view').mobiscroll().eventcalendar({
        onEventClick: function (event, inst) {
        },
        onEventDoubleClick: function (event, inst) {
        },
            resources: [{                     // More info about resources: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-resources
                id: 1,
                name: 'Resource A',
                color: '#e20000'
            }, {
                id: 2,
                name: 'Resource B',
                color: '#76e083'
            }, {
                id: 3,
                name: 'Resource C',
                color: '#4981d6'
            }, {
                id: 4,
                name: 'Resource D',
                color: '#e25dd2'
            }, {
                id: 5,
                name: 'Resource E',
                color: '#1dab2f'
            }, {
                id: 6,
                name: 'Resource F',
                color: '#d6d145'
            }],
            view: {                           // More info about view: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-view
                timeline: {
                    type: 'day',
                    size: 14,
                    eventList: true
                }
            },
            dateFormatLong: 'DDD D MMM YYYY',
            firstDay: 1,
            dragToResize: false,         // More info about dragToResize: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-dragToResize
            dragToMove: false,            // More info about dragToMove: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-dragToMove
            clickToCreate: false,
            dragToCreate: false,
            eventDelete: false,
            renderHeader: function () {       // More info about renderHeader: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-renderHeader
                return '<div id="custom-date-range"><button mbsc-button data-variant="flat" class="mbsc-calendar-button">' +
                    '<span id="custom-date-range-text" class="mbsc-calendar-title">Button' +
                    '</span></button></div>' +
                    '<div class="md-event-listing-picker">' +
                    '<label>Forecast<input mbsc-segmented type="radio" name="event-listing-view" value="Forecast" class="event-listing-view-change"></label>' +
                    '<label>Realized<input mbsc-segmented type="radio" name="event-listing-view" value="Realized" class="event-listing-view-change" checked></label>' +
                    '</div>' +
                    '<div mbsc-calendar-prev class="md-event-listing-prev"></div>' +
                    '<div mbsc-calendar-today class="md-event-listing-today"></div>' +
                    '<div mbsc-calendar-next class="md-event-listing-next"></div>';
                    '</div>';
            },
            onPageLoaded: function (args) {   // More info about onPageLoaded: https://docs.mobiscroll.com/5-18-0/eventcalendar#event-onPageLoaded
                var end = args.lastDay;
                startDate = args.firstDay;
                endDate = new Date(end.getFullYear(), end.getMonth(), end.getDate() - 1, 0);
                // set button text
                $rangeButton.text(getFormattedRange(startDate, endDate));
                // set range value
                myRange.setVal([startDate, endDate]);
            }
        }).mobiscroll('getInst');
    
        var myRange = $('#custom-date-range').mobiscroll().datepicker({
            select: 'range',
            display: 'anchored',              // Specify display mode like: display: 'bottom' or omit setting to use default
            showOverlay: false,
            touchUi: true,
            buttons: [],                      // More info about buttons: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-buttons
            onClose: function (args, inst) {  // More info about onClose: https://docs.mobiscroll.com/5-18-0/eventcalendar#event-onClose
                var date = inst.getVal();
                if (date[0] && date[1]) {
                    if (date[0].getTime() !== startDate.getTime()) {
                        // navigate the calendar
                        myCalendar.navigate(date[0]);
                    }
                    startDate = date[0];
                    endDate = date[1];
                    // set calendar view
                    myCalendar.setOptions({
                        refDate: startDate,   // More info about refDate: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-refDate
                        view: {                           // More info about view: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-view
                            timeline: {
                                type: 'day',
                                size: getNrDays(startDate, endDate),
                                eventList: true
                            }
                        }
                    });
                } else {
                    myRange.setVal([startDate, endDate])
                }
            }
        }).mobiscroll('getInst');
    
        var $rangeButton = $('#custom-date-range-text');
    
        // returns the formatted date
        function getFormattedRange(start, end) {
            return formatDate('D MMM YYYY', new Date(start)) + (end && getNrDays(start, end) > 1 ? (' - ' + formatDate('D MMM YYYY', new Date(end))) : '');
        }
    
        // returns the number of days between two dates
        function getNrDays(start, end) {
            return Math.round(Math.abs((end.setHours(0) - start.setHours(0)) / (24 * 60 * 60 * 1000))) + 1;
        }
    
        $.getJSON('https://trial.mobiscroll.com/timeline-events/?callback=?', function (events) {
            myCalendar.setEvents(events);
        }, 'jsonp');
    
        // $('.event-listing-view-change').change(function (ev) {
        //     switch (ev.target.value) {
        //         case 'Forecast':
        //             calendar.setOptions({
        //                 view: {                      // More info about view: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-view
        //                     timeline: {
        //                         type: 'day',
        //                         size: 14,
        //                         eventList: true
        //                         }
        //                 }
        //             })
        //             break;
        //         case 'Realized':
        //             calendar.setOptions({
        //                 view: {                      // More info about view: https://docs.mobiscroll.com/5-18-0/eventcalendar#opt-view
        //                     timeline: {
        //                         type: 'day',
        //                         size: 14,
        //                         eventList: true
        //                         }
        //                 }
        //             })
        //             break;
        //     }
        // });

        $('#view-fullscreen').on('click', function(e) {
            var element = document.body; // getElementById('demo-event-listing');
            
            openFullscreen(element);
        });
    });
</script>
@include('users.schedule.include-common-script')
@endsection