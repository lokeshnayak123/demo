@extends('admin.layouts.master')
@section('title', " ".trans('menu.sidebar.users.user.main')." ".trans('menu.pipe')." " .app_name(). " ".trans('menu.pipe').trans('menu.admin'))
@section('content')
<section class="content-header">
    <h1><i class="{{trans('users::menu.font_icon')}} "></i>
        {{trans('menu.sidebar.users.user.main')}}
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{route('backend.dashboard')}}">{{trans('menu.sidebar.dashboard')}}</a></li>
        <li class="active">>@lang('users::menu.sidebar.users')</li>
    </ol>
</section>
<section class="content">
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">@lang('users::menu.sidebar.users')</h3>
            <br><br>
            {!! Form::open(['route' => 'users.index','method' => 'GET']) !!}
            <div class="row">
                <div class='col-md-2'>
                    <div class="form-group">
                          {{ Form::text('name',@$_GET['name'], ['class'=>'form-control','placeholder'=>trans('users::menu.sidebar.form.search_by_name')]) }}
                    </div>
                </div>
                <div class='col-md-2'>
                  <div class="form-group">
                      <div class='input-group'>
                          {{ Form::text('email',@$_GET['email'], ['class'=>'form-control','placeholder'=>trans('users::menu.sidebar.form.email')]) }}
                      </div>
                  </div>
                </div>
                
                 <div class='col-md-2'>
                    <button type="submit" class="btn btn-success btn-flat pull-right btn-edit-booking-save" title="@lang('users::menu.sidebar.form.search')">
                        <i class="fa fa-search"></i> {{ trans('users::menu.sidebar.form.search') }}
                    </button>
                </div>
            </div>
            {!! Form::close() !!}
        </div>
        <div class="box-body">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>@sortablelink('name', trans('users::menu.sidebar.form.name'))</th>
                        <th>@sortablelink('email',trans('users::menu.sidebar.form.email'))</th>
                        <th>@lang('users::menu.sidebar.form.reg_date')</th>
                        <th>@lang('users::menu.sidebar.form.role')</th>
                        <th>@lang('users::menu.sidebar.form.status')</th>
                        <th>@lang('users::menu.sidebar.form.action')</th>
                    </tr>
                </thead>
                <tbody>
                    @if(count($users)>0)
                        @php $i=0; @endphp
                        @foreach($users as $user)
                         @php $i++; @endphp
                        <tr>
                            <td>{{ $user->fullName }}</td>
                            <td><a href="mailto:{{ $user->email }}" class="tooltips" data-original-title="Send Email">{{ $user->email }}</a></td>
                            <td>{{ $user->created_at->format('d/m/y') }}</td>
                            <td>
                              @if(!empty($user->getRoleNames()))
                                @foreach($user->getRoleNames() as $v)
                                   <label class="badge badge-success">{{ $v }}</label>
                                @endforeach
                              @endif
                            </td>
                            <td>
                                @if($user->status == 1)
                                <span class="label label-success">@lang('users::menu.sidebar.form.active')</span>
                                @else
                                <span class="label label-danger">@lang('users::menu.sidebar.form.inactive')</span>
                                @endif
                            </td>
                            <td class="">
                                <a href="{{route('users.show',$user->slug)}}" class="bookingAction" data-toggle="tooltip" data-placement="top" title="View Details">
                                  <i class="fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                        @endforeach
                    @else
                        <tr><td colspan="9" align="center">@lang('menu.no_record_found')</td></tr>
                    @endif
                </tbody>
            </table>
            <div class="pull-right">
            {{ $users->appends($_GET)->links() }}
            </div>
        </div>
    </div>
</section>
@endsection
