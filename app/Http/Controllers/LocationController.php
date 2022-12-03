<?php

namespace App\Http\Controllers;

use App\Models\Conventioncodeape;
use App\Models\Conventioncollective;
use App\Models\Location;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class LocationController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function location() {
        $pageConfigs = ['pageHeader' => false];
        $user_id = Auth::id();
        $cuserName = "";
        if ($user_id > 0) {
            $getUser = User::where('id', $user_id)->get()->first();
            $cuserName = $getUser->name;
        }
        $locationData = $this->getLocationData();
        $shiftData = $this->getShiftDetails();
        //echo "<pre>";print_r($locationData);die;
        $conventioncollective = Conventioncollective::get();
        
        if (Auth::User()->role_id == 1){
            return view('/users/settings/locations', ['pageConfigs' => $pageConfigs, 'cusername' => $cuserName, 'conventioncollective' => $conventioncollective, 'locationData' => $locationData, 'shiftData' => $shiftData]);
          }
          else{
            return view('/errors/404');
          }      
    }

    public function collectivecode(Request $request) {
        $collectiveId = $request->get('id');
        $codedata = Conventioncodeape::where('convention_collective_id', $collectiveId)->get();
        $conventioncollective = Conventioncollective::where('id', $collectiveId)->get()->first();

        $data = [
            'status' => '1',
            'codedata' => $codedata,
            'conventioncollective' => $conventioncollective,
        ];
        return response()->json($data);
        //  return $codedata;
    }


    public function getAllLocation() {
        $getLocation = Location::get();
        //echo "<pre>";print_r($getLocation);die;
        return $getLocation;
    }

    public function getAllUser() {
        $getUser = User::get();
        //echo "<pre>";print_r($getUser);die;
        return $getUser;
    }

    public function getContractType() {
        $contractArr = array("CDD", "CDI", "Saisonnier", "Apprentissage", "Extra", "Interim", "Stagiaire");
        return $contractArr;
    }

    public function getQualifications() {
        $qualificationsArr = array("Bachelor", "Certificate", "Diploma", "Doctoral", "Dual Degree", "Master", "Post Diploma", "Post Graduate Diploma", "Preparatory", "Research");
        return $qualificationsArr;
    }

    public function getRoles() {
        $rolesArr = array("Subscriber", "Author", "Maintainer", "Editor", "Admin");
        return $rolesArr;
    }

    public function getPlans() {
        $plansArr = array("Basic", "Premium", "Exclusive");
        return $plansArr;
    }

    public function getStatusList() {
        $plansArr = array("Pending", "Active", "Inactive");
        return $plansArr;
    }

    public function getShifts() {
        //$shiftArr = array("Shift 1", "Shift 2", "Shift 3", "Shift 4");
        $shiftData = $this->getShiftDetails();
        foreach($shiftData as $data){
            $shiftArr[] = $data->name;
        }
        return $shiftArr;
    }
    public function getShiftDetails(){
        $user_id = Auth::id();
        $shiftArr = User::where('user_id', $user_id)->get();
        return $shiftArr;
    }


    public function location_listajax(Request $request) {
        $data = $this->getLocationData();
        //echo "<pre>";print_r($data);die;
        return ['data' => $data];
    }

    public function getLocationData() {

        $user = Auth::user();

        if ($user->role_id == 2){
            $data = Location::where('user_id', $user->user_id)->get();
            $staffData = User::where('user_id', $user->user_id)->get(['id', 'name', 'firstname', 'lastname'])->toArray();
        }else{
            $data = Location::where('user_id', Auth::id())->get();
            $staffData = User::where('user_id', Auth::id())->get(['id', 'name', 'firstname', 'lastname'])->toArray();
        }

//                echo "<pre>";print_r($data);die;

        $locationStaffArr = array();
        for ($g = 0; $g < count($staffData); $g++) {
            $words = explode(" ", $staffData[$g]['name']);
            $id = explode(" ", $staffData[$g]['id']);

            // Avatar change to profile_photo_path
            $userAvatar = User::where('id', '=', $id)->select('profile_photo_path')->get();

            $acronym = "";
            foreach ($words as $w) {
                $acronym .= $w[0];
            }

            $avatar = "";
            foreach ($userAvatar as $a){
                $avatar .= $a['profile_photo_path'];
            }

            $staffData[$g]['stfName'] = strtoupper($acronym);
            $staffData[$g]['avatar'] = $avatar;
            $locationStaffArr[$staffData[$g]['id']][] = $staffData[$g];
        }

//        echo "<pre>";print_r($locationStaffArr);die;
        foreach ($data as $key => $value) {
            $staffArr = array();

            if ($value['shift_id'] !== null){
                $staffId = explode(',', $value['shift_id']);

                foreach ($staffId as $staff){
                    $staffArr[] = User::where('id', $staff)->select(['id', 'name', 'firstname', 'lastname'])->first();
                }
            }


            $moreStaff = 0;
            if (isset($locationStaffArr[$data[$key]['id']])) {
                $totalStaff = count($locationStaffArr[$data[$key]['id']]);
                if ($totalStaff > 3) {
                    $moreStaff = ($totalStaff - 3);
                }
//                $staffArr = $locationStaffArr[$data[$key]['id']];
            }

            $data[$key]['staffArr'] = $staffArr;
            $data[$key]['moreStaff'] = $moreStaff;
            $value->responsive_id = null;
        }

        return $data;
    }

    public function getLocationDetails(Request $request) {

        $postData = $request->all();
        $locationId = $postData['locationId'];

        $locationdetails = Location::where('id', $locationId)->get()->first();
//        echo "<pre>";print_r($locationdetails);die;

        if ($locationdetails->user_id > 0) {
            $getUser = User::where('id', $locationdetails->user_id)->get()->toArray();
            //echo "<pre>";print_r($getUser);die;
            if(count($getUser) > 0){
                $locationdetails->cuserName = $getUser[0]['fullname'];
            }
            $locationdetails->cuserName = $locationdetails->name;
            $locationdetails->shift_id = explode(",",$locationdetails->shift_id);
        }
        $getShiftData = User::get()->toArray();

        $locationdetails['shiftData'] = $getShiftData;
        //echo "<pre>";print_r($locationdetails);die;
        return response()->json($locationdetails);
    }

    public function addUpdateLocation(Request $request) {

        $postData = $request->all()['locationDetailsArr'];

        $responseStatus = 0;
        $message = 'fail';
        $error = array();
        try {
            $postData = $request->all()['locationDetailsArr'];
            $locationId = $postData['locationId'];
            $eUpdate = 0;
            if ($locationId > 0) {
                $eUpdate = 1;
            }
            $error = $this->validateLocationDetails($postData, $eUpdate);
            if (count($error) > 0) {
                throw new Exception('Validation Error');
            }

            $this->addUpdateLocationDetails($locationId, $postData);

            //echo "<pre>";print_r($postData);die;
            $responseStatus = 1;
            $message = 'Success';
        } catch (Exception $e) {
            $message = $e->getMessage();
        }
        $jsonResponse = [
            'status' => $responseStatus,
            'message' => $message,
            'error' => $error,
        ];
        return response()->json($jsonResponse);
    }

    public function validateLocationDetails($postData, $eUpdate) {
        $error = array();
        if (empty(trim($postData['immatriculation'])) && empty($error)) {
            $error['errormessage'] = 'Please enter immatriculation';
        }
        if (empty(trim($postData['medicine'])) && empty($error)) {
            $error['errormessage'] = 'Please select occupational medicine';
        }
        if (empty(trim($postData['address'])) && empty($error)) {
            $error['errormessage'] = 'Please enter address';
        }
        if (empty(trim($postData['postcode'])) && empty($error)) {
            $error['errormessage'] = 'Please enter postcode';
        }
        if (empty(trim($postData['city'])) && empty($error)) {
            $error['errormessage'] = 'Please enter city';
        }
        if (empty(trim($postData['country'])) && empty($error)) {
            $error['errormessage'] = 'Please enter country';
        }
        if (empty(trim($postData['productivity'])) && empty($error)) {
            $error['errormessage'] = 'Please enter productivity';
        }
        if (empty(trim($postData['convention'])) && empty($error)) {
            $error['errormessage'] = 'Please select Convention';
        }

        return $error;
    }

    public function addUpdateLocationDetails($locationId, $postData) {

        if ($locationId > 0) {
            //echo "<pre>Edit Location==".$locationId."===<br>";print_r($postData);die;
        } else {
            //  echo "<pre>Add Location==".$locationId."===<br>";print_r($postData);die;
        }

        $immatriculation = $postData['immatriculation'];
        $medicine = $postData['medicine'];
        $address = $postData['address'];
        $postcode = $postData['postcode'];
        $city = $postData['city'];
        $country = $postData['country'];
        $productivity = $postData['productivity'];
        $conventioncollective_id = $postData['convention'];
        $code_ape_id = $postData['code_ape'];
        $name = $postData['companies_id'];
        $rules = $postData['rules'];
        $bonus = $postData['bonus'];

        $shift_ids = "";
        if(isset($postData['shift_ids']) && count($postData['shift_ids']) > 0){
            $shift_ids = implode(",",$postData['shift_ids']);
        }
        $user_id = Auth::id();
        $currentTime = date("Y-m-d h:i:s");

        if ($locationId > 0) {
            Location::where('id', $locationId)
                ->update([
                    'user_id' => $user_id,
                    'immatriculation' => $immatriculation,
                    'medicine_id' => $medicine,
                    'address' => $address,
                    'postcode' => $postcode,
                    'city' => $city,
                    'name' => $name,
                    'country' => $country,
                    'productivity' => $productivity,
                    'conventioncollective_id' => $conventioncollective_id,
                    'code_ape_id' => $code_ape_id,
                    'rules' => $rules,
                    'bonus' => $bonus,
                    'updated_at' => $currentTime,
                ]);
        } else {

            $locationId = Location::create([
                'user_id' => $user_id,
                'immatriculation' => $immatriculation,
                'medicine_id' => $medicine,
                'address' => $address,
                'postcode' => $postcode,
                'city' => $city,
                'name' => $name,
                'country' => $country,
                'productivity' => $productivity,
                'conventioncollective_id' => $conventioncollective_id,
                'code_ape_id' => $code_ape_id,
                'rules' => $rules,
                'bonus' => $bonus,
                'created_at' => $currentTime,
                'updated_at' => $currentTime
            ])->id;
        }


        return $locationId;
    }


    public function deleteLocation(Request $request) {
        $postData = $request->all();
        $locationId = $postData['locationId'];
        Location::where('id', $locationId)->delete();
        //echo "<pre>";print_r($staffId);die;
    }

    public function addUpdateShift(Request $request) {
        $postData = $request->all()['locationDetailsArr'];
        //echo "<pre>";print_r($postData);die;
        $user_id = Auth::id();
        $currentTime = date("Y-m-d h:i:s");
        if (isset($postData['shiftNameArr']) && count($postData['shiftNameArr']) > 0) {
            $shiftNameArr = $postData['shiftNameArr'];
            $startTimeArr = $postData['startTimeArr'];
            $endTimeArr = $postData['endTimeArr'];
            $shiftIdArr = $postData['shiftIdArr'];
            //Shift::where('location_id', $locationId)->delete();
            for ($g = 0; $g < count($shiftNameArr); $g++) {
                if (isset($shiftNameArr[$g]) && isset($startTimeArr[$g]) && isset($endTimeArr[$g])) {
                    $shiftName = $shiftNameArr[$g];
                    $startTime = $startTimeArr[$g];
                    $endTime = $endTimeArr[$g];
                    $shiftId = $shiftIdArr[$g];
                    if (!empty($shiftName) && !empty($startTime) && !empty($endTime)) {
                        if($shiftId > 0){
                            User::where('id', $shiftId)->update(['user_id' => $user_id,'name' => $shiftName,'start_time' => $startTime,'end_time' => $endTime,'updated_at' => $currentTime]);
                        }else{
                            $shiftId = User::create(['user_id' => $user_id,'name' => $shiftName,'start_time' => $startTime,'end_time' => $endTime,'created_at' => $currentTime,'updated_at' => $currentTime])->id;
                        }
                    }
                }
            }
        }
        if(isset($postData['deleteIds'])){
            $explodeId = explode(",",$postData['deleteIds']);
            User::whereIn('id', $explodeId)->delete();
        }
        $responseStatus = 1;
        $message = 'success';
        $error = array();
        $jsonResponse = [
            'status' => $responseStatus,
            'message' => $message,
            'error' => $error,
        ];
        return response()->json($jsonResponse);
    }


    public function activeDesactive(Request $request) {
        $postData = $request->all();
        $locationId = $postData['locationId'];

        $location = Location::where('id', $locationId)->select('status')->first();

        if ($location->status == 1){
            Location::where('id', $locationId)->update(['status' => 0]);
            return response()->json([
                'message' => 'Location is Desactive!',
            ]);
        }else if ($location->status == 0){
            Location::where('id', $locationId)->update(['status' => 1]);
            return response()->json([
                'message' => 'Location is Active!',
            ]);
        }

        //echo "<pre>";print_r($staffId);die;
    }

}
