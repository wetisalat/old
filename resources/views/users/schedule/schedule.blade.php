@extends('layouts/contentLayoutMaster')

@section('title', 'Schedule')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('schedule') }}">
<meta name="save-leave-url" content="{{ route('leave') }}">
<style type="text/css">

    .md-meal-type {
        font-size: 14px;
        font-weight: 600;
        opacity: .6;
    }

    .md-employee-shifts-popup .mbsc-popup .mbsc-popup-header {
        padding-top: 8px;
        padding-bottom: 8px;
    }

    .md-employee-shifts-cont {
        position: relative;
        padding-left: 34px;
        text-align: left;
        font-size: 12px;
        /*font-weight: 600;*/
        height: 100%;
        background: #fff;
        box-sizing: border-box;
        /*box-shadow: 0 0 5px rgba(0, 0, 0, .3);*/
        border-radius: 0 10px 10px 0;
        overflow: hidden;
    }
    .md-custom-event-details {
        padding: 0 10px;
    }

    .md-custom-event-title {
        color: initial;
    }

    .md-custom-event-allday-title {
        font-size: 12px;
        font-weight: 600;
        color: #fff;
        padding: 2px 10px;
        border-radius: 10px;
        opacity: .7;
    }

    .md-employee-shifts-title {
        font-size: 20px;
    }

    .md-employee-shifts-kcal {
        color: #929292;
    }

    .md-employee-shifts-icon {
        position: absolute;
        left: 0;
    }

    .md-employee-shifts-calendar.mbsc-calendar .mbsc-schedule-event-all-day-inner {
        height: 40px;
        display: flex;
        align-items: center;
    }

    .md-employee-shifts-calendar .md-employee-shifts-event-title {
        font-size: 12px;
    }

    .md-employee-shifts-calendar .md-employee-shifts-event-desc {
        opacity: .6;
    }

    .md-employee-shifts-popup .mbsc-segmented-item:first-child .mbsc-selected.mbsc-material,
    .md-employee-shifts-popup .mbsc-segmented-item:first-child .mbsc-selected.mbsc-windows,
    .md-employee-shifts-popup .mbsc-segmented-item:first-child .mbsc-segmented-selectbox-inner {
        background: #f08786;
    }

    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-material,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-windows,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(2) .mbsc-segmented-selectbox-inner {
        background: #8abe89;
    }

    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-material,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-windows,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(3) .mbsc-segmented-selectbox-inner {
        background: #99d3ef;
    }

    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(4) .mbsc-selected.mbsc-material,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(4) .mbsc-selected.mbsc-windows,
    .md-employee-shifts-popup .mbsc-segmented-item:nth-child(4) .mbsc-segmented-selectbox-inner {
        background: #f0ce8e;
    }

    .md-employee-shifts-popup .mbsc-segmented-item:last-child .mbsc-selected.mbsc-material,
    .md-employee-shifts-popup .mbsc-segmented-item:last-child .mbsc-selected.mbsc-windows,
    .md-employee-shifts-popup .mbsc-segmented-item:last-child .mbsc-segmented-selectbox-inner {
        background: #b48bce;
    }

    .md-timezone-meeting-planner.mbsc-ios-dark .mbsc-timeline-color,
    .md-timezone-meeting-planner.mbsc-material-dark .mbsc-timeline-color,
    .md-timezone-meeting-planner.mbsc-windows-dark .mbsc-timeline-color {
        color: #fff !important;
    }
    .md-event-listing-cont {
        position: relative;
        padding-left: 50px;
    }
    
    .md-event-listing-avatar {
        position: absolute;
        max-height: 50px;
        max-width: 50px;
        top: 21px;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        left: 20px;
    }
    
    .md-event-listing-name {
        font-size: 16px;
    }
    
    .md-event-listing-title {
        font-size: 12px;
        margin-top: 5px;
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
    .md-employees-cont {
        position: relative;
        padding-left: 45px;
        max-height: 40px;
    }

    .md-employees-avatar {
        position: absolute;
        max-height: 30px;
        max-width: 40px;
        top: 18px;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        left: 20px;
        border-radius: 50%;
    }
    .md-employees-name-team
    {
        font-size: 16px;
    }
    .md-employees-name {
        font-size: 12px;
    }

    .md-employees-title {
        font-size: 10px;
    }
    .d-none
    {
        display: none !important;
    }
    .md-custom-event-title {
        color: initial;
    }
    .md-custom-event-time {
        font-size: 13px;
        color: #666;
        padding-top: 3px;
    }
    .staff-search-form {
        display: flex;
        align-items: center;
    }
    .staff-search-form input {
        box-shadow: none !important;
    }   
    .mbsc-timeline-header-placeholder, .mbsc-timeline-day {
        /*min-height: 96px;*/
    }    
    .mbsc-timeline-header-date {
        height: 100%;
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
        left: 0em;
        right: 0.25em;
        top: 4px;
        min-height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #000;
        border-radius: 0.25em;
        box-sizing: border-box;
        height: 100%;
    }
     /* create event modal inline days begin */
     .custom-inline-days {
        background: white;
        padding-left: 1rem;
        padding-right: 1rem;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding-top: 1px;
    }
    .mbsc-checkbox.mbsc-form-control-wrapper {
        display: inline-block;
        padding-left: 25px;
        padding-right: 10px;
        /* border-top: 1px solid #ccc; */
    }
    .custom-inline-days .mbsc-checkbox-box {
        left: 0;
        width: 20px;
        height: 20px;
        margin-top: -10px;
        color: #495162;
    }
    .custom-inline-days .mbsc-ios.mbsc-form-control-wrapper.mbsc-ltr:after,
    .custom-inline-days .mbsc-ios.mbsc-form-control-wrapper.mbsc-ltr:before {
        border-top: 0;
    }
    .custom-inline-days .mbsc-checkbox-box.mbsc-checked:after {
        width: 10px;
        height: 6px;
        top: 4px;
        left: 3px;
    }
    /* create event modal inline days end */
    
    /* color picker styles begin */
    .event-color-c {
        display: flex;
        margin: 16px;
        align-items: center;
        cursor: pointer;
    }

    .event-color-label {
        flex: 1 0 auto;
    }

    .event-color {
        width: 30px;
        height: 30px;
        border-radius: 15px;
        margin-right: 10px;
        margin-left: 240px;
        background: #5ac8fa;
    }

    .crud-color-row {
        display: flex;
        justify-content: center;
        margin: 5px;
    }

    .crud-color-c {
        padding: 3px;
        margin: 2px;
    }
    .crud-color {
        position: relative;
        min-width: 46px;
        min-height: 46px;
        margin: 2px;
        cursor: pointer;
        border-radius: 23px;
        background: #5ac8fa;
    }

    .crud-color-c.selected,
    .crud-color-c:hover {
        box-shadow: inset 0 0 0 3px #007bff;
        border-radius: 48px;
    }

    .crud-color:before {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -10px;
        margin-left: -10px;
        color: #f7f7f7;
        font-size: 20px;
        text-shadow: 0 0 3px #000;
        display: none;
    }

    .crud-color-c.selected .crud-color:before {
        display: block;
    }
    /* color picker styles end */

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

    .no-margin {
        margin: 0;
    }

    .mb-0 {
        margin-bottom: 0;
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
    .mbsc-timeline-row {
        min-height: 96px;
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
                        <div id="demo-event-listing" class="md-event-listing"></div>
                        <div id="employee-shifts-popup" class="md-employee-shifts-popup add-event-pop-form">
                            <div id="meal-type-segmented" class="mbsc-form-group"></div>
                            <div class="mbsc-form-group">
                                <label>
                                    Schedule
                                    <input id="recurring-event-status-busy" class="change-view" mbsc-segmented type="radio" name="event_type" value="schedule" checked>
                                </label>
                                <label>
                                    Leave
                                    <input id="recurring-event-status-free" class="change-view" mbsc-segmented type="radio" name="event_type" value="leave">
                                </label>
                            </div>
                            <div class="schedule-view">
                                <div class="mbsc-form-group">
                                    <label>
                                        Staff
                                        <input mbsc-input id="my-staff-input" data-dropdown="true" />
                                    </label>
                                    <select id="staff-single-select">
                                        @if(!$staff_users->isEmpty())
                                            @foreach($staff_users as $staff_user)
                                                <option value="{{ $staff_user->id }}">{{ empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname . ' ' . $staff_user->lastname }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <div class="mbsc-grid mbsc-form-grid no-margin">
                                        <div class="mbsc-row">
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Shift
                                                    <input mbsc-input id="my-shift" data-dropdown="true" />
                                                </label>
                                                <select id="multiple-my-shift">
                                                    @if(!$shifts->isEmpty())
                                                        @foreach($shifts as $shift)
                                                            <option value="{{ $shift->id }}">{{ $shift->name }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Location
                                                    <input mbsc-input id="my-location" data-dropdown="true" />
                                                </label>
                                                <select id="multiple-my-location">
                                                    @if(!$locations->isEmpty())
                                                        @foreach($locations as $location)
                                                            <option value="{{ $location->id }}">{{ $location->name }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mbsc-form-group">
                                    <label>
                                        All-day
                                        <input mbsc-switch id="recurring-event-all-day" type="checkbox" />
                                    </label>
                                    <label>
                                        Starts
                                        <input mbsc-input id="recurring-event-start-input" />
                                    </label>
                                    <label>
                                        Ends
                                        <input mbsc-input id="recurring-event-end-input" />
                                    </label>
                                    <div id="recurring-event-date"></div>
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
                                <div class="mbsc-form-group mb-0">
                                    <div class="mbsc-grid mbsc-form-grid no-margin">
                                        <div class="mbsc-row">                                          
                                            <div class="mbsc-col-12">
                                                <label>
                                                    Todo
                                                    <input mbsc-input id="todo-input" data-dropdown="true" />
                                                </label>
                                                <select id="todo-single-select" multiple>
                                                    @if(!$tasklist->isEmpty())
                                                        @foreach($tasklist as $task)
                                                            <option value="{{ $task->id }}">{{ $task->title }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mbsc-grid mbsc-form-grid no-margin">
                                        <div class="mbsc-row">
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Break
                                                    <input mbsc-input id="pause-input" />
                                                </label>
                                            </div>
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Lunch
                                                    <input mbsc-input id="lunch-input" data-dropdown="true" />
                                                </label>
                                                <select id="lunch-single-select">
                                                    @foreach($lunch as $lunch_row)
                                                        <option value="{{ $lunch_row->id }}">{{ $lunch_row->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <label>
                                        Description
                                        <textarea mbsc-textarea id="meal-notes-textarea"></textarea>
                                    </label>
                                    <div class="mbsc-grid mbsc-form-grid no-margin">
                                        <div class="mbsc-row">
                                            <div class="mbsc-col-12">
                                                <div id="event-color-picker" class="event-color-c">
                                                    <div class="event-color-label">Color</div>
                                                    <div id="event-color-cont">
                                                        <div id="event-color" class="event-color"></div>
                                                    </div>
                                                </div>
                                                <div id="demo-event-color">
                                                    <div class="crud-color-row">
                                                        <div class="crud-color-c" data-value="#ffeb3c">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#ffeb3c"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#ff9900">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#ff9900"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#f44437">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#f44437"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#ea1e63">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#ea1e63"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#9c26b0">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#9c26b0"></div>
                                                        </div>
                                                    </div>
                                                    <div class="crud-color-row">
                                                        <div class="crud-color-c" data-value="#3f51b5">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#3f51b5"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#009788">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#009788"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#4baf4f">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#4baf4f"></div>
                                                        </div>
                                                        <div class="crud-color-c" data-value="#7e5d4e">
                                                            <div class="crud-color mbsc-icon mbsc-font-icon mbsc-icon-material-check" style="background:#7e5d4e"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="leave-view d-none">
                                <div class="mbsc-form-group">
                                    <label>
                                        Staff
                                        <input mbsc-input id="staff-leave-input" data-dropdown="true" />
                                    </label>
                                    <select id="staff-leave-single-select">
                                        @if(!$staff_users->isEmpty())
                                            @foreach($staff_users as $staff_user)
                                                <option value="{{ $staff_user->id }}">{{ empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname . ' ' . $staff_user->lastname }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <label>
                                        Reason
                                        <input mbsc-input id="reason-leave-input" data-dropdown="true" />
                                    </label>
                                    <select id="reason-leave-single-select">
                                        @foreach($leave_categories as $category)
                                            <optgroup label="{{ $category->name }}">

                                            @foreach($category->leave_reasons as $reason)
                                                <option value="{{ $reason->id }}">{{ $reason->name }}</option>
                                            @endforeach
                                        @endforeach
                                    </select>
                                    <label>
                                        Description
                                        <textarea mbsc-textarea id="leave-notes-textarea"></textarea>
                                    </label>
                                </div>
                                <div class="mbsc-form-group">
                                    <label>
                                        <input mbsc-switch data-label="All-day" type="checkbox" checked id="leave-all-day" />
                                    </label>
                                    <label>
                                        Start
                                        <input class="start-and-end" mbsc-input placeholder="Please select..." id="leave-start-input" />
                                    </label>
                                    <label>
                                        End
                                        <input class="start-and-end" mbsc-input placeholder="Please select..." id="leave-end-input" />
                                    </label>
                                    <div id="leave-event-date"></div>
                                </div>
                            </div>
                            <div class="mbsc-button-group">
                                <button class="mbsc-button-block" id="leave-delete" mbsc-button data-color="danger" data-variant="outline">Delete Event</button>
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
                                    <button id="tooltip-leave-pending" mbsc-button data-color="warning" data-variant="outline" class="md-tooltip-status-button">Pending</button>
                                    <button id="tooltip-leave-accept" mbsc-button data-color="success" data-variant="outline" class="md-tooltip-status-button">Accept</button>
                                    
                                </div>

                                <div class="md-tooltip-title">Location: <span id="tooltip-event-location" class="md-tooltip-location md-tooltip-text"></span></div>
                                <div class="md-tooltip-title">Todo: <span id="tooltip-event-todo" class="md-tooltip-todo md-tooltip-text"></span></div>   
                                <div class="md-tooltip-title">Pause: <span id="tooltip-event-pause" class="md-tooltip-pause md-tooltip-text"></span></div> 
                                <div class="md-tooltip-title">Lunch: <span id="tooltip-event-lunch" class="md-tooltip-lunch md-tooltip-text"></span></div> 
                                <div class="md-tooltip-title">Reason: <span id="tooltip-leave-reason" class="md-tooltip-reason md-tooltip-text"></span></div>  
                                <div class="md-tooltip-title">Description: <span id="tooltip-event-description" class="md-tooltip-description md-tooltip-text"></span></div>       
                                <button id="tooltip-event-view" mbsc-button data-color="secondary" class="md-tooltip-view-button">View patient file</button>
                           
                                <button id="tooltip-event-delete" mbsc-button data-color="danger" data-variant="outline" class="md-tooltip-delete-button">Delete appointment</button>
                                <button id="tooltip-leave-refuse" mbsc-button data-color="danger" data-variant="outline" class="md-tooltip-delete-button">Refuse</button>
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
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
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
    var calendar = '';
    var theme = "{{ isset($themeMode) && $themeMode->status == 1 ? 'dark' : 'light' }}";

    mobiscroll.setOptions({
        locale: mobiscroll.localeEn,
        theme: "{{ isset($themeMode) && $themeMode->status == 1 ? 'vuexy-theme' : 'ios' }}",
        themeVariant: theme,
        locale: mobiscroll.locale['{{ $lang }}'],
        timeFormat: 'HH:mm', // Specify the time format for each view
        dateFormat: 'DDDD, DD MMMM YYYY', // Specify the date format for each view
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
        var tempMeal = {};
        var deleteMeal;
        var restoreMeal;
        var formatDate = mobiscroll.util.datetime.formatDate;
        var $name = $('#meal-name-input');
        var $calories = $('#meal-calories-input');
        var $notes = $('#meal-notes-textarea');
        var $deleteButton = $('#meal-delete');
        var $types = $('#meal-type-segmented');
        var staffSingleSelect;
        var todoSingleSelect;
        var lunchSingleSelect;
        var pauseSingleSelect;
        var staffShift;
        var staffLocation;

        var staffLeaveSingleSelect; 
        var reasonLeaveSingleSelect;
        var $leaveNotes = $('#leave-notes-textarea');
        var $leaveEventDate;
        var $leaveAllDay = $('#leave-all-day');
        var $leaveDeleteBtn = $('#leave-delete');

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
        var $tooltipLeaveAcceptBtn = $('#tooltip-leave-accept');
        var $tooltipLeaveRefuseBtn = $('#tooltip-leave-refuse');
        var $tooltipLeavePendingBtn = $('#tooltip-leave-pending');

        var $header = $('#tooltip-event-header');
        var $data = $('#tooltip-event-name-age');
        var $time = $('#tooltip-event-time');
        var $status = $('#tooltip-event-title');       
        var $eventName = $('#tooltip-event-name');
        var $eventEmail = $('#tooltip-event-email')

        var tempEvent = {};
        var colorPicker;
        var tempColor;
        var $color = $('#event-color');
        var currentEvent;

        var $allDay = $('#recurring-event-all-day');
        var $repeat = $('#recurring-event-repeat');        
        var $customRepeat = $('#demo-custom-repeat-cont');
        var $until = $('#custom-repeat-until');
        var $repeatType = $('input[name=custom-repeat-type]');

        var range;
        var select;
        var eventDate;
        var monthSelect;
        var monthDaySelect;
        var yearDaySelect;

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
        
        var selectResponsive = {
            xsmall: {
                touchUi: true
            },
            small: {
                touchUi: false
            }
        };

        var slots = [{
            id: 1,
            name: 'Morning',
        }, {
            id: 2,
            name: 'Afternoon',
        }];

        var loggedInUser = {!! auth()->user() !!};
        var resources = {!!  json_encode($resource) !!};
        var calendarData = {!! json_encode($events) !!};
        var shifts = {!! json_encode($shifts) !!};
        var calendarColors = {!! json_encode($leave) !!}; 

        calendarColors.map(function(color) {
            color.title = '';

            return color;
        });

        calendarData = calendarData.concat({!! json_encode($leave) !!})

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

        staffSingleSelect = $('#staff-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-staff-input'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.staff = ev.value;
            }
        }).mobiscroll('getInst');

        staffLeaveSingleSelect = $('#staff-leave-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('staff-leave-input'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.staff = ev.value;
            }
        }).mobiscroll('getInst');

        reasonLeaveSingleSelect = $('#reason-leave-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('reason-leave-input'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.reason = ev.value;
            }
        }).mobiscroll('getInst');

        todoSingleSelect = $('#todo-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('todo-input'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.todo = ev.value;
            }
        }).mobiscroll('getInst');

        lunchSingleSelect = $('#lunch-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('lunch-input'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.lunch = ev.value;
            }
        }).mobiscroll('getInst');

        pauseSingleSelect = $('#pause-input');

        staffShift = $('#multiple-my-shift').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-shift'),
            touchUi: true,
            onChange: function(ev, inst) {
                // update date time
                var shiftDetail = shifts.find(function(shift) { return shift.id === parseInt(ev.value); });
               
                tempMeal.shift = ev.value;

                var startDate = formatDate('MM-DD-YYYY', new Date(tempMeal.start));
                var startTime = formatDate('HH:mm', new Date(new Date().toDateString() + ' ' + shiftDetail.start_time));


                var endDate = formatDate('MM-DD-YYYY', new Date(tempMeal.end));
                var endTime = formatDate('HH:mm', new Date(new Date().toDateString() + ' ' + shiftDetail.end_time));

                if(shiftDetail.name === 'Night shift') {
                    endDate = formatDate('MM-DD-YYYY',  new Date(new Date(tempMeal.end).setDate(new Date(tempMeal.end).getDate() + 1)));
                    endTime = formatDate('HH:mm', new Date(new Date(new Date() + ( 3600 * 1000 * 24)).toDateString() + ' ' + shiftDetail.end_time));
                }

                var startDatetime = new Date( startDate + ' ' + startTime);
                var endDatetime = new Date( endDate + ' ' + endTime);
                
                tempMeal.start = startDatetime;
                tempMeal.end = endDatetime;

                eventDate.setVal([tempMeal.start, tempMeal.end]);

                // Populate break select
                var break_time_parts = shiftDetail.break_time.split(':'), 
                    break_time_mins = break_time_parts.length > 1 ? (parseInt(break_time_parts[0], 10) * 60) + parseInt(break_time_parts[1], 10) : 0;
                
                pauseSingleSelect.mobiscroll('getInst').value = break_time_mins;
                tempMeal.pause = break_time_mins;
            }
        }).mobiscroll('getInst');   

        staffLocation = $('#multiple-my-location').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-location'),
            touchUi: true,
            onChange: function(ev, inst) {
                tempMeal.location = ev.value;
            }
        }).mobiscroll('getInst');

        $('#break-input').mobiscroll().datepicker({
            controls: ['calendar'],
            select: 'range',
            touchUi: true
        });

        calendar = $('#demo-event-listing').mobiscroll().eventcalendar({
            onEventClick: function (event, inst) {
        },
        onEventDoubleClick: function (event, inst) {
        },
            // modules: [mobiscroll.print],
            view: {
                timeline: {
                    type: 'week',
                    eventList: true,
                    weekNumbers: true,
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
            // slots: slots,
            colors: calendarColors,
            data: calendarData,                                  // More info about data: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-data
            resources: resources,
            showEventTooltip: false,
            renderResource: function (resource) {

                if (resource.img)
                {
                    return '<div class="md-employees-cont">' +
                            '<div class="md-employees-name">' + resource.name + '</div>' +
                            '<div class="md-employees-title">' + resource.title + '</div>' +
                            '<img class="md-employees-avatar" src="' + resource.img + '"/>' +
                        '</div>';
                }

                return '<div class="md-employees-cont-team">' +
                            '<div class="md-employees-name-team">' + resource.name + '</div>' +
                        '</div>';
            },
            renderHeader: function () {
                return '<div mbsc-calendar-nav class="md-event-listing-nav"></div>' +
                    '<div class="md-event-listing-picker">' +
                    '<label>{{ __("Day") }}<input mbsc-segmented type="radio" name="event-listing-view" value="day" class="event-listing-view-change"></label>' +
                    '<label>{{ __("Week") }}<input mbsc-segmented type="radio" name="event-listing-view" value="week" class="event-listing-view-change" checked></label>' +
                    '<label>{{ __("Month") }}<input mbsc-segmented type="radio" name="event-listing-view" value="month" class="event-listing-view-change"></label>' +
                    '</div>' +
                    '<div mbsc-calendar-prev class="md-event-listing-prev"></div>' +
                    '<div mbsc-calendar-today class="md-event-listing-today"></div>' +
                    '<div mbsc-calendar-next class="md-event-listing-next"></div>';
            },
            renderResourceHeader: function () {
                return '<div class="search-input staff-search-form">' +
                        '<div class="search-input-icon"><i data-feather="search"></i></div>' +
                        '<input class="form-control input border-0 test-input" name="staff-search" type="text" placeholder="Search  ..." id="staff-search-input" onChange="handleSearchStaffs(this.value)" />' +                        
                        '</div>'
            },
            renderScheduleEvent: function (data) {
                var color = '#000';

                if (data.color)
                {
                    color = data.color;
                }

                return '<div class="md-custom-event-cont" style="background:' + color + ';">' +
                    '<div class="md-custom-event-wrapper">' +  
                    '<div class="md-custom-event-details">' +                 
                    '<div class="md-custom-event-title">' + (data.title ? data.title : '') +
                    '</div></div></div>';
            },
            onEventClick: function (args) {                // More info about onEventClick: https://docs.mobiscroll.com/5-14-1/eventcalendar#event-onEventClick
                var event = args.event.original ? args.event.original : args.event;
    
                oldMeal = $.extend({}, event);
                tempMeal = event;

                tempMeal.original = oldMeal;
    
                setCustomText(event.recurring);
    
                if (!popup.isVisible()) {
                    addMealPopup(args);
                }
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
            /***************** Edit Event Functions End *********************/            
            onEventUpdated: function (event, inst) {
                createOrUpdateEvent(event.event);
            },
            onEventCreated: function (args) {              // More info about onEventCreated: https://docs.mobiscroll.com/5-14-1/eventcalendar#event-onEventCreated
                popup.close();
    
                // store temporary event
                tempMeal = args.event;

                var resource = resources.find(function (rs) { 
                    return rs.children ? rs.children.some(staff => staff.id === tempMeal.resource) : rs.id === tempMeal.resource;
                });

                addMealPopup(args.target);
            },              
            onEventCreateFailed: function (event) {
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
            onEventHoverIn: function (args, inst) {
                console.log("hover event")
                var event = args.event;
                var resource = resources.find(function (rs) { 
                    return rs.children ? rs.children.some(staff => staff.id === event.resource) : rs.id === event.resource;
                });

                var startTime = new Date(event.start);
                var endTime = new Date(event.end);
                    
                var timeDiff = endTime.getTime() - startTime.getTime();

                // if(event.shift) {
                //     startTime = new Date(new Date().toDateString() + ' ' + event.shift.start_time);

                //     if(event.title === 'Night shift') {
                //         endTime = new Date(new Date(new Date() + ( 3600 * 1000 * 24)).toDateString() + ' ' + event.shift.end_time);
                //     } else {
                //         endTime = new Date(new Date().toDateString() + ' ' + event.shift.end_time);
                //     }
                // }
                    
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

                if(event.reason) {
                    $tooltipLeaveReason.text(event.title).closest('div').show();
                } else {
                    $tooltipLeaveReason.closest('div').hide();
                }

                $tooltipLeaveAcceptBtn.hide();
                $tooltipLeaveRefuseBtn.hide();
                $tooltipLeavePendingBtn.hide();

                // Staff created the event if user_id === staff_id                
                if(event.user_id === parseInt(event.staff_id)) {

                    if(event.status_name === 'pending') {
                        $tooltipLeaveAcceptBtn.css({ 'position': 'relative' }).show();
                        $tooltipLeaveRefuseBtn.show();

                        $tooltipEditEvent.hide();
                        $tooltipDeleteEvent.hide(); 

                    } else if(event.status_name === 'accept') {
                        $tooltipLeavePendingBtn.show();
                        $tooltipLeaveRefuseBtn.show();

                        $tooltipEditEvent.hide();
                        $tooltipDeleteEvent.hide(); 
                    } else {
                        $tooltipLeavePendingBtn.show();
                        $tooltipLeaveAcceptBtn.css({ 'position': 'absolute', 'bottom': '10px', 'right': '15px' }).show();
                        $tooltipLeaveRefuseBtn.hide();

                        $tooltipEditEvent.hide();
                        $tooltipDeleteEvent.hide(); 
                    }
                } else {
                    $tooltipEditEvent.show();
                    $tooltipDeleteEvent.show();
                }

                clearTimeout(timer);
                timer = null;

                tooltip.setOptions({ anchor: args.domEvent.target });
                tooltip.open();
            },
            onEventHoverOut: function (args) {
                if (!timer) {
                    timer = setTimeout(function () {
                        tooltip.close();
                    }, 200);
                }
            },        
        }).mobiscroll('getInst');
    
        $('.event-listing-view-change').change(function (ev) {
            switch (ev.target.value) {
                case 'day':                    
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'week',
                                // eventList: true,
                                weekNumbers: true                           
                            }
                        },
                        // slots: slots
                    });
                    break;
                case 'week':
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'week',
                                eventList: true,
                                weekNumbers: true                             
                            }
                        },
                        slots: []
                    })
                    break;
                case 'month':
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'month',
                                eventList: true,
                                weekNumbers: false
                            }
                        },
                        slots: []
                    })
                    $('.mbsc-timeline-header-date').css('height', '100%')
                    break;
            }
        });

        $('body').on('change', '.change-view', function (e) {

            tempMeal.eventType = $(this).val();

            if ($(this).val() == 'leave')
            {
                $(".leave-view").removeClass('d-none');
                $(".schedule-view").addClass('d-none');
            }
            else
            {
                $(".leave-view").addClass('d-none');
                $(".schedule-view").removeClass('d-none');
            }
        });   

        /*************** All day Begin *****************/
        $leaveAllDay.on('change', function () {
            var checked = this.checked

            // change range settings based on the allDay
            range.setOptions({
                controls: checked ? ['date'] : ['datetime'],
                responsive: checked ? datePickerResponsive : datetimePickerResponsive
            });

            // update current event's allDay property
            tempMeal.allDay = checked;
        });

        range = $('#leave-event-date').mobiscroll().datepicker({
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
                console.log('range:', date)
                tempMeal.start = date[0];
                tempMeal.end = date[1];
            }
        }).mobiscroll('getInst');

        /*************** All day End *****************/

        $notes.on('change', function (ev) {
            // update current event's title
            tempMeal.description = ev.target.value;
        });

        $leaveNotes.on('change', function (ev) {
            // update current event's title
            tempMeal.description = ev.target.value;
        });

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

        function updateOptionDates() {
            var d = new Date(tempMeal.start);
            var weekday = d.getDay() ? d.getDay() : 0 ;
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
                        customText += ' until ' + mobiscroll.util.datetime.formatDate('DDD D MMM YYYY', new Date(customDate.getVal()));
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
    
                tempMeal.recurring = rec;
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
    
        function navigateTo(date) {
            var rec = tempMeal.recurring;
            var stDate = new Date(tempMeal.start);
            var d = date || stDate;
            var nextYear = 0;
   
            // navigate the calendar to the correct view
            if (rec && rec.repeat === 'yearly') {
                if (d.getMonth() + 1 > +rec.month && d.getDay() > +rec.day) {
                    nextYear = 1;
                }
                calendar.navigate(new Date(stDate.getFullYear() + nextYear, rec.month - 1, rec.day));
            } else {
                calendar.navigate(stDate);
            }
        }

        function addMealPopup() {
            // hide delete button inside add popup
            $deleteButton.hide();
            $leaveDeleteBtn.hide();

            deleteMeal = true;
            restoreMeal = false;

            popup.setOptions({
                headerText: '<div>New Schedule</div>',
                buttons: [
                    'cancel',
                    {
                        text: 'Add',
                        keyCode: 'enter',
                        handler: function () {
                            setCustomSettings();

                            calendar.updateEvent(tempMeal);                         
                            
                            if(tempMeal.eventType === 'leave') {
                                createOrUpdateLeave(tempMeal, 1);
                            } else {
                                createOrUpdateEvent(tempMeal, 1);
                            }

                            // navigateTo();

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

            $('.employee-shifts-type').each(function (i, elm) {
                $(elm).mobiscroll('getInst').checked = + elm.value == tempMeal.resource;
            });

            /********** Leave modal All day Begin ***********/
            $allDay.mobiscroll('getInst').checked = false;
            /********** Leave modal All day End ***********/

            // fill popup with the selected event data
            eventDate.setVal([tempMeal.start, tempMeal.end]);
            eventDate.setOptions({ 
                controls: tempMeal.allDay ? ['date'] : ['datetime'], 
                responsive: tempMeal.allDay ? datePickerResponsive : datetimePickerResponsive 
            });

            tempMeal.color = RGBToHex($color.css( 'background-color' ));

            // Prefill leave inputs
            $leaveAllDay.mobiscroll('getInst').checked = false;
            range.setVal([tempMeal.start, tempMeal.end]);
            range.setOptions({
                controls: tempMeal.allDay ? ['date'] : ['datetime'],
                responsive: tempMeal.allDay ? datePickerResponsive : datetimePickerResponsive
            });

            updateOptionDates();
            resetCustomValues();

            selectColor('', true);
            popup.open();
        } 

        /********* Edit Popup Begin *********/
        function createEditPopup(args) {
            var ev = args ? args.event : currentEvent;
            console.log(ev)
            // show delete button inside edit popup
            $deleteButton.show();
            $leaveDeleteBtn.show();

            deleteMeal = false;
            restoreMeal = true;

            // set popup header text and buttons for editing
            popup.setOptions({
                headerText: 'Edit event',
                buttons: [
                    'cancel',
                    {
                        text: 'Save',
                        keyCode: 'enter',
                        handler: function () {
                            // var date = range.getVal();

                            // update event with the new properties on save button click
                            // calendar.updateEvent({
                            //     id: ev.id,
                            //     title: 'New event',
                            //     description: $notes.val(),
                            //     allDay: $allDay.mobiscroll('getInst').checked,
                            //     start: ev.start,
                            //     end: ev.end,
                            //     // free: $statusFree.mobiscroll('getInst').checked,
                            //     color: $color.val(),
                            //     resource: ev.resource,
                            //     user_id: ev.user_id
                            // });
                            // 
                            
                            calendar.updateEvent(tempMeal);

                            createOrUpdateEvent(tempMeal);

                            // navigate the calendar to the correct view
                            calendar.navigate(ev.start);;

                            restoreMeal = false;
                            popup.close();
                        },
                        cssClass: 'mbsc-popup-button-primary'
                    }
                ]
            });

            // fill popup with the selected event data
            // $title.mobiscroll('getInst').value = ev.title || '';
            // $description.mobiscroll('getInst').value = ev.description || '';
            $allDay.mobiscroll('getInst').checked = ev.allDay || false;
            eventDate.setVal([ev.start, ev.end]);
            selectColor(ev.color, true);
           
            eventDate.setOptions({
                controls: ev.allDay ? ['date'] : ['datetime'],
                responsive: ev.allDay ? datePickerResponsive : datetimePickerResponsive
            });

            staffSingleSelect.setVal(ev.resource);
            staffShift.setVal(ev.shift_id);
            staffLocation.setVal(ev.location_id);
            todoSingleSelect.setVal(ev.todo_id);
            pauseSingleSelect.mobiscroll('getInst').value  = ev.pause;
            lunchSingleSelect.setVal(ev.lunch);
            $notes.mobiscroll('getInst').value  = ev.description;

            // set repeat type from recurring rule
            var repeatType,
                rec = ev.recurring;
    
            if (rec) {
                if (rec.interval) {
                    var condition;
    
                    repeatType = 'custom-value';
    
                    $('input[name=custom-repeat-type][value=' + rec.repeat + ']').mobiscroll('getInst').checked = true;
    
                    $('#custom-repeat-nr').val(rec.interval);
    
                    if (rec.until) {
                        condition = 'until';
                    } else if (rec.count) {
                        condition = 'count';
                    } else {
                        condition = 'never';
                    }
    
                    $('input[name=custom-repeat-condition][value=' + condition + ']').mobiscroll('getInst').checked = true;
    
                    if (rec.weekDays) {
                        $.each($('.custom-repeat-weekdays'), function () {
                            if (rec.weekDays.split(',').indexOf($(this).val()) > 0) {
                                $(this).mobiscroll('getInst').checked = true;
                            }
                        });
                    }
    
                    if (rec.day) {
                        if (rec.repeat === 'yearly') {
                            yearDaySelect.setVal(rec.day);
                            if (rec.month) {
                                monthSelect.setVal(rec.month);
                            }
                        } else {
                            monthDaySelect.setVal(rec.day)
                        }
                    }
                    updateContent(rec.repeat);
                } else if (rec.weekDays === 'MO,TU,WE,TH,FR') {
                    repeatType = 'weekday';
                } else {
                    repeatType = rec.repeat;
                }
            } else {
                repeatType = 'norepeat';
                resetCustomValues();
            }
    
            select.setVal(repeatType);
            updateOptionDates();
            showHideCustom();

            if(args) {
                popup.setOptions({ anchor: args.domEvent.currentTarget });
            }

            popup.open();
        }
        /********* Edit Popup End *********/

        updateContent('daily');   

        popup = $('#employee-shifts-popup').mobiscroll().popup({
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
                    width: 550,
                    fullScreen: false,
                    touchUi: true,
                    showOverlay: false
                }
            }
        }).mobiscroll('getInst');         

        $allDay.on('change', function () {
            var checked = this.checked
   
            // change event date settings based on the allDay
            eventDate.setOptions({
                controls: checked ? ['date'] : ['datetime'],
                responsive: checked ? datePickerResponsive : datetimePickerResponsive
            });
    
            // update current event's allDay property
            tempMeal.allDay = checked;
        });

        eventDate = $('#recurring-event-date').mobiscroll().datepicker({
            controls: ['date'],
            select: 'range',
            startInput: '#recurring-event-start-input',
            endInput: '#recurring-event-end-input',
            dateFormat: 'DDD D MMM YYYY',
            showRangeLabels: false,
            touchUi: true,
            responsive: datePickerResponsive,              // More info about responsive: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-responsive
            onChange: function (args) {
                var date = args.value;
    
                // update event's start date
                tempMeal.start = date[0];
                tempMeal.end = date[1];
                
                updateOptionDates();
            }
        }).mobiscroll('getInst');

        $repeatType.change(function (ev) {
            updateContent(ev.target.value);
        }); 

       select = $repeat.mobiscroll().select({
            data: repeatData,                              // More info about data: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-data
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-responsive
            onChange: function (event, inst) {
                var d = new Date(tempMeal.start);
                var weekday = d.getDay();
                var monthday = d.getDate();
    
                // set recurring option
                switch (event.value) {
                    case 'daily':
                        tempMeal.recurring = {
                            repeat: 'daily'
                        };
                        break;
                    case 'weekly':
                        tempMeal.recurring = {
                            repeat: 'weekly',
                            weekDays: days[weekday].short  // More info about weekDays: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-weekDays
                        };
                        break;
                    case 'monthly':
                        tempMeal.recurring = {
                            repeat: 'monthly',
                            day: monthday
                        };
                        break;
                    case 'yearly':
                        tempMeal.recurring = {
                            repeat: 'yearly',
                            day: monthday,
                            month: d.getMonth() + 1
                        };
                        break;
                    case 'weekday':
                        tempMeal.recurring = {
                            repeat: 'weekly',
                            weekDays: 'MO,TU,WE,TH,FR'     // More info about weekDays: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-weekDays
                        };
                        break;
                    case 'custom':
                    case 'custom-value':
                        updateContent($('input[name=custom-repeat-type]:checked').val());
                        customDate.setVal(d);
                        $customRepeat.show();
                        break;
                    default:
                        tempMeal.recurring = null;
                }
    
                showHideCustom();
            }
        }).mobiscroll('getInst');

        monthSelect = $('#custom-repeat-month').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-responsive
            inputElement: document.getElementById('custom-repeat-month-input'),
            onChange: function (event, inst) {
                populateMonthDays(+event.value, yearDaySelect)
            }
        }).mobiscroll('getInst');

        monthDaySelect = $('#custom-repeat-month-day').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-responsive
            maxWidth: 80
        }).mobiscroll('getInst');
    
        yearDaySelect = $('#custom-repeat-year-day').mobiscroll().select({
            responsive: selectResponsive,                  // More info about responsive: https://docs.mobiscroll.com/5-14-1/eventcalendar#opt-responsive
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
            dateFormat: 'DD-MM-YYYY',                      // More info about dateFormat: https://docs.mobiscroll.com/5-14-1/eventcalendar#localization-dateFormat
            returnFormat: 'iso8601',
            onOpen: function () {
                $('input[name=custom-repeat-condition][value=until]').click();
            }
        }).mobiscroll('getInst');
    
        $until.on('click', function () {
            $('input[name=custom-repeat-condition][value=count]').click();
        });

        // Add color picker begin
        colorPicker = $('#demo-event-color').mobiscroll().popup({
            display: 'bottom',
            contentPadding: false,
            showArrow: false,
            showOverlay: false,
            buttons: [
                'cancel',
                {
                    text: 'Set',
                    keyCode: 'enter',
                    handler: function (ev) {
                        setSelectedColor();
                    },
                    cssClass: 'mbsc-popup-button-primary'
                }
            ],
            responsive: {
                medium: {
                    display: 'anchored',
                    anchor: $('#event-color-cont')[0],
                    buttons: [],
                }
            }
        }).mobiscroll('getInst');

        function selectColor(color, setColor) {
            $('.crud-color-c').removeClass('selected');
            $('.crud-color-c[data-value="' + color + '"]').addClass('selected');
            if (setColor) {
                $color.css('background', color || '');
            }
        }

        function setSelectedColor() {
            tempMeal.color = tempColor;
            $color.css('background', tempColor);
            colorPicker.close();
        }

        $('#event-color-picker').on('click', function () {
            selectColor(tempMeal.color || '');
            colorPicker.open();
        });


        $('.crud-color-c').on('click', function (ev) {
            var $elm = $(ev.currentTarget);

            tempColor = $elm.data('value');
            selectColor(tempColor);

            if (!colorPicker.s.buttons.length) {
                setSelectedColor();
            }
        });
        // Add color picker end        

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
            createEditPopup();
        });

        $tooltipViewEvent.on('click', function (ev) {
            window.location.href = "{{ url('/staff/') }}" + '/' +currentEvent.resource + '/view/account' ;
        });

        $deleteButton.on('click', function (ev) {  
            // remove from the db
            deleteMealAjax(function(data) {
                            
                calendar.removeEvent(oldMeal);           
                popup.close();

                mobiscroll.toast({
                    message: 'Appointment deleted'
                });
            }); 
        });

        $leaveDeleteBtn.on('click', function (ev) {  
            // remove from the db
            deleteMealAjax(function(data) {
                            
                calendar.removeEvent(oldMeal);           
                popup.close();

                mobiscroll.toast({
                    message: 'Leave deleted'
                });
            }); 
        });

        $tooltipDeleteEvent.on('click', function (ev) {           
            
            if(currentEvent.eventType === 'leave') {
                deleteLeaveAjax(function(data) {                            
                    calendar.removeEvent(currentEvent);
                    tooltip.close();
                    mobiscroll.toast({
                        message: 'Leave deleted'
                    });
                });
            } else {
                deleteMealAjax(function(data) {                            
                    calendar.removeEvent(currentEvent);
                    tooltip.close();
                    mobiscroll.toast({
                        message: 'Appointment deleted'
                    });
                });
            }
        });    

        $tooltipLeaveAcceptBtn.on('click', function (ev) {
            $.ajax({
                url: '{{ url("staff/leave/status")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'PATCH', 'status': 'accept' },
                success: function(data) {
                    getUserEventsAjax();
                }
            });
        });

        $tooltipLeaveRefuseBtn.on('click', function (ev) {
            $.ajax({
                url: '{{ url("staff/leave/status")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'PATCH', 'status': 'refuse' },
                success: function(data) {
                    getUserEventsAjax();
                }
            });
        });

        $tooltipLeavePendingBtn.on('click', function (ev) {
            $.ajax({
                url: '{{ url("staff/leave/status")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'PATCH', 'status': 'pending' },
                success: function(data) {
                    getUserEventsAjax();
                }
            });
        });

        function deleteMealAjax(cb) {
            $.ajax({
                url: '{{ route("schedule")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'DELETE'},
                success: function(data) {
                    getUserEventsAjax();
                    cb(data);
                }
            });
        } 

        function deleteLeaveAjax(cb) {
            $.ajax({
                url: '{{ route("leave")}}' + '/' + currentEvent.id,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'POST',
                data: {_method: 'DELETE'},
                success: function(data) {
                    getUserEventsAjax();
                    cb(data);
                }
            });
        } 

        function RGBToHex(rgb) {
          // Choose correct separator
          let sep = rgb.indexOf(",") > -1 ? "," : " ";
          // Turn "rgb(r,g,b)" into [r,g,b]
          rgb = rgb.substr(4).split(")")[0].split(sep);

          let r = (+rgb[0]).toString(16),
              g = (+rgb[1]).toString(16),
              b = (+rgb[2]).toString(16);

          if (r.length == 1)
            r = "0" + r;
          if (g.length == 1)
            g = "0" + g;
          if (b.length == 1)
            b = "0" + b;

          return "#" + r + g + b;
        }

        function timeConvert(n) {
            var num = n/60000; // convert to minutes
            var hours = (num / 60); // convert to hours
            var rhours = Math.floor(hours);
            var minutes = (hours - rhours) * 60;
            var rminutes = Math.round(minutes);
            return rhours + " hrs " + rminutes + " mins";
        }

        $('#print-schedule').on('click', function () {
            console.log('print')
            calendar.print();
        });

        $('#view-fullscreen').on('click', function(e) {
            var element = document.body; // getElementById('demo-event-listing');
            
            openFullscreen(element);
        });
    });

    function handleSearchStaffs (val) {
        var resources = {!!  json_encode($resource) !!};
        var filteredResources = resources.filter(staff => staff.name.toLowerCase().includes(val.toLowerCase()))
        calendar.setOptions({
            resources: filteredResources
        })
    }      

</script>
@include('users.schedule.include-common-script')
@endsection