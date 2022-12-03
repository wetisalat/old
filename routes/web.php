<?php

use Illuminate\Routing\RouteUri;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\TodoController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\LeaveController;
use App\Http\Controllers\ShiftController;
use App\Http\Controllers\ExtraController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\TwoFAController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\PresenceController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\StaterkitController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\AllowanceController;
use App\Http\Controllers\ExpensesController;
use App\Http\Controllers\PayrollController;
use App\Http\Controllers\AnalyseController;
use App\Http\Controllers\Admin\PlanController as StripePlan;

/*
|--------------------------------------------------------------------------
| Login Routes
|--------------------------------------------------------------------------
*/
Route::get('/', [HomeController::class, 'index'])->name('redirects')->middleware('twofactor');
//Route::get('home', [StaterkitController::class, 'home'])->middleware('auth');

Route::middleware(['auth:sanctum', 'verified', 'twofactor'])->get('/dashboard', [HomeController::class, 'index'])->name('dashboard');

Route::get('redirects', [HomeController::class, 'index'])->name('redirects.index')->middleware('twofactor');
Route::get('2fa', [TwoFAController::class, 'index'])->name('2fa.index')->middleware('auth:sanctum');
Route::post('2fa', [TwoFAController::class, 'store'])->name('2fa.post')->middleware('auth:sanctum');
Route::get('2fa/reset', [TwoFAController::class, 'resend'])->name('2fa.resend')->middleware('auth:sanctum');

Route::post('register_newuser', [RegisterController::class, 'register'])->name('ajax.register');



/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
// Route::middleware('can:admin')->group(function () {
Route::middleware('twofactor')->group(function () {
    Route::group(['prefix' => 'admin'], function () {
        Route::get('/', [AdminController::class, 'index']);
        Route::get('customerslist', [AdminController::class, 'customerslist'])->name('staff-customers');
        //    Route::get('customers/view', [AdminController::class, 'customers_account'])->name('customers-account');
        Route::get('customers/query', [AdminController::class, 'customers_query'])->name('customers-query');
        Route::get('customers/{id}/view/account', [AdminController::class, 'customers_account'])->name('customers-account');
        Route::get('customers/{id}/security', [AdminController::class, 'customers_security'])->name('customers-security');
        Route::get('customers/{id}/billing', [AdminController::class, 'customers_billing'])->name('customers-billing');
        Route::post('register-user', [AdminController::class, 'register_user'])->name('register-user');
        Route::post('users/edit/{id}', [AdminController::class, 'user_update'])->name('update-user');
        Route::post('/admin/customers/delete', [AdminController::class, 'customers_delete'])->name('delete-user');
        Route::get('query/plans', [StripePlan::class, 'query_plans'])->name('plans-query');
        Route::get('{id}/delete/plans', [StripePlan::class, 'delete_plans'])->name('plans-delete');

        Route::get('coupon/query', [AdminController::class, 'coupon_query'])->name('coupon-query');
        Route::get('{id}/delete/coupons', [CouponController::class, 'delete_coupons'])->name('coupons-delete');

        Route::get('query/subscriptions', [AdminController::class, 'query_subscriptions'])->name('subscriptions-query');
        Route::get('{id}/delete/subscriptions', [SubscriptionsController::class, 'delete_subscriptions'])->name('subscriptions-delete');
        Route::get('query/subscriptions-cancel', [AdminController::class, 'query_cancel_subscriptions'])->name('cancel-subscriptions-query');

        Route::get('settings', [AdminController::class, 'settings_account'])->name('admin-settings-account');
        Route::get('security', [AdminController::class, 'settings_security'])->name('admin-settings-security');
        Route::get('leave', [AdminController::class, 'admin_leave'])->name('admin-leave');
        Route::get('leave/{id}', [AdminController::class, 'admin_leave_single'])->name('admin-leave-single');
        Route::post('leave', [AdminController::class, 'admin_leave_save'])->name('admin-leave-store');
        Route::delete('leave/{id}', [AdminController::class, 'admin_leave_delete'])->name('admin-leave-delete');
        
        Route::get('customers', [AdminController::class, 'customers'])->name('customers');
        Route::resource('/plans', StripePlan::class);
        Route::resource('coupons', CouponController::class);
        Route::get('subscriptions', [AdminController::class, 'subscriptions'])->name('subscriptions');
        Route::get('subscriptions-cancel', [AdminController::class, 'subscriptions_cancel'])->name('subscriptions-cancel');
        Route::get('lunch', [AdminController::class, 'admin_lunch'])->name('admin-lunch');
        Route::get('lunch/{id}', [AdminController::class, 'admin_lunch_single'])->name('admin-lunch-single');
        Route::post('lunch', [AdminController::class, 'admin_lunch_save'])->name('admin-lunch-store');
        Route::delete('lunch/{id}', [AdminController::class, 'admin_lunch_delete'])->name('admin-lunch-delete');
    });
});

