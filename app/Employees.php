<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employees extends Model
{
    // protected $table = 'employees';
    protected $fillable = [
        'name', 'skills', 'address',
    ];
    // protected $id = 'p_id';
}
