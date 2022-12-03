<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Storage;
use \Carbon\Carbon;

class ScheduleController extends Controller
{
    public function schedule(Request $request)
    {
        if (request()->method() == 'GET')
        {
            $events = $this->getUserSchedule();
            $pageConfigs = [
                'pageHeader' => false,
                'blankPage' => true,
            ];
            $staff_users = DB::table('users')->leftJoin('teams', 'teams.id', '=', 'users.current_team_id')->where('users.role_id', 2)->where('users.user_id', auth()->user()->id)->where('status', '=', 'active')->orderBy('users.id', 'asc')->select('users.*', 'teams.name as team_name')->get();
            $shifts = DB::table('shift')->where('user_id', auth()->user()->id)->orderBy('id', 'asc')->get();
            $locations = DB::table('location')->where('user_id', auth()->user()->id)->orderBy('id', 'asc')->get();
            $lunch = DB::table('lunch')->get();
            $resource = [];

            foreach ($staff_users as $key => $staff_user) {
                // code...
                $resource_index = null;

                $data = [
                            'id' => $staff_user->id,
                            'name' => empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname,
                            'color' => '#60e81a',
                            'title' => $staff_user->email,
                            'img' => asset('images/avatars/avatar.png'),
                            'current_team_id' => 0,
                        ];

                if (!empty($staff_user->current_team_id)) {
                    // code...
                    $data = [
                            'id' => $staff_user->current_team_id,
                            'name' => empty($staff_user->team_name) ? 'Team# ' . $staff_user->current_team_id : $staff_user->team_name,
                            'color' => '#60e81a',
                            'current_team_id' => $staff_user->current_team_id,
                        ];

                    if (!empty($resource)) {
                        // code...
                        foreach ($resource as $i => $res) {
                            if ($res['current_team_id'] == $staff_user->current_team_id) {
                                $data = $res;
                                $resource_index = $i;
                                break;
                            }
                        }
                    }

                    $data['children'][] = [
                        'id' => $staff_user->id,
                        'name' => empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname,
                        'color' => '#60e81a',
                        'title' => $staff_user->email,
                        'img' => asset('images/avatars/avatar.png'),
                    ];
                }

                if ($resource_index === null) {
                    // code...
                    $resource[] = $data;
                }
                else
                {
                    $resource[$resource_index] = $data;
                }
            }            

            $getTaskData = DB::table('todo')->where('user_id', auth()->user()->id)->orderby('id', 'ASC')->get();
            $leaveReasons = DB::table('leave_reasons')->get();
            $leave = $this->getUserLeave();

            return view('users/schedule/schedule', ['pageConfigs' => $pageConfigs, 'resource' => $resource, 'staff_users' => $staff_users, 'shifts' => $shifts, 'locations' => $locations, 'events' => $events, 'tasklist' => $getTaskData, 'lunch' => $lunch, 'leave_reasons' => $leaveReasons, 'leave' => $leave]);
        }

        $data['start'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->start)[0]))->format('Y-m-d H:i'));
        $data['end'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->end)[0]))->format('Y-m-d H:i'));
        $data['user_id'] = auth()->user()->id; // $request->resource;

        if($request->has('staff')) {
            $data['staff_id'] = $request->staff;
        }

        if($request->has('todo')) {
            $data['todo_id'] = $request->todo;
        }

        if($request->has('shift')) {
            $data['shift_id'] = $request->shift;
        }

        if($request->has('location')) {
            $data['location_id'] = $request->location;
        }

        if($request->has('pause')) {
            $data['pause'] = $request->pause;
        }

        if($request->has('lunch')) {
            $data['lunch'] = $request->lunch;
        }

        if($request->has('description')) {
            $data['description'] = $request->description;
        }

        if($request->has('color')) {
            $data['color'] = $request->color;
        }

        $data['days'] = $request->allDay;

        $eventExists = DB::table('schedule')
        ->where('start', '>=', $request['start'])
        ->where('end', '<=', $request['start'])->exists();

        if ($request->create && !$eventExists) {
            // code...
            $data['created_at'] = date("Y-m-d H:i:s", strtotime('now'));
            DB::table('schedule')->insert([$data]);
        }
        else
        {
            if ($request->id) {
                // code...
                $data['updated_at'] = date("Y-m-d H:i:s", strtotime('now'));
                DB::table('schedule')->where('id', $request->id)->update($data);
            }
        }

        $events = DB::table('schedule')->get()->toArray();
        return response()->json(['status' => 1, 'events' => $events]);
    }

    public function getUserSchedule()
    {
        $events = DB::table('schedule')->select('schedule.*', 'schedule.user_id as resource')->get();

        $events = $events->map(function($event) {
            $newEvent = $event;

            $newEvent->location_name = '';
            $newEvent->todo_title = '';

            if($event->staff_id) {
                $newEvent->resource = (int) $event->staff_id;
            }

            $shift = DB::table('shift')->select('name', 'start_time', 'end_time')->where('id', $event->shift_id)->first();

            if($shift) {
                $newEvent->title = $shift->name;
                $newEvent->shiftDetail = $shift;                    
            }
            
            $location = DB::table('location')->select('name')->where('id', $event->location_id)->first();

            if($location) {
                $newEvent->location_name = $location->name;
            }

            $todo = DB::table('todo')->select('title')->where('id', $event->todo_id)->first();

            if($todo) {
                $newEvent->todo_title = $todo->title;
            }    

            $lunch = DB::table('lunch')->select('name')->where('id', $event->lunch)->first();

            if($lunch) {
                $newEvent->lunch = $lunch->name;
            }

            $newEvent->eventType = 'schedule';

            $newEvent->editable = $this->isEditable($newEvent);

            return $newEvent;
        });

        return $events;
    }

    public function getUserLeave()
    {
        return DB::table('vacation')->get()->map(function($row) {
            $leaveRow = $row;

            $status = DB::table('status')->where('id', $leaveRow->status)->first();

            if($status) {
                $leaveRow->background =  $status->color;

                if($status->name === 'accept') {
                    $leaveRow->color = 'rgba(50,205,50,0.4)';
                } else if($status->name === 'pending') {
                    $leaveRow->color = 'rgba(255,165,0,0.4)';
                } else {
                    $leaveRow->color = 'rgba(255,0,0,0.4)';
                }

                $leaveRow->status_name = $status->name;
            }

            if($leaveRow->staff_id) {
                $leaveRow->resource = (int) $leaveRow->staff_id;
            }

            $reason = DB::table('leave_reasons')->find($row->reason);

            if($reason) {
                $leaveRow->title = $reason->name;                    
            }

            $leaveRow->eventType = 'leave';

            $leaveRow->editable = $this->isEditable($leaveRow);

            return $leaveRow;
        });
    }

    public function getUserEventsAjax()
    {
        $events = $this->getUserSchedule();
        $leave = $this->getUserLeave();
        
        return response()->json([
            'data' => [
                'schedule' => $events->toArray(),
                'leave' => $leave->toArray()
            ]
        ]);
    }

    public function deleteSchedule($id)
    {
        DB::table('schedule')->where('id', $id)->delete();

        return response()->json(['status' => 1]);
    }

    public function leave(Request $request)
    {
        if (request()->method() == 'GET')
        {
            $events = DB::table('vacation')->select('leave.*', 'leave.user_id as resource')->get()->toArray();
            $pageConfigs = ['pageHeader' => false];

            $staff_users = DB::table('users')->where('role_id', 2)->where('user_id', auth()->user()->id)->take(10)->orderBy('id', 'asc')->get();

            $resource = [];

            foreach ($staff_users as $key => $staff_user) {
                // code...
                $resource[] = [
                    'id' => $staff_user->id,
                    'name' => empty($staff_user->firstname) ? 'Staff# ' . $staff_user->id : $staff_user->firstname,
                    'color' => '#60e81a',
                    'title' => $staff_user->email,
                    'img' => asset('images/avatars/avatar.png'),
                ];
            }           

            return view('users/schedule/leave', ['pageConfigs' => $pageConfigs, 'resource' => $resource, 'events' => json_encode($events), 'staff_users' => $staff_users]);
        }

        $data['start'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->start)[0]))->format('Y-m-d H:i'));
        $data['end'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->end)[0]))->format('Y-m-d H:i'));
        // $data['title'] = $request->title;
        $data['user_id'] =  auth()->user()->id;
        $data['staff_id'] = $request->resource;
        // $data['calories'] = $request->calories;
        $data['allDay'] = 0;
        $data['description'] = $request->description;

        $role = DB::table('roles')->where('id', auth()->user()->role_id)->first();

        if($role->name === 'users') {
            $status = DB::table('status')->where('name', 'accept')->first();

            $data['status'] = $status->id;
        } else if($role->name === 'staff') {
            $status = DB::table('status')->where('name', 'pending')->first();

            $data['status'] = $status->id;
        } else {

        }

        if($request->has('reason')) {
            $data['reason'] = $request->reason;
        }

        if ($request->allDay && $request->allDay !== 'false') {
            // code...
            $data['allDay'] = 1;
        }

        if ($request->create && $request->create == 1) {
            // code...
            DB::table('vacation')->insert([$data]);
        }
        elseif ($request->create && $request->create == 2) {
            // code...
            if ($request->id) {
                // code...
                DB::table('vacation')->where('id', $request->id)->delete();
            }
        }
        else
        {
            if ($request->id) {
                // code...
                DB::table('vacation')->where('id', $request->id)->update($data);
            }
        }

        $events = DB::table('vacation')->get()->toArray();
        return response()->json(['status' => 1, 'events' => $events]);
    }

    public function deleteLeave($id)
    {
        DB::table('vacation')->where('id', $id)->delete();

        return response()->json(['status' => 1]);
    }

    public function staffLeave(Request $request)
    {
        if (request()->method() == 'GET')
        {
            $events = DB::table('staff_leave')->get()->toArray();
            $pageConfigs = ['pageHeader' => false];
            return view('/staff/leave', ['pageConfigs' => $pageConfigs, 'events' => json_encode($events)]);
        }

        $data['start'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->start)[0]))->format('Y-m-d H:i'));
        $data['end'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->end)[0]))->format('Y-m-d H:i'));
        $data['user_id'] =  auth()->user()->id;
        $data['staff_id'] = auth()->user()->id;
        $data['allDay'] = 0;
        $data['description'] = $request->description;

        $status = DB::table('status')->where('name', 'pending')->first();

        $data['status'] = $status->id;

        if($request->has('reason')) {
            $data['reason'] = $request->reason;
        }

        if ($request->allDay && $request->allDay !== 'false') {
            // code...
            $data['allDay'] = 1;
        }

        if ($request->create && $request->create == 1) {
            // code...
            DB::table('vacation')->insert([$data]);
        }
        elseif ($request->create && $request->create == 2) {
            // code...
            if ($request->id) {
                // code...
                DB::table('vacation')->where('id', $request->id)->delete();
            }
        }
        else
        {
            if ($request->id) {
                // code...
                DB::table('vacation')->where('id', $request->id)->update($data);
            }
        }

        $events = DB::table('staff_leave')->get()->toArray();
        return response()->json(['status' => 1, 'events' => $events]);
    }

    public function getStaffSchedule()
    {
        $events = DB::table('schedule')->where('staff_id', auth()->user()->id)->get();

        $events = $events->map(function($event) {
            $newEvent = $event;

            $newEvent->location_name = '';
            $newEvent->todo_title = '';

            $shift = DB::table('shift')->select('name', 'start_time', 'end_time')->where('id', $event->shift_id)->first();

            if($shift) {
                $newEvent->title = $shift->name;
                $newEvent->shiftDetail = $shift;                    
            }
            
            $location = DB::table('location')->select('name')->where('id', $event->location_id)->first();

            if($location) {
                $newEvent->location_name = $location->name;
            }

            $todo = DB::table('todo')->select('title')->where('id', $event->todo_id)->first();

            if($todo) {
                $newEvent->todo_title = $todo->title;
            }    

            $lunch = DB::table('lunch')->select('name')->where('id', $event->lunch)->first();

            if($lunch) {
                $newEvent->lunch = $lunch->name;
            }

            $newEvent->eventType = 'schedule';

            $newEvent->editable = $this->isEditable($newEvent);

            return $newEvent;
        });

        return $events;
    }

    public function getStaffLeave()
    {
        $leave = DB::table('vacation')->where('staff_id', auth()->user()->id)->get();

        $leave = $leave->map(function($row) {
            $leaveRow = $row;

            $leaveRow->title = 'Leave';

            $status = DB::table('status')->where('id', $leaveRow->status)->first();

            if($status) {
                $leaveRow->background =  $status->color;

                if($status->name === 'accept') {
                    $leaveRow->color = 'rgba(50,205,50,0.4)';
                } else if($status->name === 'pending') {
                    $leaveRow->color = 'rgba(255,165,0,0.4)';
                } else {
                    $leaveRow->color = 'rgba(255,0,0,0.4)';
                }
            }

            $reason = DB::table('leave_reasons')->find($row->reason);

            if($reason) {
                $leaveRow->title = $reason->name;                    
            }

            $leaveRow->eventType = 'leave';

            $leaveRow->editable = $this->isEditable($leaveRow);

            return $leaveRow;
        });

        return $leave;
    }

    public function staffSchedule(Request $request)
    {

        if (request()->method() == 'GET')
        {
            $events = $this->getStaffSchedule();

            $leave = $this->getStaffLeave();

            $leaveReasons = DB::table('leave_reasons')->get();

            $pageConfigs = ['pageHeader' => false];
            return view('/staff/staff-schedule', ['pageConfigs' => $pageConfigs,  'events' => $events, 'leave' => $leave, 'leave_reasons' => $leaveReasons]);
        }

        $data['start'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->start)[0]))->format('Y-m-d H:i'));
        $data['end'] = str_replace(' ', 'T', Carbon::parse(trim(explode('GMT', $request->end)[0]))->format('Y-m-d H:i'));
        $data['title'] = $request->title;
        $data['allDay'] = 0;
        $data['color'] = '#cc6599';
        $data['user_id'] = auth()->user()->id;

        if ($request->allDay && $request->allDay !== 'false') {
            // code...
            $data['allDay'] = 1;
        }

        if ($request->create) {
            // code...
            DB::table('staff_schedule')->insert([$data]);
        }
        else
        {
            if ($request->id) {
                // code...
                DB::table('staff_schedule')->where('id', $request->id)->update($data);
            }
        }

        $events = DB::table('staff_schedule')->get()->toArray();
        return response()->json(['status' => 1, 'events' => $events]);
    }


    public function getStaffEventsAjax()
    {
        $events = $this->getStaffSchedule();
        $leave = $this->getStaffLeave();
        
        return response()->json([
            'data' => [
                'schedule' => $events->toArray(),
                'leave' => $leave->toArray()
            ]
        ]);
    }

    public function updateStaffLeaveStatus(Request $request, $id)
    {
        $statusName = $request->status;

        $query = DB::table('status')->where('name', $statusName);
        $status = $query->first();

        if($query->exists()) {
            $leave = DB::table('vacation')->where('id', $id)->update(['status' => $status->id]);

            return response()->json(['message' => 'Leave updated']);
        }

        return response()->json(['message' => 'Leave status update failed']);
    }

    public function deleteStaffLeave($id)
    {
        DB::table('vacation')->where('id', $id)->delete();

        return response()->json(['status' => 1]);
    }

    public function isEditable($event)
    {
        $startDate = Carbon::parse($event->start);
        $now = Carbon::now();

        return $startDate->gt($now);
    }
}