/*
|--------------------------------------------------------------------------
| Routes for all users (Admin; User and Staff)
|--------------------------------------------------------------------------
*/
Route::group(['prefix' => 'settings', 'middelware' => 'auth'], function () {
    Route::get('/', [SettingsController::class, 'settings_account'])->name('settings-account');
    Route::get('security', [SettingsController::class, 'settings_security'])->name('settings-security');
    Route::get('theme-mode', [SettingsController::class, 'themeMode'])->name('settings-theme-mode');

    Route::post('/leave', [LeaveController::class, 'store'])->name('store');
});    



/*
|--------------------------------------------------------------------------
| Users Routes
|--------------------------------------------------------------------------
*/
// Route::middleware('can:user')->group(function () {
Route::middleware('twofactor')->group(function () {
    Route::group(['prefix' => 'settings', 'middelware' => 'auth'], function () {    
            Route::get('billing', [SettingsController::class, 'settings_billing'])->name('settings-billing');
            Route::get('billing/{id}/delete', [SettingsController::class, 'settings_billing_delete'])->name('settings-billing-delete');
            Route::post('billing/add', [SettingsController::class, 'settings_billing_add'])->name('settings-billing-add');
            Route::get('notifications', [SettingsController::class, 'settings_notifications'])->name('setings-notifications');

            // Settings Shift
            Route::get('shift', [SettingsController::class, 'settings_shift'])->name('settings-shift');
            Route::get('/shift', [ShiftController::class, 'index']);
            Route::post('/add-shift', [ShiftController::class, 'store']);
            Route::post('/update-shift', [ShiftController::class, 'update']);
            Route::get('/shift/edit/{id}', [ShiftController::class, 'edit']);
            Route::get('/shift/delete_staff/{id}', [ShiftController::class, 'destroy']);

            // Location Controller
            Route::get('location', [SettingsController::class, 'settings_locations'])->name('settings-locations');
            Route::get('/location', [LocationController::class, 'location'])->name('location');
            Route::get('/location/listajax', [LocationController::class, 'location_listajax'])->name('location-listajax');
            Route::any('/location/getlocationdetails', [LocationController::class, 'getLocationDetails']);
            Route::any('/location/add_update_location', [LocationController::class, 'addUpdateLocation']);
            Route::any('/location/delete_location', [LocationController::class, 'deleteLocation']);
            Route::any('/shift/add_update_shift', [LocationController::class, 'addUpdateShift']);
            Route::any('/collectivecode', [LocationController::class, 'collectivecode']);
            Route::any('/active_desactive', [LocationController::class, 'activeDesactive']);

            // Settings Allowance
            Route::get('allowance', [AllowanceController::class, 'settings_allowance'])->name('settings-allowance');;
            Route::post('/store-allowance', [AllowanceController::class, 'storeAllowance'])->name('store_allowance');
            Route::post('/delete-allowance', [AllowanceController::class, 'deleteAllowance'])->name('delete_allowance');
            Route::post('/store-vacation', [AllowanceController::class, 'storeVacation'])->name('store_vacation');

            // Settings Extra
            Route::get('extra', [SettingsController::class, 'settings_extra'])->name('settings-extra');
            Route::get('/extra', [ExtraController::class, 'index']);
            Route::post('/add-extra', [ExtraController::class, 'store']);
            Route::post('/update-extra', [ExtraController::class, 'update']);
            Route::get('/extra/edit/{id}', [ExtraController::class, 'edit']);
            Route::get('/extra/delete/{id}', [ExtraController::class, 'destroy']);
    });

    Route::get('invoice', [InvoiceController::class, 'index'])->name('invoice');
    Route::get('invoice/preview', [InvoiceController::class, 'invoice_preview'])->name('invoice-preview');
    Route::get('invoice/print', [InvoiceController::class, 'invoice_print'])->name('invoice-print');
    Route::get('swap-plan', [SubscriptionController::class, 'swapPlan'])->name('swapplan');
    Route::post('cancel', [SubscriptionController::class, 'cancel'])->name('cancel');
    Route::post('card', [SubscriptionController::class, 'newPaymentMethod'])->name('newcard');
    Route::post('delete', [SubscriptionController::class, 'delete'])->name('delete');
    Route::post('resume', [SubscriptionController::class, 'resume'])->name('resume');

    Route::get('expenses', [ExpensesController::class, 'expenses'])->name('expenses');
    Route::post('add-expenses', [ExpensesController::class, 'add_expenses'])->name('add-expenses');
    Route::get('query/expenses', [ExpensesController::class, 'query_expenses'])->name('expenses-query');
    Route::post('expenses/delete', [ExpensesController::class, 'expenses_delete'])->name('expenses-delete');
    Route::get('expenses/download/{id}', [ExpensesController::class, 'expenses_download'])->name('expenses-download');
    Route::any('expenses/statistics', [ExpensesController::class, 'getStatistics'])->name('expenses-statistics');
    Route::any('expenses/status/{id}', [ExpensesController::class, 'updateStaffStatus'])->name('staff-expenses-status');

    Route::get('attendance', [AttendanceController::class, 'users_side'])->name('attendance');

    Route::any('schedule', [ScheduleController::class, 'schedule'])->name('schedule');
    Route::any('leave', [ScheduleController::class, 'leave'])->name('leave');
    Route::any('request', [RequestController::class, 'index'])->name('request');
    Route::any('request/statistics', [RequestController::class, 'getStatistics'])->name('leaveStatistics');
    Route::delete('schedule/{id}', [ScheduleController::class, 'deleteSchedule'])->name('deleteSchedule');
    Route::delete('leave/{id}', [ScheduleController::class, 'deleteLeave'])->name('deleteLeave');
    Route::get('user-events', [ScheduleController::class, 'getUserEventsAjax'])->name('user-events');
    Route::any('presence', [PresenceController::class, 'presence'])->name('presence');

    Route::any('payroll', [PayrollController::class, 'index'])->name('payroll');

    Route::any('analyse', [AnalyseController::class, 'index'])->name('analyse');
});


