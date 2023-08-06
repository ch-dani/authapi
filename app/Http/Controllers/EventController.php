<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\EventHasTeam;
use App\Models\Team;
use App\Models\Sport;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EventController extends Controller
{
    public function getAllEvents(){
        $events=Event::get();
        return response()->json(["status"=>true,"events"=>$events]);
    }

    public function getEvent($id=null){
        if($event=Event::find($id)){
            return response()->json(["status"=>true,"event"=>$event]);
        }
        return response()->json(["status"=>false,"message"=>"Invalid id"]);

    }

    public function getEventTeam($id){
        $ids=EventHasTeam::where('bsc_eht_event_id',$id)->pluck('bsc_eht_team_id')->toArray();
        if($ids){
            $teams=Team::whereIn('bsc_team_id',$ids)->get();
            return response()->json(["status"=>true,"teams"=>$teams]);
        }
        return response()->json(["status"=>false,"message"=>"Data Not Found"],404);
    }

    public function getAllSports(){
        $sports=Sport::get();
        return response()->json(["status"=>true,"sports"=>$sports]);
    }

    public function getSport($id=null){
        if($sports=Sport::where('bsc_sport_id',$id)->first()){
            return response()->json(["status"=>true,"sports"=>$sports]);
        }
        return response()->json(["status"=>false],404);
    }

    public function getMySports(){
        $user= auth()->user();
        return Auth::guard('api')->user;
    }

    public function addSportInCart($id){
        $validator=Validator::make(['id'=>$id],[
            "id"=>"exists:bsc_sport,bsc_sport_id",
        ]);
        if($validator->fails()){
            return response()->json(["status"=>false,"errors"=>$validator->errors()->all()],403);
        }
        
        

    }
}
