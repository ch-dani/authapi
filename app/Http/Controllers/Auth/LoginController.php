<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Socialite;
use App\Models\User;


class LoginController extends Controller
{
   public function login(Request $request)
    {
        $validator=Validator::make($request->all(),[
            "email"=>"required",
            "password"=>"required"
        ]);
        if($validator->fails()){
            return response()->json(["status"=>false,"errors"=>$validator->errors()->all()],403);
        }
        $credentials = $request->only('email', 'password');
        $user=User::where('email',$request->email)->first();
        if($user && Hash::check($request->password,$user->bsc_u_password)){
            $token = $user->createToken('authToken')->plainTextToken;
            return response()->json(['status'=>true,'user' => $user,'token'=>$token], 200);
        }else{
            return response()->json(['status'=>false,'message' => 'Unauthorized'], 401);
        }
    }


    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out'], 200);
    }

    public function socialLogin(Request $request)
    {
        $validator=Validator::make($request->all(),[
            "provider"=>"required|in:google,apple",
            "token"=>"required"
        ]);
        if($validator->fails()){
            return response()->json(["status"=>false,"errors"=>$validator->errors()->all()],403);
        }
        $provider=$request->provider;
        switch ($provider) {
            case 'google':
                
                try{
                    $socialUser = Socialite::driver('google')->stateless()->userFromToken($request->token);
                    $email=$socialUser->getEmail();
                    $name=$socialUser->getName();
                    if(User::where('email',$email)->exists()){
                        $user=User::where('email',$email)->first();
                    }else{
                        $user=new User;
                        $user->email=$email;
                        $user->bsc_u_username=$name;
                        $user->bsc_u_username=$name;
                        $user->save();
                    }
                    $user=User::find($user->bsc_u_id);
                    return response()->json(["status"=>true,"user"=>$user]);
                    return $user;
        
                    
                }catch(\Exception $e){
                    return response()->json(["status"=>false,"message"=>$e->getMessage()]);
                }
                break;
            case 'apple':
                try{
                    $socialUser = Socialite::driver('apple')->stateless()->userFromToken($request->token);
                    $email=$socialUser->getEmail();
                    $name=$socialUser->getName();
                    if(User::where('email',$email)->exists()){
                        $user=User::where('email',$email)->first();
                    }else{
                        $user=new User;
                        $user->email=$email;
                        $user->bsc_u_username=$name;
                        $user->bsc_u_username=$name;
                        $user->save();
                    }
                    return $user;
        
                    
                }catch(\Exception $e){
                    return response()->json(["status"=>false,"message"=>$e->getMessage()]);
                }
                break;
            
            default:
                return response()->json(["status"=>false,"message"=>'Something worst went wrong!']);
                break;
        }
       
      
    }

    public function social(){
        
        $url=Socialite::driver('google')->redirect();
        return $url;



    }
    public  function googleSocial(Request $request){
        $userSocial 	=   Socialite::driver('google')->stateless()->user();
        dd($userSocial);
        dd($request->all());
    }
}
