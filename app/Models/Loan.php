<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
	protected $table = "loans";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id','loan_amount','loan_term_in_week','rate_of_interest','start_date'
    ];

    public function emis()
    {
        return $this->hasMany(Emi::class);
    }
}
