<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Sport;
use App\Models\User;

class UserHasSport extends Model
{
    use HasFactory;
    protected $table = 'bsc_user_has_sports';
    protected $primaryKey='bsc_id';

    protected $fillable=['bsc_user_id','bsc_after_concession_amount','bsc_recurring_fee_type','bsc_recurring_fee','bsc_amount','bsc_sport_id','status','bsc_number_of_signup'];
    public function sport(){
        return $this->belongsTo(Sport::class,'bsc_sport_id');
    }
}