/*
|--------------------------------------------------------------------------
| Users and Staffs Routes
|--------------------------------------------------------------------------
*/

// Route::middleware('can:user','can:staff')->group(function () {
Route::middleware('twofactor')->group(function () {
    // Todo
    Route::get('todo/{status?}', [TodoController::class, 'index'])->name('todo');
    Route::any('gettaskdetails', [TodoController::class, 'getTaskDetails'])->name('gettaskdetails');
    Route::any('add_task', [TodoController::class, 'addTask'])->name('add_task');
    Route::any('updatetaskstatus', [TodoController::class, 'updateTaskStatus'])->name('updatetaskstatus');

    // Staff
    Route::group(['prefix' => 'staff'], function () {
        Route::get('/', [StaffController::class, 'list'])->name('staff-list');
        Route::post('adduser', [StaffController::class, 'adduser'])->name('staff-adduser');
        Route::get('datauserlist', [StaffController::class, 'datauserlist'])->name('staff-datauserlist');

        //Route::get('view/account', [StaffController::class, 'view_account'])->name('staff-view-account');
        Route::get('{id}/view/account', [StaffController::class, 'view_account'])->name('staff-view-account');
        Route::post('view/add/account', [StaffController::class, 'add_account'])->name('staff-add-account');

        Route::post('view/emergency/contact', [StaffController::class, 'emergency_contact'])->name('emergency-contact');
        Route::post('view/add/bank', [StaffController::class, 'bank_information'])->name('bank-information');

        Route::post('suspen/account', [StaffController::class, 'suspen_account'])->name('staff-suspent-account');

        Route::get('{id}/view/salary', [StaffController::class, 'view_salary'])->name('staff-view-salary');
        Route::post('view/add/salary', [StaffController::class, 'add_asalary'])->name('staff-add-salary');

        Route::get('{id}/view/documents', [StaffController::class, 'view_documents'])->name('staff-view-documents');
        Route::post('view/add/documents', [StaffController::class, 'add_documents'])->name('staff-add-documents');
        Route::get('{id}/query/documents', [StaffController::class, 'query_documents'])->name('staff-query-documents');

        Route::get('{id}/view/connections', [StaffController::class, 'view_connections'])->name('staff-view-connections');
        Route::get('{id}/view/notifications', [StaffController::class, 'view_notifications'])->name('staff-view-notifications');
    });
});


