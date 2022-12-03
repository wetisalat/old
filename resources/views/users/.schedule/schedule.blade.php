@extends('layouts/contentLayoutMaster')

@section('title', 'Schedule')

@section('vendor-style')
{{-- vendor css files --}}
<link rel="stylesheet" href="{{ asset('vendors/css/mobiscroll/mobiscroll.jquery.min.css') }}">
<link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="save-event-url" content="{{ route('schedule') }}">
<style type="text/css">

    .md-meal-type {
        font-size: 14px;
        font-weight: 600;
        opacity: .6;
    }

    .md-meal-planner-popup .mbsc-popup .mbsc-popup-header {
        padding-top: 8px;
        padding-bottom: 8px;
    }

    .md-meal-planner-cont {
        position: relative;
        padding-left: 34px;
        text-align: left;
    }

    .md-meal-planner-title {
        font-size: 20px;
    }

    .md-meal-planner-kcal {
        color: #929292;
    }

    .md-meal-planner-icon {
        position: absolute;
        left: 0;
    }

    .md-meal-planner-calendar.mbsc-calendar .mbsc-schedule-event-all-day-inner {
        height: 40px;
        display: flex;
        align-items: center;
    }

    .md-meal-planner-calendar .md-meal-planner-event-title {
        font-size: 12px;
    }

    .md-meal-planner-calendar .md-meal-planner-event-desc {
        opacity: .6;
    }

    .md-meal-planner-popup .mbsc-segmented-item:first-child .mbsc-selected.mbsc-material,
    .md-meal-planner-popup .mbsc-segmented-item:first-child .mbsc-selected.mbsc-windows,
    .md-meal-planner-popup .mbsc-segmented-item:first-child .mbsc-segmented-selectbox-inner {
        background: #f08786;
    }

    .md-meal-planner-popup .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-material,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(2) .mbsc-selected.mbsc-windows,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(2) .mbsc-segmented-selectbox-inner {
        background: #8abe89;
    }

    .md-meal-planner-popup .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-material,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(3) .mbsc-selected.mbsc-windows,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(3) .mbsc-segmented-selectbox-inner {
        background: #99d3ef;
    }

    .md-meal-planner-popup .mbsc-segmented-item:nth-child(4) .mbsc-selected.mbsc-material,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(4) .mbsc-selected.mbsc-windows,
    .md-meal-planner-popup .mbsc-segmented-item:nth-child(4) .mbsc-segmented-selectbox-inner {
        background: #f0ce8e;
    }

    .md-meal-planner-popup .mbsc-segmented-item:last-child .mbsc-selected.mbsc-material,
    .md-meal-planner-popup .mbsc-segmented-item:last-child .mbsc-selected.mbsc-windows,
    .md-meal-planner-popup .mbsc-segmented-item:last-child .mbsc-segmented-selectbox-inner {
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
        height: 52px;
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
        left: 0.25em;
        position: absolute;
        right: 0.25em;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 500;
        color: #000;
        border-radius: 0.25em;
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
                        <div id="meal-planner-popup" class="md-meal-planner-popup add-event-pop-form">
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
                                        <input mbsc-input id="my-input" data-dropdown="true" />
                                    </label>
                                    <select id="single-select" multiple>
                                        @if(!$staff_users->isEmpty())
                                            @foreach($staff_users as $staff_user)
                                                <option value="{{ $staff_user->id }}">{{ empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname . ' ' . $staff_user->lastname }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <div class="mbsc-grid mbsc-form-grid">
                                        <div class="mbsc-row">
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Shift
                                                    <input mbsc-input id="my-shift" data-dropdown="true" />
                                                </label>
                                                <select id="multiple-my-shift" multiple>
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
                                                <select id="multiple-my-location" multiple>
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
                                <div class="custom-inline-days recurring-event-checkbox-cont recurring-event-cont-ex recurring-event-cont-weekly-ex" style="display: block;">
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="su" name="Sunday" checked="" id="mbsc-control-16"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right mbsc-checked"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Sun
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="mo" name="Monday" id="mbsc-control-17"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Mon
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="tu" name="Tuesday" id="mbsc-control-18"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Tue
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="we" name="Wednesday" id="mbsc-control-19"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Wed
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="th" name="Thursday" id="mbsc-control-20"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Thu
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="fr" name="Friday" id="mbsc-control-21"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Fri
                                    </span></label>
                                    <label class="mbsc-checkbox mbsc-form-control-wrapper mbsc-font  mbsc-ios mbsc-ltr mbsc-checkbox-right"><input mbsc-checkbox="" class="mbsc-form-control-input mbsc-reset weekdays-ex" data-theme-variant="light" data-theme="ios" type="checkbox" value="su" name="Saturday" id="mbsc-control-22"><span class="mbsc-checkbox-box mbsc-ios mbsc-checkbox-box-right"></span><span class="mbsc-form-control-label mbsc-ios">
                                        Sat
                                    </span></label>
                                </div>
                                <div class="mbsc-form-group">
                                    <!-- <div class="mbsc-grid mbsc-form-grid">
                                        <div class="mbsc-row">
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    One color
                                                    <input mbsc-input id="single-color-selection" placeholder="Please Select..." />
                                                </label>
                                            </div>
                                            <div class="mbsc-col-sm-12 mbsc-col-md-6">
                                                <label>
                                                    Todo
                                                    <input mbsc-input id="todo-input" data-dropdown="true" />
                                                </label>
                                                <select id="todo-single-select" multiple>
                                                    @if(!$staff_users->isEmpty())
                                                        @foreach($staff_users as $staff_user)
                                                            <option value="{{ $staff_user->id }}">{{ empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname . ' ' . $staff_user->lastname }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="mbsc-grid mbsc-form-grid">
                                        <div class="mbsc-row">                                          
                                            <div class="mbsc-col-12">
                                                <label>
                                                    Todo
                                                    <input mbsc-input id="todo-input" data-dropdown="true" />
                                                </label>
                                                <!-- <select id="todo-single-select" multiple>
                                                    @if(!$staff_users->isEmpty())
                                                        @foreach($staff_users as $staff_user)
                                                            <option value="{{ $staff_user->id }}">{{ empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname . ' ' . $staff_user->lastname }}</option>
                                                        @endforeach
                                                    @endif
                                                </select> -->
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
                                    <div class="mbsc-grid mbsc-form-grid">
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
                                                    Lunch
                                                    <input mbsc-input id="lunch-input" data-dropdown="true" />
                                                </label>
                                                <select id="lunch-single-select">
                                                <option value="indemnite_repas">Indemnité repas</option>
                                                <option value="avantage_en_nature">Avantage en nature</option>
                                                <option value="titre_restaurant">Titre restaurant</option>
                                                <option value="prime_de_panier">Prime de panier</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <label>
                                        Description
                                        <textarea mbsc-textarea id="meal-notes-textarea"></textarea>
                                    </label>
                                    <div class="mbsc-grid mbsc-form-grid">
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
                                    <select id="staff-leave-single-select" multiple>
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
                            </div>
                            <div class="mbsc-button-group">
                                <button class="mbsc-button-block" id="meal-delete" mbsc-button data-color="danger" data-variant="outline">Delete Event</button>
                            </div>                                                   
                        </div> 
                         <!-- Custom Tooltip Begin -->
                         <div id="custom-event-tooltip-popup" class="md-tooltip">
                            <div id="tooltip-event-header" class="md-tooltip-header">
                                <span id="tooltip-event-name-age" class="md-tooltip-name-age"></span>
                                <span id="tooltip-event-time" class="md-tooltip-time"></span>
                            </div>
                            <div class="md-tooltip-info">
                                <div class="md-tooltip-title">
                                    Status: <span id="tooltip-event-title" class="md-tooltip-status md-tooltip-text"></span>                                    
                                </div>
                                <div class="md-tooltip-title">Name: <span id="tooltip-event-name" class="md-tooltip-name md-tooltip-text"></span></div>
                                <div class="md-tooltip-title">Email: <span id="tooltip-event-email" class="md-tooltip-email md-tooltip-text"></span></div>                                
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
    var theme = "{{ isset($themeMode) ? ($themeMode->status == 1 ? 'dark' : 'light') : 'light' }}";
    mobiscroll.setOptions({
        locale: mobiscroll.localeEn,
        theme: 'ios',
        themeVariant: theme,
        locale: mobiscroll.locale['{{ $lang }}'],
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
        
        var timer;        
        var $tooltip = $('#custom-event-tooltip-popup');
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
        var $hoverDeleteBtn = $('#tooltip-event-delete')

        var $allDay = $('#event-all-day');
        var range;
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

        var slots = [{
            id: 1,
            name: 'Morning',
        }, {
            id: 2,
            name: 'Afternoon',
        }];

        var resources = {!!  json_encode($resource) !!};
        console.log(resources)
        console.log({!! $events !!})


        calendar = $('#demo-event-listing').mobiscroll().eventcalendar({
            view: {
                timeline: {
                    type: 'week',
                    eventList: true,
                    startDay: 1,
                    endDay: 7,
                }
            },
            // slots: slots,
            colors: [
                {
                    background: 'rgba(239, 239, 239, 0.75)', recurring: { repeat: 'weekly', weekDays: 'SA, SU' }
                }
            ],
            data: {!! $events !!},
            resources: resources,
            showEventTooltip: false,
            // clickToCreate: true,
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
                        '<div class="md-custom-event-time">' + formatDate('hh:mm', new Date(`${new Date().toDateString()} ${data.start}`)) + ' - ' + formatDate('hh:mm', new Date(`${new Date().toDateString()} ${data.end}`)) + '</div>' +
                        '</div></div>';
            },
            /***************** Edit Event Functions Begin *********************/
            onEventClick: function (args) {                
                oldEvent = $.extend({}, args.event);
                tempEvent = args.event;
                
                currentEvent = args.event;

                if (!popup.isVisible()) {
                    createEditPopup(args);
                }
            },
            /***************** Edit Event Functions End *********************/            
            onEventUpdated: function (event, inst) {
                createOrUpdateEvent(event.event);
            },
            onEventCreated: function (args, inst) {
                tempMeal = args.event;
                addMealPopup();
            },            
            onEventHoverIn: function (args, inst) {
                console.log("hover event")
                var event = args.event;
                var resource = resources.find(function (rs) { return rs.id === event.resource });
                var time = formatDate('hh:mm A', new Date(event.start)) + ' - ' + formatDate('hh:mm A', new Date(event.end));
                var button = {};

                currentEvent = event;

                if (event.confirmed) {
                    button.text = 'Cancel appointment';
                    button.type = 'warning';
                } else {
                    button.text = 'Confirm appointment';
                    button.type = 'success';
                }

                $header.css('background-color', resource.color);
                $data.text(event.title);
                $time.text(time);

                $status.text(event.confirmed ? 'Confirmed' : 'Canceled');
                $eventName.text(resource.name);
                $eventEmail.text(resource.title);               

                // clearTimeout(timer);
                // timer = null;

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

        popup = $('#meal-planner-popup').mobiscroll().popup({
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

        $('#single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-input'),
            touchUi: true
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

        $('#todo-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('todo-input'),
            touchUi: true
        });

        $('#lunch-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('lunch-input'),
            touchUi: true
        });

        $('#pause-single-select').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('pause-input'),
            touchUi: true
        });

        $('#multiple-my-shift').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-shift'),
            touchUi: true
        });

        $('#multiple-my-location').mobiscroll().select({
            display: 'center',
            inputElement: document.getElementById('my-location'),
            touchUi: true
        });

        // $('#single-color-selection').mobiscroll('getInst').color({
        //     select: 'multi',
        //     data: ['#fff568', '#ffc400', '#ff9800', '#ff6e40', '#f4511e', '#ff5252', '#e53935', '#e57373', '#f48fb1', '#9575cd', '#ba68c8', '#8c9eff', '#90caf9', '#64b5f6', '#d4e157', '#afb42b', '#9ccc65', '#bcaaa4', '#a1887f', '#a67c52', '#cfd8dc', '#90a4ae', '#78909c']
        // });

        $('#break-input').mobiscroll().datepicker({
            controls: ['calendar'],
            select: 'range',
            touchUi: true
        });
        // $('#break-input').mobiscroll().timespan({
        //     theme: 'mobiscroll',
        //     themeVariant: 'dark',
        //     display: 'bubble',
        //     touchUi: false
        // });

        // $('.start-and-end').mobiscroll().datepicker({
        //     controls: ['date'],
        //     touchUi: true
        // });

    
        $('.event-listing-view-change').change(function (ev) {
            switch (ev.target.value) {
                case 'day':                    
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'week',
                                eventList: true,
                                startDay: 1,
                                endDay: 7,                               
                            }
                        },
                        slots: slots
                    });
                    $('.mbsc-timeline-header-date').css('height', 'auto')
                    break;
                case 'week':
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'week',
                                eventList: true,
                                startDay: 1,
                                endDay: 7,                               
                            }
                        },
                        slots: []
                    })
                    $('.mbsc-timeline-header-date').css('height', '100%')
                    break;
                case 'month':
                    calendar.setOptions({
                        view: {                      // More info about view: https://docs.mobiscroll.com/5-11-1/eventcalendar#opt-view
                            timeline: {
                                type: 'month',
                                eventList: true
                            }
                        },
                        slots: []
                    })
                    $('.mbsc-timeline-header-date').css('height', '100%')
                    break;
            }
        });

        $('body').on('change', '.change-view', function (e) {

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
            onChange: function (args) {
                var date = args.value;

                // update event's start date
                tempEvent.start = date[0];
                tempEvent.end = date[1];
            }
        }).mobiscroll('getInst');

        /*************** All day End *****************/
        

        function addMealPopup() {
            // hide delete button inside add popup
            $deleteButton.hide();
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

            $('.meal-planner-type').each(function (i, elm) {
                $(elm).mobiscroll('getInst').checked = + elm.value == tempMeal.resource;
            });

            /********** Leave modal All day Begin ***********/
            $allDay.mobiscroll('getInst').checked = tempEvent.allDay;
            range.setVal([tempEvent.start, tempEvent.end]);
            range.setOptions({
                controls: tempEvent.allDay ? ['date'] : ['datetime'],
                responsive: tempEvent.allDay ? datePickerResponsive : datetimePickerResponsive
            });
            /********** Leave modal All day End ***********/

            selectColor('', true);
            popup.open();
        } 

        /********* Edit Popup Begin *********/
        function createEditPopup(args) {
            var ev = args.event;
            console.log(ev)
            // show delete button inside edit popup
            $deleteButton.show();

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
                            calendar.updateEvent({
                                id: ev.id,
                                title: 'New event',
                                // description: $description.val(),
                                allDay: $allDay.mobiscroll('getInst').checked,
                                start: ev.start,
                                end: ev.end,
                                // free: $statusFree.mobiscroll('getInst').checked,
                                color: $color.val(),
                                resource: ev.resource,
                                user_id: ev.user_id
                            });

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
            range.setVal([ev.start, ev.end]);
            selectColor(ev.color, true);
           
            range.setOptions({
                controls: ev.allDay ? ['date'] : ['datetime'],
                responsive: ev.allDay ? datePickerResponsive : datetimePickerResponsive
            });

            popup.setOptions({ anchor: args.domEvent.currentTarget });
            popup.open();
        }
        /********* Edit Popup End *********/
       

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
            tempEvent.color = tempColor;
            $color.css('background', tempColor);
            colorPicker.close();
        }

        $('#event-color-picker').on('click', function () {
            selectColor(tempEvent.color || '');
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
            width: 350
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

        $deleteButton.on('click', function (ev) {           
            calendar.removeEvent(currentEvent);           
            popup.close();
            mobiscroll.toast({
                message: 'Appointment deleted'
            });
        });

        $hoverDeleteBtn.on('click', function (ev) {           
            calendar.removeEvent(currentEvent);
            tooltip.close();
            mobiscroll.toast({
                message: 'Appointment deleted'
            });
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
