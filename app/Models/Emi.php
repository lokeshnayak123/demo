<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Emi extends Model
{
	protected $table = "emi";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'loan_id','payment_date','monthly_emi','interest_paid','principal_paid','balance'
    ];

    public function loan()
    {
        return $this->belongsTo(Loan::class);
    }    
}
