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

    .no-margin {
    	margin: 0;
    }

    .mbsc-calendar-row {
    	min-height: 20%;
    }
    .mbsc-calendar-row .mbsc-calendar-text {
    	line-height: 2.8em;
    	min-height: 2.8em;
    }
    .mbsc-ios.mbsc-calendar-width-md .mbsc-calendar-text {
    	line-height: 2.5em;
    	min-height: 2.8em;
    }
    .md-attendance .mbsc-popup-content {
        padding: 0;
    }
    
    .md-attendance {
        font-size: 15px;
        font-weight: 600;
    }
    
    .md-attendance-header {
        padding: 12px 16px;
        color: #eee;
    }
    
    .md-attendance-info {
        padding: 16px 16px 60px 16px;
        position: relative;
        line-height: 32px;
    }
    
    .md-attendance-time,
    .md-attendance-status-button {
        float: right;
    }
    
    .md-attendance-title {
        margin-bottom: 15px;
    }
    
    .md-attendance-text {
        font-weight: 300;
    }
    
    .md-attendance-info .mbsc-button {
        font-size: 14px;
        margin: 0;
    }
    
    .md-attendance-info .mbsc-button.mbsc-material {
        font-size: 12px;
    }
    
    .md-attendance-edit-button {
        position: absolute;
        bottom: 16px;
        left: 16px;
    }
    
    .md-attendance-delete-button {
        position: absolute;
        bottom: 16px;
        right: 16px;
    }
    
    .total-drop-calendar {
        border-right: 1px solid #ccc;
    }
    
    .total-drop-task {
        color: #fff;
        padding: 10px;
        margin: 20px;
        border-radius: 8px;
        font-family: -apple-system, Segoe UI, Roboto, sans-serif;
    }
    
    .total-drop-task-title {
        color: #999;
        border-width: 2px;
        border-style: dotted;
        text-align: center;
        font-weight: bold;
    }

    .week-title {
        text-align: center;
        font-weight: bold;
    }
    
    .total-drag-drop.wrapper,
    .total-drag-drop .mbsc-grid,
    .total-drag-drop .mbsc-row,
    .total-drag-drop .total-drop-calendar {
        height: 100%;
    }
    
    .md-header-filter-controls {
        flex: 1 0 auto;
        display: flex;
        justify-content: center;
    }
    
    .md-custom-header-filtering .mbsc-segmented {
        max-width: 400px;
        margin: 0 auto;
        flex: 1 0 auto;
    }
    
    .md-header-filter-name {
        text-align: center;
        font-weight: bold;
    }
    
    .md-header-filter-nav {
        width: 200px;
    }
    
    .md-header-filter-controls .mbsc-segmented-button.mbsc-selected {
        color: #fff;
    }
    
    .md-custom-header-filtering .mbsc-segmented-item:first-child .mbsc-selected.mbsc-material,
    .md-custom-header-filtering .mbsc-segmented-item:first-child .mbsc-selected.mbsc-windows,
    .md-custom-header-filtering .mbsc-segmented-item:first-child .mbsc-segmented-selectbox-inner {
        background: rgb(40, 199, 111);
    }
    
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-material,
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-windows,
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(2) .mbsc-segmented-selectbox-inner {
        background: rgb(255, 159, 67);
    }
    
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-material,
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-windows,
    .md-custom-header-filtering .mbsc-segmented-item:nth-child(3) .mbsc-segmented-selectbox-inner {
        background: rgb(234, 84, 85);
    }

  	/*Custom repeat start*/

    .custom-repeat-settings .mbsc-textfield-wrapper.mbsc-textfield-wrapper-outline,
    .custom-repeat-settings.mbsc-textfield-wrapper.mbsc-textfield-wrapper-outline {
        display: inline-block;
        margin: 5px;
    }
    
    .custom-repeat-input.mbsc-textfield-wrapper .mbsc-textfield,
    .custom-repeat-input .mbsc-textfield-wrapper .mbsc-textfield {
        height: 30px;
        width: 50px;
    }
    
    .custom-repeat-select-nr.mbsc-textfield-wrapper .mbsc-select.mbsc-textfield,
    .custom-repeat-select-nr .mbsc-textfield-wrapper .mbsc-select.mbsc-textfield {
        width: 70px;
        padding-right: 30px;
    }
    
    .custom-repeat-select-month.mbsc-textfield-wrapper .mbsc-select.mbsc-textfield,
    .custom-repeat-select-month .mbsc-textfield-wrapper .mbsc-select.mbsc-textfield {
        width: 140px;
        padding-right: 30px;
    }
    
    .custom-repeat-input.custom-specific-date input.mbsc-textfield {
        width: 140px;
    }
    
    .custom-repeat-desc {
        font-size: 12px;
        font-weight: normal;
        color: #555;
        margin-top: 0;
        margin-bottom: 15px;
    }
    
    .custom-repeat-input .mbsc-select-icon.mbsc-select-icon-outline,
    .custom-repeat-select .mbsc-select-icon.mbsc-select-icon-outline {
        width: 16px;
        top: 3px;
        right: 10px;
    }
    
    .custom-repeat-settings {
        font-weight: 600;
        padding-left: 12px;
        padding-right: 12px;
    }
    
    .mbsc-ios .custom-repeat-settings {
        background: #fff;
    }
    
    .mbsc-ios-dark .custom-repeat-settings {
        background: #2b2b2b;
    }
    
    .mbsc-material .custom-repeat-settings {
        background: #f5f5f5;
    }
    
    .mbsc-material-dark .custom-repeat-settings {
        background: #0a0a0a;
    }
    
    /* checkbox */
    
    .custom-repeat-checkbox-cont .mbsc-checkbox.mbsc-form-control-wrapper {
        display: inline-block;
        padding-left: 25px;
        padding-right: 10px;
        background: transparent;
    }
    
    .custom-repeat-checkbox-cont .mbsc-checkbox .mbsc-checkbox-box {
        left: 0;
        width: 20px;
        height: 20px;
        margin-top: -10px;
    }
    
    .custom-repeat-checkbox-cont .mbsc-checkbox.mbsc-form-control-wrapper:after,
    .custom-repeat-checkbox-cont .mbsc-checkbox.mbsc-form-control-wrapper:before {
        border: 0;
    }
    
    .custom-repeat-checkbox-cont .mbsc-checkbox .mbsc-checkbox-box:after {
        width: 10px;
        height: 6px;
        top: 4px;
        left: 3px;
    }
    
    .custom-condition-cont .mbsc-radio.mbsc-form-control-wrapper {
        padding-top: 8px;
        padding-bottom: 8px;
    }
    
    .custom-condition-cont .mbsc-ios.mbsc-form-control-wrapper:after,
    .custom-condition-cont .mbsc-ios.mbsc-form-control-wrapper:before {
        border-color: transparent;
    }
    
    .custom-condition-cont .mbsc-radio-box {
        top: 40%;
    }
    
    .custom-condition-cont .mbsc-material.mbsc-radio-box:after,
    .custom-condition-cont .mbsc-windows.mbsc-radio-box:after {
        width: 8px;
        height: 8px;
        margin-top: -4px;
        margin-left: -4px;
        border-radius: 8px;
    }
    
    .custom-repeat-settings .mbsc-form-control-input {
        z-index: 0;
    }
  	/*Custom repeat end*/
