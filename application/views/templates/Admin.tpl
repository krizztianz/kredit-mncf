<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->

        <link rel="icon" type="image/png" sizes="16x16" href="{!$base_url!}Assets/Admin/images/favicon.png">
        <title>MNC Finance</title>

        <!-- CSS Assets -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/font-awesome/css/fontawesome-all.css" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/simple-line-icons/css/simple-line-icons.css" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/weather-icons/css/weather-icons.min.css" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/themify-icons/themify-icons.css" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/flag-icon-css/flag-icon.min.css" />
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/icons/material-design-iconic-font/css/materialdesignicons.min.css" />

        <!-- Custom CSS -->
        <link href="{!$base_url!}Assets/Admin/dist/css/style.min.css" rel="stylesheet">
        <link rel="stylesheet" href="{!$base_url!}Assets/Admin/node_modules/sweetalert/sweetalert.css">

        {!block name=styles!}
        {!/block!}

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>

    <body class="skin-default fixed-layout">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">MFin</p>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">
                            <!-- Logo icon -->
                            <b>
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="{!$base_url!}Assets/Admin/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="{!$base_url!}Assets/Admin/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse">
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav mr-auto">
                            <li class="d-none d-md-block d-lg-block">
                                <a href="javascript:void(0)" class="p-l-15">
                                    <h3><strong>Landing Page Admin</strong></h3>
                                </a>
                            </li>
                        </ul>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav my-lg-0">
                            <!-- ============================================================== -->
                            <!-- Comment -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ti-email"></i>
                                    <div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown">
                                    <ul>
                                        <li>
                                            <div class="drop-title">Notifications</div>
                                        </li>
                                        <li>
                                            <div class="message-center">
                                                <!-- Message -->
                                                <a href="javascript:void(0)">
                                                    <div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>
                                                    <div class="mail-contnet">
                                                        <h5>Luanch Admin</h5> <span class="mail-desc">Just see the my new admin!</span> <span class="time">9:30 AM</span> </div>
                                                </a>
                                                <!-- Message -->
                                                <a href="javascript:void(0)">
                                                    <div class="btn btn-success btn-circle"><i class="ti-calendar"></i></div>
                                                    <div class="mail-contnet">
                                                        <h5>Event today</h5> <span class="mail-desc">Just a reminder that you have event</span> <span class="time">9:10 AM</span> </div>
                                                </a>
                                                <!-- Message -->
                                                <a href="javascript:void(0)">
                                                    <div class="btn btn-info btn-circle"><i class="ti-settings"></i></div>
                                                    <div class="mail-contnet">
                                                        <h5>Settings</h5> <span class="mail-desc">You can customize this template as you want</span> <span class="time">9:08 AM</span> </div>
                                                </a>
                                                <!-- Message -->
                                                <a href="javascript:void(0)">
                                                    <div class="btn btn-primary btn-circle"><i class="ti-user"></i></div>
                                                    <div class="mail-contnet">
                                                        <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="nav-link text-center link" href="javascript:void(0);"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- ============================================================== -->
                            <!-- End Comment -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- User Profile -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown u-pro">
                                <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{!$base_url!}Assets/Admin/images/users/1.jpg" alt="user" class=""> <span class="hidden-md-down">{!$User->username!} &nbsp;<i class="fa fa-angle-down"></i></span> </a>
                                <div class="dropdown-menu dropdown-menu-right animated flipInY">
                                    <!-- text-->
                                    <a href="javascript:void(0)" onclick="showChangePassword();" class="dropdown-item"><i class="ti-settings"></i> Ganti Password</a>
                                    <!-- text-->
                                    <div class="dropdown-divider"></div>
                                    <!-- text-->
                                    <a href="{!$site_url!}/account/logout" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                                    <!-- text-->
                                </div>
                            </li>
                            <!-- ============================================================== -->
                            <!-- End User Profile -->
                            <!-- ============================================================== -->
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <div class="side-mini-panel">
                <ul class="mini-nav">
                    <div class="togglediv"><a href="javascript:void(0)" id="togglebtn"><i class="ti-menu"></i></a></div>
                    <!-- .Dashboard -->
                    {!foreach $menu as $item!}
                    <li>
                        <a href="javascript:void(0)"><i class="{!$item->menu_icon!}"></i></a>
                        <div class="sidebarmenu">
                            <!-- Left navbar-header -->
                            <h3 class="menu-title">{!$item->menu_title!}</h3>
                            <div class="searchable-menu">
                                <form role="search" class="menu-search">
                                    <input type="text" placeholder="Search..." class="form-control">
                                    <a href=""><i class="fa fa-search"></i></a>
                                </form>
                            </div>

                            {!if count($item->childmenu) gt 0!}
                            <ul class="sidebar-menu">
                                {!foreach $item->childmenu->where("ISACTIVE", "1")->sortBy('queue')->values()->all() as $menuitem!}
                                <li><a href="{!$site_url!}{!$menuitem->menu_url!}">{!$menuitem->menu_title!}</a></li>
                                    {!/foreach!}
                            </ul>
                            {!/if!}

                            <!-- Left navbar-header end -->
                        </div>
                    </li>
                    {!/foreach!}
                    <!-- /.Dashboard -->
                </ul>
            </div>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->

                {!block name=content!}
                {!/block!}

                <!-- ============================================================== -->
                <!-- Change Password Modal -->
                <!-- ============================================================== -->
                <div class="modal fade" id="ChangePasswordModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Ganti Passowrd</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form method="post" action="{!$site_url!}Admin/PostChangePassword" id="changepass" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="title">Password Lama</label>
                                        <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Password Lama" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Password Baru</label>
                                        <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Password Baru" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Ulangi Password Baru</label>
                                        <input type="password" class="form-control" id="passwordconf" name="passwordconf" placeholder="Ulangi Password Baru" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Ganti Password</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Change Password Modal -->
                <!-- ============================================================== -->

                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                &copy; 2018-{!$smarty.now|date_format:'%Y'!} by MNC Finance
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->        

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="{!$base_url!}Assets/Admin/node_modules/jquery/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="{!$base_url!}Assets/Admin/node_modules/popper/popper.min.js"></script>
        <script src="{!$base_url!}Assets/Admin/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="{!$base_url!}Assets/Admin/dist/js/perfect-scrollbar.jquery.min.js"></script>
        <!--Wave Effects -->
        <script src="{!$base_url!}Assets/Admin/dist/js/waves.js"></script>
        <!--Menu sidebar -->
        <!-- <script src="{!$base_url!}Assets/Admin/dist/js/sidebarmenu.js"></script> -->
        <!--stickey kit -->
        <script src="{!$base_url!}Assets/Admin/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
        <script src="{!$base_url!}Assets/Admin/node_modules/sparkline/jquery.sparkline.min.js"></script>
        <!--Custom JavaScript -->
        <script src="{!$base_url!}Assets/Admin/dist/js/custom.min.js"></script>
        <script src="{!$base_url!}Assets/Admin/node_modules/sweetalert/sweetalert.min.js"></script>

        <script>
            function showChangePassword() {
                $('#ChangePasswordModal').on('hide.bs.modal', function (e) {
                    $("#oldpassword").val('');
                    $("#newpassword").val('');
                    $("#passwordconf").val('');
                });

                $("#ChangePasswordModal").modal("show");
            }
        </script>

        {!if $errType && $errMsg!}
        <script>
            Swal.fire({
                type: "{!$errType!}",
                text: "{!$errMsg!}"
            });
        </script>
        {!/if!}

        {!block name=scripts!}
        {!/block!}
    </body>

</html>