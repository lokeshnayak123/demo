<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Cviebrock\EloquentSluggable\Sluggable;
use Spatie\Permission\Traits\HasRoles;
use Kyslik\ColumnSortable\Sortable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;
    use Sluggable;
    use HasRoles;
    use Sortable;

    public static $guard_name = "admin";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'slug','username','name', 'email','phone', 'password','image','status','last_login_at','last_login_ip'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public $sortable = ['id','name','email','created_at'];

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'name',
                'onUpdate'=>false
            ],
            'username' => [
                'source' => 'name',
                'onUpdate'=>false
            ],
        ];
    }

    
    /**
     * The function return the full picture path by setter attributes.
     * 
     * @param array $slug 
     */
    public function getPicturePathAttribute()
    {
        return ($this->image && $this->image != 'noimage.jpg') ? \URL::to('storage/app/public/users/'.$this->image) : \URL::to('img/nouser.jpg');
    } 

     /**
     * The function return the full picture path for thumb by setter attributes.
     * 
     * @param array $slug 
     */
    public function getThumbPicturePathAttribute()
    {
        return ($this->image && $this->image != 'noimage.jpg') ? \URL::to('storage/users/thumbnail/'.$this->image) : \URL::to('img/nouser.jpg');
    }

    public function getFullNameAttribute()
    {
        return ucfirst($this->name);
    }

    public function getJWTIdentifier() {
        return $this->getKey();
    }

    public function getJWTCustomClaims() {
        return [];
    }   

}
