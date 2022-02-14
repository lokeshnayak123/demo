@extends('admin.layouts.master')
@section('title', " ".trans('users::menu.sidebar.form.user_details')." ".trans('menu.pipe')." " .app_name(). " ".trans('menu.pipe').trans('menu.admin'))
@section('content')
    <section class="content-header">
      <h1>@lang('users::menu.sidebar.form.user_profile')</h1>
      <ol class="breadcrumb">
        <li><a href="{{route('backend.dashboard')}}"><i class="fa fa-dashboard"></i> {{trans('menu.sidebar.dashboard')}}</a></li> 
        @if($user->getRoleNames())
        <li><a href="{{route('users.index')}}">{{ucfirst($user->getRoleNames()[0])}}</a></li>
        @endif
        <li class="active">@lang('users::menu.sidebar.form.user_profile')</li>
        <li class="active">{{ucfirst($user->fullName)}}</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <div class="box box-primary">
            <div class="box-body box-profile">
            <img class="profile-user-img img-responsive img-circle" src="{{$user->ThumbPicturePath}}" alt="User profile picture" id="dash_PImage" onerror="imgError(this);">
              <span class="upload-icon"> <i class="fa fa-camera"></i>
              <input type="file" id="PImage" name="PImage" accept="image/*" class="onlyimageupload" data-userid="{{$user->id}}" data-uploadurl="{{route('users.uploadProfile')}}">
              </span>
              <h3 class="profile-username text-center">{{ucfirst($user->fullName)}}</h3>
              <p class="text-muted text-center">
              @if(!empty($user->getRoleNames()))
                @foreach($user->getRoleNames() as $v)
                    <label class="badge badge-success"> {{ ucfirst($v) }}</label>
                @endforeach
              @endif
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#userDetails" data-toggle="tab">@lang('users::menu.sidebar.form.user_details')</a></li>
              <!-- <li><a href="#formFeedback" data-toggle="tab">Dynamic Form Feedback</a></li> -->
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="userDetails">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.name'):</label>
                    <div class="col-sm-9 paddt7">
                       {{ucfirst($user->fullName)}}
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.email'):</label>
                     <div class="col-sm-9 paddt7">
                       {{$user->email}}
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="inputCountry" class="col-sm-3 control-label"> @lang('users::menu.sidebar.form.status'):</label>
                      <div class="col-sm-9 paddt7">
                       @if($user->status==1)
                          <span class="label label-success">Active</span>
                       @else
                          <span class="label label-danger">InActive</span>
                       @endif
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="inputCountry" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.email_verify'):</label>
                      <div class="col-sm-9 paddt7">
                       @if($user->email_verified_at)
                          <span class="label label-success">Verified</span>
                       @else
                          <span class="label label-danger">Not Verified</span>
                       @endif
                      </div>
                  </div>
                  <div class="form-group">
                    <label for="inputCountry" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.date_of_join'):</label>
                    <div class="col-sm-9 paddt7">
                       {{$user->created_at->format('d/m/y')}}
                    </div>
                  </div> 
                  <div class="form-group">
                    <label for="inputCountry" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.last_login'):</label>
                    <div class="col-sm-9 paddt7">
                      @if($user->last_login_at)
                       {{$user->last_login_at->format('d/m/y')}}
                       @else
                        @lang('users::menu.sidebar.form.not_login_yet')
                       @endif
                    </div>
                  </div> 
                  <div class="form-group">
                    <label for="inputCountry" class="col-sm-3 control-label">@lang('users::menu.sidebar.form.login_ip'):</label>
                    <div class="col-sm-9 paddt7">
                      @if($user->last_login_ip)
                         {{$user->last_login_ip}}
                       @else
                          N/A
                       @endif
                    </div>
                  </div> 
                </form>
              </div>
              <div class="tab-pane" id="formFeedback">
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
@endsection
