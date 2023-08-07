<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\EventHasTeam;
use App\Models\Team;
use App\Models\Sport;
use App\Models\UserHasSport;
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

   

    public function addSportInCart($id){
        $validator=Validator::make(['id'=>$id],[
            "id"=>"exists:bsc_sport,bsc_sport_id",
        ]);
        if($validator->fails()){
            return response()->json(["status"=>false,"errors"=>$validator->errors()->all()],403);
        }

        $user= auth()->user();
        $count=count($user->cartSports);
        if($count >= 5){
            return response()->json(["status"=>false,"message"=>"You have reached the maximum limit"]);
        }
        $sport=Sport::find($id);
        $charges=$this->getUserSportFinalPrice($sport,$count+1);
        if(!UserHasSport::where('bsc_user_id',$user->bsc_u_id)->where('bsc_sport_id',$id)->exists()){
            $sport=UserHasSport::create([
                'bsc_user_id'=>$user->bsc_u_id,
                'bsc_sport_id'=>$id,
                'bsc_amount'=>$sport->bsc_sport_signup_fee,
                'bsc_after_concession_amount'=>$charges,
                'bsc_number_of_signup'=>$count+1,
                'bsc_recurring_fee'=>$sport->bsc_sport_recurring_fee,
                'bsc_recurring_type'=>$sport->bsc_sport_recurring_fee_type,
                'status'=>'cart',
            ]);
            $msg='Sport has been added to cart';
        }else{
            $msg='This sport is already in your cart';
        }
        return response()->json(["status"=>true,"message"=>$msg]);

    }

    public function getMySports(){
        $user= auth()->user();
        $pivots=UserHasSport::where('bsc_user_id',$user->bsc_u_id)->where('status','subscribed')->get();
        $data=[];
        foreach ($pivots as $key => $value) {
            $temp=$value->sport->toArray();
            $data[]=$temp;
        }
        
        return response()->json(["status"=>true,"count"=>count($data),"data"=>$data]);
    }

    public function getMyCart(){
        $user= auth()->user();
        $pivots=UserHasSport::where('bsc_user_id',$user->bsc_u_id)->where('status','cart')->get();
        $count=count($pivots);
        if($count>0){
            $data=[];
            foreach ($pivots as $key => $value) {
                $temp=$value->sport->toArray();
                $temp['cart_price_to_be_charged']=$value->bsc_after_concession_amount;
                $data[]=$temp;
            }
           
            return response()->json(["status"=>true,"count"=>$count,"data"=>$data]);
        }else{
            return response()->json(["status"=>true,"count"=>$count,"message"=>"Cart is empty"]);
        }
    }

    public function getMySportCheckout(){
        $user= auth()->user();
        $pivots=UserHasSport::where('bsc_user_id',$user->bsc_u_id)->where('status','cart')->get();
        $count=count($pivots);
        if($count>0){
            $data=[];
            foreach ($pivots as $key => $value) {
                $temp=$value->sport->toArray();
                $temp['cart_price_to_be_charged']=$value->bsc_after_concession_amount;
                $data[]=$temp;
            }
            $grand_total=$pivots->sum('bsc_after_concession_amount');
            return response()->json(["status"=>true,"count"=>$count,"grand_total"=>$grand_total,"data"=>$data]);
        }else{
            return response()->json(["status"=>true,"count"=>$count,"message"=>"Cart is empty"]);
        }
    }

    public function removeFromCart($id){
        $user= auth()->user();
        if($cart=UserHasSport::where('bsc_user_id',$user->bsc_u_id)->where('bsc_sport_id',$id)->where('status','cart')->first()){
            $cart->delete();
            return response()->json(["status"=>true,"message"=>"Sport deleted from cart"]);
        }else{
            return response()->json(["status"=>false,"message"=>"This sport is not added in your cart"]);
        }
    }

    public function getUserSportFinalPrice($sport,$count){
        $fee=$sport->bsc_sport_signup_fee;
        if($count==1){
            return $fee;
        }elseif($count==2){
            $discType=$sport->bsc_sport_second_discount_type;
            $amount=$sport->bsc_sport_second_discount;
        }elseif($count==3){
            $discType=$sport->bsc_sport_third_discount_type;
            $amount=$sport->bsc_sport_third_discount;
        }elseif($count==4){
            $discType=$sport->bsc_sport_fourth_discount_type;
            $amount=$sport->bsc_sport_fourth_discount;
        }elseif($count==5){
            $discType=$sport->bsc_sport_fifth_discount_type;
            $amount=$sport->bsc_sport_fifth_discount;
        }
        if($discType=='Percentage'){
            $percentValue=($amount/100)*$fee;
            return $fee-$percentValue;
        }else{
            return $fee-$amount;
        }
    }

   
}
