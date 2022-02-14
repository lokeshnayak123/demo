<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{Auth::guard('admin')->user()->PicturePath}}" class="img-circle" alt="User Image" style="height: 35px;width: 35px;" />
            </div>
            <div class="pull-left info">
                <p>{{ucfirst(Auth::guard('admin')->user()->FullName)}} <a href="javascript:;"><i class="fa fa-circle text-success"></i></a></p>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">Navigation Menu</li>
            @can('backend.dashboard')
            <li class="{{ Request::is('admin/dashboard') ? 'active' : '' }}"><a href="{{route('backend.dashboard')}}"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
            @endcan
           
            @if(Auth::user()->hasAnyPermission(['borrowers.index','subadmin.index'],'admin'))
            <li class="{{ Request::is('admin/user*') ? 'active' : '' }}  treeview">
                <a href="javascript:;">
                    <i class="fa fa-users"></i> <span>{{trans('menu.sidebar.users.main')}}</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="{{ Request::is('admin/user*') ? 'active' : '' }}"><a href="{{route('users.index')}}" alt="User"><i class="fa fa-list"></i>User</a></li>
                </ul>
            </li>
            @endif

            <li class="{{ Request::is('admin/roles*') ? 'active' : '' }}  treeview">
                <a href="javascript:;">
                    <i class="fa fa-users"></i> <span>{{trans('menu.sidebar.role.manage')}}</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="{{ Request::is('admin/roles*') ? 'active' : '' }}"><a href="{{route('roles.index')}}" alt="User"><i class="fa fa-list"></i>Roles</a></li>
                </ul>
            </li>
            
            
            @if(\Module::collections()->has('Forms'))
                    @include('forms::basic.menu')
            @endif
             @if(\Module::collections()->has('FormFields'))
                    @include('formfields::basic.menu')
            @endif
            
        </ul>
    </section>
</aside>
<!-- Global model for ajax -->
<div class="modal fade" id="globalModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="modelContent">
            <!-- dynamic content goes here  -->
        </div>
    </div>
</div>
