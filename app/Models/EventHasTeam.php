<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventHasTeam extends Model
{
    use HasFactory;
    protected $table='bsc_event_has_team';
    protected $primaryKey='bsc_eht_id';
    
}