</style>
@endsection

@section('content')
<section >
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body border-bottom">
                <div mbsc-page class="custom-event-attendance">
        <div style="height:100%">
            <div class="mbsc-grid mbsc-no-padding">
              <div class="mbsc-row">
                  <div class="mbsc-col-sm-9 total-drop-calendar">
                     	<div id="custom-event-attendance-popup" class="md-attendance">
                          <div id="attendance-event-header" class="md-attendance-header">
                              <span id="attendance-event-name-age" class="md-attendance-name-age"></span>
                              <span id="attendance-event-time" class="md-attendance-time"></span>
                          </div>
                          <div class="md-attendance-info">
                              <div id="attendance-event-reason" class="md-attendance-title">Reason for visit: <span class="md-attendance-reason md-attendance-text"></span></div>
                              <div id="attendance-event-location" class="md-attendance-title">Location: <span class="md-attendance-location md-attendance-text"></span></div>
                              <div id="attendance-event-extra" class="md-attendance-title">Extra: <span class="md-attendance-extra md-attendance-text"></span></div>
                              <div id="attendance-event-comment" class="md-attendance-title">Comment: <span class="md-attendance-comment md-attendance-text"></span></div>
                              <button id="attendance-event-view" mbsc-button data-color="warning" data-variant="outline" class="md-attendance-edit-button">Edit Attendance</button>
                              <button id="attendance-event-delete" mbsc-button data-color="danger" data-variant="outline" class="md-attendance-delete-button">Delete Attendance</button>
                          </div>
                      	</div>
                      	<div id="custom-event-attendance-create-edit-popup">
					        <div class="mbsc-form-group" style="margin-top: 0;">
					            <label for="custom-event-attendance-start">
					                Start
					                <input mbsc-input data-dropdown="true" id="custom-event-attendance-start" />
					            </label>
					            <label for="custom-event-attendance-end">
					                End
					                <input mbsc-input data-dropdown="true" id="custom-event-attendance-end" />
					            </label>
					            <div id="custom-event-attendance-date"></div>
					            <label>
					                <input mbsc-input data-label="Repeats" data-dropdown="true" id="recurring-event-repeat" />
					            </label>
					            <div id="demo-custom-repeat-cont">
					                <div>
					                    <div mbsc-segmented-group>
					                        <label>
					                            Daily
					                            <input type="radio" mbsc-segmented name="custom-repeat-type" value="daily" checked>
					                        </label>
					                        <label>
					                            Weekly
					                            <input type="radio" mbsc-segmented name="custom-repeat-type" value="weekly">
					                        </label>
					                        <label>
					                            Monthly
					                            <input type="radio" mbsc-segmented name="custom-repeat-type" value="monthly">
					                        </label>
					                        <label>
					                            Yearly
					                            <input type="radio" mbsc-segmented name="custom-repeat-type" value="yearly">
					                        </label>
					                    </div>
					    
					                    <div class="custom-repeat-settings">
					                        Repeat every
					                        <label class="custom-repeat-input">
					                            <input id="custom-repeat-nr" min="1" mbsc-input data-input-style="outline" value="1" />
					                        </label>
					                        <span class="custom-repeat-text custom-repeat-daily">days</span>
					                        <span class="custom-repeat-text custom-repeat-weekly">weeks</span>
					                        <span class="custom-repeat-text custom-repeat-monthly">
					                            months on day
					                            <label class="custom-repeat-input custom-repeat-select-nr">
					                                <input id="custom-repeat-month-day" mbsc-input data-dropdown="true" data-input-style="outline" />
					                            </label>
					                        </span>
					                        <span class="custom-repeat-text custom-repeat-yearly">
					                            years on
					                            <label class="custom-repeat-input custom-repeat-select-month">
					                                <input mbsc-input id="custom-repeat-month-input" data-dropdown="true" data-input-style="outline" />
					                            </label>
					                            <label class="custom-repeat-input custom-repeat-select-nr">
					                                <input id="custom-repeat-year-day" mbsc-input data-dropdown="true" data-input-style="outline" />
					                            </label>
					                            <select id="custom-repeat-month" data-input-style="outline">
					                                <option value="1" selected>January</option>
					                                <option value="2">February</option>
					                                <option value="3">March</option>
					                                <option value="4">April</option>
					                                <option value="5">May</option>
					                                <option value="6">June</option>
					                                <option value="7">July</option>
					                                <option value="8">August</option>
					                                <option value="9">September</option>
					                                <option value="10">October</option>
					                                <option value="11">November</option>
					                                <option value="12">December</option>
					                            </select>
					                        </span>
					                        <p class="custom-repeat-desc custom-repeat-text custom-repeat-daily">The event will be repeated every day or every x days, depending on the value</p>
					                        <p class="custom-repeat-desc custom-repeat-text custom-repeat-weekly">The event will be repeated every x weeks on specific weekdays</p>
					                        <p class="custom-repeat-desc custom-repeat-text custom-repeat-monthly">The event will be repeated every x month on specific day of the month</p>
					                        <p class="custom-repeat-desc custom-repeat-text custom-repeat-yearly">The event will be repeated every x years on specific day of a specific month</p>
					    
					                        <div class="custom-repeat-checkbox-cont custom-repeat-text custom-repeat-weekly">
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="SU" name="Sunday" checked>
					                            Sun
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="MO" name="Monday">
					                            Mon
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="TU" name="Tuesday">
					                            Tue
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="WE" name="Wednesday">
					                            Wed
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="TH" name="Thursday">
					                            Thu
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="FR" name="Friday">
					                            Fri
					                        </label>
					                            <label>
					                            <input mbsc-checkbox class="custom-repeat-weekdays" type="checkbox" value="SA" name="Saturday">
					                            Sat
					                        </label>
					                        </div>
					    
					                        <div>Stop condition</div>
					                        <div class="custom-condition-cont">
					                            <label>
					                                <input mbsc-radio type="radio" name="custom-repeat-condition" value="never" data-description="The event will repeat indefinitely" checked> Never stop
					                            </label>
					                            <label>
					                                <input mbsc-radio type="radio" name="custom-repeat-condition" value="until" data-description="The event will run until it reaches a specific date">
					                                Run until a specific date
					                                <label class="custom-repeat-input custom-specific-date">
					                                    <input id="custom-repeat-date" mbsc-input data-input-style="outline" placeholder="Select a date" />
					                                </label>
					                            </label>
					                            <label>
					                                <input mbsc-radio type="radio" name="custom-repeat-condition" value="count" data-description="The event will repeat until it reaches a certain amount of occurrences">
					                                Run until it reaches
					                                <label class="custom-repeat-input">
					                                    <input id="custom-repeat-until" mbsc-input min="1" data-input-style="outline" value="1" />
					                                </label> occurrences
					                            </label>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>

					        <div class="mbsc-form-group no-margin">
					            <div class="mbsc-grid mbsc-form-grid no-margin">
					                <div class="mbsc-row">
					                    <div class="mbsc-col-sm-12 mbsc-col-md-6">
					                        <label>
					                            Pause
					                            <input mbsc-input id="pause-input" data-dropdown="true" />
					                        </label>
					                        <select id="pause-single-select">
					                            <option value="0">0</option>
					                            <option value="10">10</option>
					                            <option value="15">15</option>
					                            <option value="20">20</option>
					                            <option value="30">30</option>
					                            <option value="45">45</option>
					                            <option value="60">60</option>
					                            <option value="90">90</option>
					                            <option value="120">120</option>
					                        </select>
					                    </div>
					                    <div class="mbsc-col-sm-12 mbsc-col-md-6">
					                    <label>
					                        Transport
					                        <input mbsc-input id="transport-input" data-dropdown="true" />
					                    </label>
					                    <select id="transport-single-select">
					                        <option value="0">0</option>
					                        <option value="15">15</option>
					                        <option value="30">30</option>
					                        <option value="45">45</option>
					                        <option value="60">60</option>
					                        <option value="+60">+60</option>
					                    </select>
					                    </div>
					                </div>
					            </div>
					            <label>
					                Extra
					                <input mbsc-input id="extra-input" data-dropdown="true" data-tags="true" />
					            </label>
					            <select id="extra" multiple>
                                    @foreach($extras as $extra)
					                <option value="{{$extra->id}}">{{$extra->name}}</option>
                                    @endforeach
					            </select>
					        </div>
					        <div class="mbsc-form-group no-margin">
					            <label>
					                Location
					                <input mbsc-input id="location">
					            </label>
					            <label>
					                Comment
					                <textarea mbsc-textarea id="recurring-event-desc"></textarea>
					            </label>
					        </div>
					        <div class="mbsc-button-group">
					            <button class="mbsc-button-block" id="event-attendance-delete" mbsc-button data-color="danger" data-variant="outline">Delete shift</button>
					        </div>
					    </div>
                      <div id="custom-event-attendance" class="md-custom-header-filtering"></div>
                  </div>
                  <div class="mbsc-col-sm-3">

                      <div class="total-drop-task-title total-drop-task">
                        <div>TOTAL</div>
                      </div>

                      <div  class="total-drop-task" style="background: #bac70c;">
                          <div class="week-title">Week Data</div>
                          <div>Data 2</div>
                      </div>
          
                      <div class="total-drop-task" style="background: #34c8e0;">
                        <div class="week-title">Week Data</div>
                          <div>Data 2</div>
                      </div>
      
                      <div  class="total-drop-task" style="background: #f7961e;">
                        <div class="week-title">Week Data</div>
                          <div>Data 2</div>
                      </div>
          
                      <div class="total-drop-task" style="background: #df0606;">
                        <div class="week-title">Week Data</div>
                          <div>Data 2</div>
                      </div>

                      <div data-drag-data='{"title": "QA meeting", "start": "2021-04-01", "end": "2021-04-01", "color": "#cf4343"}' class="total-drop-task" style="background: #1064b0;">
                        <div class="week-title">Week Data</div>
                        <div>Data 2</div>
                    </div>
        
                    <div data-drag-data='{"title": "Team retreat", "start": "2021-04-01", "end": "2021-04-02", "color": "#1064b0"}' class="total-drop-task" style="background: #cf4343;">
                        <div class="week-title">Week Data</div>
                        <div>Data 2</div>
                    </div>
          
                  </div>
              </div>
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
    mobiscroll.setOptions({
        locale: mobiscroll.localeEn,                 // Specify language like: locale: mobiscroll.localePl or omit setting to use default
        theme: 'ios',                                // Specify theme like: theme: 'ios' or omit setting to use default
        themeVariant: 'light'                    // More info about themeVariant: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-themeVariant
    });
    
    $(function () {
        var now = new Date();
        var formatDate = mobiscroll.util.datetime.formatDate;
        var currentEvent;
        var oldAttendance;
        var tempAttendance;
        var timer;
        var $tooltip = $('#custom-event-attendance-popup');
        var $deleteButton = $('#attendance-event-delete');
        var $popupDeleteButton = $('#event-attendance-delete');
        var $editButton = $('#attendance-event-view');
        var $header = $('.md-attendance-header');
        var $data = $('.md-attendance-name-age');
        var $time = $('.md-attendance-time');
        var $status = $('.md-attendance-status');
        var $reason = $('.md-attendance-reason');
        var $location = $('.md-attendance-location');
        var $tooltipExtra = $('.md-attendance-extra');
        var $tooltipComment = $('.md-attendance-comment');

        var $comment = $('#recurring-event-desc');
        var extraField, pauseField, transportField;
        var popup;
        var range;
        var customDate;

        var $statusFree = $('#recurring-event-status-free');
        var $statusBusy = $('#recurring-event-status-busy');
        var $customRepeat = $('#demo-custom-repeat-cont');
        var $repeat = $('#recurring-event-repeat');
        var $until = $('#custom-repeat-until');
        var repeatData = [{
            value: 'norepeat',
            text: 'Does not repeat'
        }, {
            value: 'daily',
            text: 'Daily'
        }, {
            value: 'weekly',
            text: 'Weekly'
        }, {
            value: 'monthly',
            text: 'Monthly'
        }, {
            value: 'yearly',
            text: 'Yearly'
        }, {
            value: 'weekday',
            text: 'Every weekday (Monday to Friday)'
        }, {
            value: 'custom',
            text: 'Custom'
        }];
        
        var slots = [{
            id: 1,
            name: 'Morning',
        }, {
            id: 2,
            name: 'Afternoon',
        }];       
    
    	var myResources = [{
            id: 1,
            name: 'Accepted',
            color: 'rgb(40, 199, 111)',
            checked: false,
        }, {
            id: 2,
            name: 'Pending',
            color: 'rgb(255, 159, 67)',
            checked: true,
        }, {
            id: 3,
            name: 'Refuse',
            color: 'rgb(234, 84, 85)',
            checked: false,
        }];

        var select;
        var monthSelect;
        var monthDaySelect;
        var yearDaySelect;
        var datePickerResponsive = {
            medium: {
                controls: ['calendar'],
                touchUi: false
            }
        };
        var selectResponsive = {
            xsmall: {
                touchUi: true
            },
            small: {
                touchUi: false
            }
        };
        var datetimePickerResponsive = {
            medium: {
                controls: ['calendar', 'time'],
                touchUi: false
            }
        };

        var days = [{
            name: 'Sunday',
            short: 'SU',
        }, {
            name: 'Monday',
            short: 'MO',
        }, {
            name: 'Tuesday',
            short: 'TU',
        }, {
            name: 'Wednesday',
            short: 'WE',
        }, {
            name: 'Thursday',
            short: 'TH',
        }, {
            name: 'Friday',
            short: 'FR',
        }, {
            name: 'Saturday',
            short: 'SA',
        }];
        var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var daySelect;
        var $repeatType = $('input[name=custom-repeat-type]');
        var loggedInUserRole = {!! auth()->user()->role !!};
        var isStaff = loggedInUserRole.name === 'staff';
    
        // set dates by selected date
        function updateOptionDates() {
            var d = new Date(tempAttendance.start);
            var weekday = d.getDay();
            var monthday = d.getDate();
            var newData = repeatData.slice(0);
    
            for (var i = 0; i < newData.length; ++i) {
                var item = newData[i];
                switch (item.value) {
                    case 'weekly':
                        item.text = 'Weekly on ' + days[weekday].name;
                        break;
                    case 'monthly':
                        item.text = 'Monthly on day ' + monthday;
                        break;
                    case 'yearly':
                        item.text = 'Annually on ' + months[d.getMonth()] + ' ' + monthday;
                        break;
                }
            }
    
            select.setOptions({ data: newData });
        }
    
        // popuplate data for months
        function populateMonthDays(month, selectInst) {
            var options = '';
            var days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            var newValues = [];
    
            for (var i = 1; i <= days[month - 1]; i++) {
                newValues.push(i.toString());
            }
            selectInst.setOptions({ data: newValues });
        }
    
        // change text depending on the chosen repeat type 
        function updateContent(type) {
            $('.custom-repeat-text').each(function () {
                var $cont = $(this);
    
                if ($cont.hasClass('custom-repeat-' + type)) {
                    $cont.show();
                } else {
                    $cont.hide();
                }
            });
        }
    
        // set text for custom option
        function setCustomText(recurring) {
            setTimeout(function () {
                var type = $('input[name=custom-repeat-type]:checked').val();
                var condition = $('input[name="custom-repeat-condition"]:checked').val();
                var interval = +$('#custom-repeat-nr').val();
                var weekDayNames = [];
                var rec;
                var customText;
    
                $.each($('.custom-repeat-weekdays:checked'), function () {
                    weekDayNames.push($(this).attr('name'));
                });
    
                switch (type) {
                    case 'daily':
                        customText = interval > 1 ? ('Every ' + interval + ' days') : 'Daily';
                        break;
                    case 'weekly':
                        customText = interval > 1 ? ('Every ' + interval + ' weeks') : 'Weekly';
                        customText += ' on ' + weekDayNames.join(', ');
                        break;
                    case 'monthly':
                        customText = interval > 1 ? ('Every ' + interval + ' months') : 'Monthly';
                        customText += ' on day ' + monthDaySelect.getVal();
                        break;
                    case 'yearly':
                        customText = interval > 1 ? ('Every ' + interval + ' years') : 'Annualy';
                        customText += ' on ' + $('#custom-repeat-month option:selected').text() + ' ' + yearDaySelect.getVal();
                        break;
                }
    
                switch (condition) {
                    case 'until':
                        customText += ' until ' + mobiscroll.util.datetime.formatDate('MMMM D, YYYY', new Date(customDate.getVal()));
                        break;
                    case 'count':
                        customText += ', ' + $until.val() + ' times';
                        break;
                }
    
                if (recurring && recurring.interval) {
                    var newData = repeatData.slice(0);
                    newData.push({ value: 'custom-value', text: customText })
                    select.setOptions({ data: newData });
                    select.setVal('custom-value');
                }
            });
        }
    
        // set custom values to default
        function resetCustomValues() {
            $('input[name=custom-repeat-type][value="daily"]').mobiscroll('getInst').checked = true;
            $('#custom-repeat-nr').val(1);
            $('input[name=custom-repeat-condition][value="never"]').mobiscroll('getInst').checked = true;
            $until.val(1);
            monthSelect.setVal(1);
            monthDaySelect.setVal(1)
            yearDaySelect.setVal(1);
            $.each($('.custom-repeat-weekdays'), function () {
                $(this).mobiscroll('getInst').checked = $(this).val() === 'SU';
            });
            select.setVal('norepeat');
    
            showHideCustom();
        }
    
        function setCustomSettings() {
            var selected = select.getVal();
    
            if (selected === 'custom' || selected === 'custom-value') {
                // save custom recurring option when the popup is closed
                var type = $('input[name=custom-repeat-type]:checked').val();
                var condition = $('input[name="custom-repeat-condition"]:checked').val();
                var weekDays = [];
                var rec;
                var customText;
    
                $.each($('.custom-repeat-weekdays:checked'), function () {
                    weekDays.push($(this).val());
                });
    
                rec = {
                    repeat: type,
                    interval: +$('#custom-repeat-nr').val()
                };
    
                switch (type) {
                    case 'weekly':
                        rec.weekDays = weekDays.join(',');
                        break;
                    case 'monthly':
                        rec.day = monthDaySelect.getVal();
                        break;
                    case 'yearly':
                        rec.day = yearDaySelect.getVal();
                        rec.month = monthSelect.getVal();
                        break;
                }
    
                switch (condition) {
                    case 'until':
                        rec.until = customDate.getVal();
                        break;
                    case 'count':
                        rec.count = +$until.val();
                        break;
                }
    
                tempAttendance.recurring = rec;
            }
        }

        function showHideCustom() {
            setTimeout(function () {
                if (select.getVal() !== 'custom' && select.getVal() !== 'custom-value') {
                    $customRepeat.hide();
                } else {
                    $customRepeat.show();
                }
            });
        }
        
        var calendar = $('#custom-event-attendance').mobiscroll().eventcalendar({
            
            view: {                    // More info about view: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-view
                calendar: {
                    type: 'month',
                    weekNumbers: true,
                    timeCellStep: 240,
                    timeLabelStep: 240,
                    labels: "all"

                }
            },
	     resources: myResources,
            data: [],
            renderHeader: function (a, b) {  // More info about renderHeader: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-renderHeader
                var header = '<div mbsc-calendar-nav class="md-header-filter-nav"></div>' +
                    '<div class="md-header-filter-controls">';
    
                for (var i = 0; i < myResources.length; ++i) {
                    var res = myResources[i];
                    header += '<label>' +
                        '<span class="md-header-filter-name md-header-filter-name-' + res.id + '">' + res.name + '</span>' +
                        '<input type="checkbox" mbsc-segmented name="resource" class="md-header-filter" value=' +
                        res.id + ' ' + (res.checked ? 'checked' : '') + '>' +
                        '</label>';
                }
                header += '</div>' +
                    '<div mbsc-calendar-prev class="md-header-filter-prev"></div>' +
                    '<div mbsc-calendar-today class="md-header-filter-today"></div>' +
                    '<div mbsc-calendar-next class="md-header-filter-next"></div>';
                return header;
            },
            renderLabel: function (data) {
            	if (data.isMultiDay) {
		            return '<div style="background:' + data.original.color + ';color:#000" class="multi-day-event">' + data.original.title + '</div>';
		        } else {
		            return '<div class="single-day-event-dot" style="color:' + data.original.color + '"></div>' +
		                '<div class="single-day-event" style="border-radius: 4px;text-align:center;color:#000;background: '+data.original.color +'">' + data.start + ' - ' + data.end + '</div>';
		        }
		    },
            clickToCreate: true,                    // More info about clickToCreate: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-clickToCreate
            dragToCreate: false,                     // More info about dragToCreate: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-dragToCreate
            showEventTooltip: false,                 // More info about showEventTooltip: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-showEventTooltip
            
            onEventCreate: function (args, inst) {                                     // More info about onEventCreate: https://docs.mobiscroll.com/5-15-1/eventcalendar#event-onEventCreate
                // store temporary event
                if(isStaff) {                
                    tempAttendance = args.event;

                    setTimeout(function () {
                        createAddPopup(args);
                    }, 100);
                }
            },
            onEventClick: function (args, inst) {                                      // More info about onEventClick: https://docs.mobiscroll.com/5-15-1/eventcalendar#event-onEventClick
                oldAttendance = $.extend({}, args.event);
                tempAttendance = args.event;
    
                if (!popup.isVisible() && isStaff) {
                    createEditPopup(args);
                }
            },
            onEventHoverIn: function (args, inst) {  // More info about onEventHoverIn: https://docs.mobiscroll.com/5-16-0/eventcalendar#event-onEventHoverIn
                var event = args.event;
                var time = formatDate('hh:mm A', new Date(event.start)) + ' - ' + formatDate('hh:mm A', new Date(event.end));
                var button = {};
    
                currentEvent = event;
    
                $header.css('background-color', event.color);
                $header.css('color', '#000');
                // $data.text(event.title + ', Age: ' + event.age);
                $data.text('Attendance ' + formatDate('DDDD', new Date(currentEvent.start)) + ' ' + formatDate('DD MMMM YYYY', new Date(currentEvent.start)) );

                $time.text(time);
    
                $status.text(button.status);
                $reason.text(event.reason);
                $location.text(event.location);
                
                if(event.extraLabel) {
                    $tooltipExtra.text(event.extraLabel);
                }

                if(event.comment) {
                    $tooltipComment.text(event.comment);
                }

                // Hide edit and delete buttons for users
                if(!isStaff) {
                    $editButton.hide();
                    $deleteButton.hide();
                }

                clearTimeout(timer);
                timer = null;
    
                tooltip.setOptions({ anchor: args.domEvent.target });
                tooltip.open();

            },
            onEventHoverOut: function (args) {       // More info about onEventHoverOut: https://docs.mobiscroll.com/5-16-0/eventcalendar#event-onEventHoverOut
                if (!timer) {
                    timer = setTimeout(function () {
                        tooltip.close();
                    }, 200);
                }
            }
        }).mobiscroll('getInst');
        
        function createAddPopup(args) {
            // hide delete button inside add popup
            $popupDeleteButton.parent().hide();
            deleteShift = true;
            restoreShift = false;
            var slot = slots.find(function (s) { return s.id === tempAttendance.slot });
    
            // set popup header text and buttons for adding
            popup.setOptions({
                headerText: '<div>New attendance</div><div class="custom-event-attendance-day">' +  // More info about headerText: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-headerText
                    formatDate('DDDD', new Date(tempAttendance.start)) + ' ' + formatDate('DD MMMM YYYY', new Date(tempAttendance.start)) + '</div>',
                buttons: [                                                             // More info about buttons: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-buttons
                    'cancel',
                    {
                        text: 'Add',
                        keyCode: 'enter',
                        handler: function () {
                            saveAttendance(tempAttendance);
                            calendar.updateEvent(tempAttendance);
    
                            deleteShift = false;
                            popup.close();
                        },
                        cssClass: 'mbsc-popup-button-primary'
                    }
                ]
            });
            // fill popup with a new event data
            // range.setOptions({ 
            // 	minTime: tempAttendance.slot == 1 ? '07:00' : '12:00', 
            // 	maxTime: tempAttendance.slot == 1 ? '13:00' : '18:00',
            // 	// controls: ['time'], responsive: datetimePickerResponsive
            // });
            range.setVal([tempAttendance.start, tempAttendance.end]);

            updateOptionDates();
            resetCustomValues();
    
            popup.open();
        }
    
        function createEditPopup(args) {
            var ev = args ? args.event : tempAttendance;
            // var resource = staff.find(function (r) { return r.id === ev.resource });
            // var slot = slots.find(function (s) { return s.id === ev.slot });
            var headerText = '<div>Edit Attendance</div><div class="custom-event-attendance-day">' +
                formatDate('DDDD', new Date(ev.start)) + ' ' + formatDate('DD MMMM YYYY', new Date(ev.start)) + '</div>';
    
            // show delete button inside edit popup
            $popupDeleteButton.parent().show();
    
            deleteShift = false;
            restoreShift = true;
    
            // // set popup header text and buttons for editing
            popup.setOptions({
                headerText: headerText,                                                // More info about headerText: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-headerText
                buttons: [                                                             // More info about buttons: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-buttons
                    'cancel',
                    {
                        text: 'Save',
                        keyCode: 'enter',
                        handler: function () {
                            var date = range.getVal();
    
                            // update event with the new properties on save button click
                            calendar.updateEvent({
                                id: ev.id,
                                title: formatDate('HH:mm', date[0]) + ' - ' + formatDate('HH:mm', date[1] ? date[1] : date[0]),
                                location: tempAttendance.location,
                                comment: $comment.val(),
                                start: date[0],
                                end: date[1] ? date[1] : date[0],
                                // resource: resource.id,
                                color: resource.color,
                                // slot: slot.id,
                            });
    
                            restoreShift = false;
                            popup.close();
                        },
                        cssClass: 'mbsc-popup-button-primary'
                    }
                ]
            });
    
            // fill popup with the selected event data
            $location.mobiscroll('getInst').value = tempAttendance.location;
            $comment.mobiscroll('getInst').value = ev.comment || '';
            // range.setOptions({ minTime: ev.slot == 1 ? '07:00' : '12:00', maxTime: ev.slot == 1 ? '13:00' : '18:00' });
            range.setVal([ev.start, ev.end]);
            extraField.setVal(ev.extra.split(','));
            pauseField.setVal(ev.pause);
            transportField.setVal(ev.transport);

            updateOptionDates();
            resetCustomValues();
    
            popup.open();
        }
    
        var tooltip = $tooltip.mobiscroll().popup({
            display: 'anchored',                     // Specify display mode like: display: 'bottom' or omit setting to use default
            touchUi: false,
            showOverlay: false,
            contentPadding: false,
            width: 350                               // More info about width: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-width
        }).mobiscroll('getInst');
    
        $tooltip.mouseenter(function (ev) {
            if (timer) {
                clearTimeout(timer);
                timer = null;
            }
        });
        
        popup = $('#custom-event-attendance-create-edit-popup').mobiscroll().popup({
            display: 'bottom',                                                         // Specify display mode like: display: 'bottom' or omit setting to use default
            contentPadding: false,
            fullScreen: true,
            onClose: function () {                                                     // More info about onClose: https://docs.mobiscroll.com/5-15-1/eventcalendar#event-onClose
                if (deleteShift) {
                    calendar.removeEvent(tempAttendance);
                } else if (restoreShift) {
                    calendar.updateEvent(oldAttendance);
                }
            },
            responsive: {                                                              // More info about responsive: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-responsive
                medium: {
                    
                    display: 'center',                           // Specify display mode like: display: 'bottom' or omit setting to use default
                    width: 500,                                                        // More info about width: https://docs.mobiscroll.com/5-15-1/eventcalendar#opt-width
                    fullScreen: false,
                    touchUi: false,
                    showOverlay: false
                }
            }
        }).mobiscroll('getInst');
        
        range = $('#custom-event-attendance-date').mobiscroll().datepicker({
            controls: ['time'],
            select: 'range',
            display: 'anchored',                                                       // Specify display mode like: display: 'bottom' or omit setting to use default
            showRangeLabels: false,
            touchUi: false,
            startInput: '#custom-event-attendance-start',
            endInput: '#custom-event-attendance-end',
            stepMinute: 30,
            timeWheels: '|h:mm A|',
            onChange: function (args) {
                var date = args.value;
    
                // update shift's start/end date
                tempAttendance.start = date[0];
                tempAttendance.end = date[1] ? date[1] : date[0];
                tempAttendance.title = formatDate('HH:mm', date[0]) + ' - ' + formatDate('HH:mm', date[1] ? date[1] : date[0]);
            }
        }).mobiscroll('getInst');



        $repeatType.change(function (ev) {
            updateContent(ev.target.value);
        });
    
        select = $repeat.mobiscroll().select({
            data: repeatData,                              // More info about data: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-data
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-responsive
            onChange: function (event, inst) {
                var d = new Date(tempAttendance.start);
                var weekday = d.getDay();
                var monthday = d.getDate();
    
                // set recurring option
                switch (event.value) {
                    case 'daily':
                        tempAttendance.recurring = {
                            repeat: 'daily'
                        };
                        break;
                    case 'weekly':
                        tempAttendance.recurring = {
                            repeat: 'weekly',
                            weekDays: days[weekday].short  // More info about weekDays: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-weekDays
                        };
                        break;
                    case 'monthly':
                        tempAttendance.recurring = {
                            repeat: 'monthly',
                            day: monthday
                        };
                        break;
                    case 'yearly':
                        tempAttendance.recurring = {
                            repeat: 'yearly',
                            day: monthday,
                            month: d.getMonth() + 1
                        };
                        break;
                    case 'weekday':
                        tempAttendance.recurring = {
                            repeat: 'weekly',
                            weekDays: 'MO,TU,WE,TH,FR'     // More info about weekDays: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-weekDays
                        };
                        break;
                    case 'custom':
                    case 'custom-value':
                        updateContent($('input[name=custom-repeat-type]:checked').val());
                        customDate.setVal(d);
                        $customRepeat.show();
                        break;
                    default:
                        tempAttendance.recurring = null;
                }
    
                showHideCustom();
            }
        }).mobiscroll('getInst');
    
        monthSelect = $('#custom-repeat-month').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-responsive
            inputElement: document.getElementById('custom-repeat-month-input'),
            onChange: function (event, inst) {
                populateMonthDays(+event.value, yearDaySelect)
            }
        }).mobiscroll('getInst');
    
        monthDaySelect = $('#custom-repeat-month-day').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-responsive
            maxWidth: 80
        }).mobiscroll('getInst');
    
        yearDaySelect = $('#custom-repeat-year-day').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-16-0/eventcalendar#opt-responsive
            maxWidth: 80
        }).mobiscroll('getInst');

        populateMonthDays(1, monthDaySelect);
        populateMonthDays(1, yearDaySelect);
        monthDaySelect.setVal('1');
        yearDaySelect.setVal('1');
    
        customDate = $('#custom-repeat-date').mobiscroll().datepicker({
            controls: ['calendar'],
            display: 'anchored',
            touchUi: false,
            dateFormat: 'YYYY-MM-DD',                      // More info about dateFormat: https://docs.mobiscroll.com/5-16-0/eventcalendar#localization-dateFormat
            returnFormat: 'iso8601',
            onOpen: function () {
                $('input[name=custom-repeat-condition][value=until]').click();
            }
        }).mobiscroll('getInst');
    
        $until.on('click', function () {
            $('input[name=custom-repeat-condition][value=count]').click();
        });
    
        $tooltip.mouseleave(function (ev) {
            timer = setTimeout(function () {
                tooltip.close();
            }, 200);
        });
    
        $deleteButton.on('click', function (ev) {
            calendar.removeEvent(currentEvent);
    
            tooltip.close();
    
            mobiscroll.toast({ 
                
                message: 'Attendance deleted'
            });
        });
    
    	$popupDeleteButton.on('click', function () {
            // delete current event on button click
            calendar.removeEvent(oldAttendance);
            addEditPopup.close();
        });

        $editButton.on('click', function (ev) {
            tempAttendance = currentEvent;
            tooltip.close();
    
            createEditPopup();
            // mobiscroll.toast({ 
                
            //     message: 'Attendance edited'
            // });
        });

        extraField = $('#extra').mobiscroll().select({
            inputElement: document.getElementById('extra-input'),
            touchUi: false,
            onChange: function(ev, inst) {
                tempAttendance.extra = ev.value;
            }
        }).mobiscroll('getInst');

        pauseField = $('#pause-single-select').mobiscroll().select({
            inputElement: document.getElementById('pause-input'),
            touchUi: false,
            onChange: function(ev, inst) {
                tempAttendance.pause = ev.value;
            }
        }).mobiscroll('getInst');

        transportField = $('#transport-single-select').mobiscroll().select({
            inputElement: document.getElementById('transport-input'),
            touchUi: false,
            onChange: function(ev, inst) {
                tempAttendance.transport = ev.value;
            }
        }).mobiscroll('getInst');
    
    	function filterEvents(selected) {
            var evs = [];
            for (var i = 0; i < calendarData.length; ++i) {
                var item = calendarData[i];
                if (selected.indexOf(item.resource) > -1) {
                    evs.push(item);
                }
            }
            calendar.setEvents(evs);
        }

    	$('.md-header-filter').change(function (ev) {
            var value = ev.target.value;
            var checked = $(ev.target).is(':checked');
            var selected = [];
    
            $('.md-header-filter:checked').each(function () {
                selected.push(parseInt($(this).val()));
            });

            getAttendanceList(selected, function() {
                mobiscroll.toast({ 
                
                    message: (checked ? 'Showing ' : 'Hiding ') + $('.md-header-filter-name-' + value).text() + ' events'
                });
            });   
        
        });

        // Load events on page load
        getAttendanceList();

        function getAttendanceList(status = [], cb = null) {
            var queryParams = {};

            if(status.length > 0) {
                queryParams.status = status;
            }

            $.ajax({
                url: '{{ request()->url() }}',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'GET',
                data: queryParams,
                success: function(data) {
                    calendar.setEvents(data.attendance);

                    if(cb) {
                        cb();
                    }
                }
            });
        }

        function saveAttendance() {
            var tempAttendanceData = tempAttendance;

            tempAttendanceData.start = formatDate('YYYY-MM-DD HH:mm:ss', tempAttendance.start);
            tempAttendanceData.end = formatDate('YYYY-MM-DD HH:mm:ss', tempAttendance.end);

            $.ajax({
                url: '{{ url("staff/attendance") }}',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: tempAttendanceData,
                success: function(data) {
                    getAttendanceList();
                }
            });
        }
    
    });
</script>
@include('users.schedule.include-common-script')
@endsection