/*
|--------------------------------------------------------------------------
| Staff Routes
|--------------------------------------------------------------------------
*/
// Route::middleware('can:staff')->group(function () {
Route::middleware('twofactor')->group(function () {
    Route::group(['prefix' => 'staff'], function () {
        Route::any('schedule', [ScheduleController::class, 'staffSchedule'])->name('staff-schedule');
        Route::any('leave', [ScheduleController::class, 'staffLeave'])->name('staff-leave');
        Route::delete('leave/{id}', [ScheduleController::class, 'deleteStaffLeave'])->name('delete-staff-leave');
        Route::any('leave/status/{id}', [ScheduleController::class, 'updateStaffLeaveStatus'])->name('staff-leave-status');
        Route::get('events', [ScheduleController::class, 'getStaffEventsAjax'])->name('staff-events');
        Route::post('total-hours', [HomeController::class, 'getStaffTotalHours'])->name('staff-hours');
        Route::post('overview', [HomeController::class, 'getStaffOverview'])->name('staff-overview');
        Route::get('daily-data', [HomeController::class, 'getStaffDailyData'])->name('staff-daily-data');

        Route::get('attendance/{id?}', [AttendanceController::class, 'staff_side'])->name('staff-attendance');
        Route::post('attendance', [AttendanceController::class, 'staff_side_save'])->name('staff-attendance-save');
        
        Route::get('attendanceList', [AttendanceController::class, 'attendanceAjax'])->name('attendance_ajax');
        Route::any('attendance/status/{id}', [AttendanceController::class, 'attendanceStatus'])->name('attendance-status');
        Route::any('attendance/statistics', [AttendanceController::class, 'attendanceStatistics'])->name('attendance-statistics');
        Route::post('attendance-summary', [AttendanceController::class, 'staff_side_attendance_summary'])->name('staff-attendance-summary');
        Route::any('csv-file', [AttendanceController::class, 'csvFileUpload'])->name('csv-file');
        
        Route::get('expenses', [ExpensesController::class, 'staff_expenses'])->name('staff-expenses');
        Route::get('expenses/edit/{id}', [ExpensesController::class, 'expenses_edit'])->name('expenses-edit');
    });
});



/*
|--------------------------------------------------------------------------
| Other Routes
|--------------------------------------------------------------------------
*/
// locale Route
Route::get('lang/{locale}', [LanguageController::class, 'swap']);



/*
|--------------------------------------------------------------------------
| Routes for test
|--------------------------------------------------------------------------
*/
Route::get('table1', [TestController::class, 'table1'])->name('table1');
Route::get('table2', [TestController::class, 'table2'])->name('table2');
Route::get('table3', [TestController::class, 'table3'])->name('table3');
Route::get('test', [TestController::class, 'test']);
Route::get('test2', [TestController::class, 'test2']);
Route::get('map', [TestController::class, 'map'])->name('map');
Route::get('export', [TestController::class, 'export'])->name('export');

Route::get('t', function () {
    return currentTeam()->paymentMethods();
});

Route::get('layouts/collapsed-menu', [StaterkitController::class, 'collapsed_menu'])->name('collapsed-menu');
Route::get('layouts/full', [StaterkitController::class, 'layout_full'])->name('layout-full');
Route::get('layouts/without-menu', [StaterkitController::class, 'without_menu'])->name('without-menu');
Route::get('layouts/empty', [StaterkitController::class, 'layout_empty'])->name('layout-empty');
Route::get('layouts/blank', [StaterkitController::class, 'layout_blank'])->name('layout-blank');












