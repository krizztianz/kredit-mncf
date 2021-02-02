<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{!$setting->sitename!}</title>

        <!-- Bootstrap -->
        <link href="{!$base_url!}Assets/Front/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap -->
        <link href="{!$base_url!}Assets/Front/css/animate.css" rel="stylesheet">

        <!-- Google Font Lato -->
        <link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{!$base_url!}Assets/Front/css/font-awesome.min.css">

        <!-- Plugin Styles -->
        <link href="{!$base_url!}Assets/Front/css/datepicker.css" rel="stylesheet">


        <!-- Main Styles -->
        <link href="{!$base_url!}Assets/Front/css/styles.css" rel="stylesheet">
        <!-- Available main styles: styles-red.css, styles-green.css -->

        <link rel="stylesheet" href="{!$base_url!}Assets/Front/sweetalert/dist/sweetalert.css">

        <style>
            form .website_hp {
                display: none;
            }
        </style>

        {!block name=styles!}
        {!/block!}

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <link href="css/ie8fix.css" rel="stylesheet">
          <link href='http://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
          <link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>
          <link href='http://fonts.googleapis.com/css?family=Lato:900' rel='stylesheet' type='text/css'>
          <![endif]-->


        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{!$base_url!}Assets/Front/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{!$base_url!}Assets/Front/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{!$base_url!}Assets/Front/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="{!$base_url!}Assets/Front/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="{!$base_url!}Assets/Front/img/ico/favicon.png">

    </head>
    <body id="top" data-spy="scroll" data-target=".navbar" data-offset="260">

        <!-- Header start -->
        <header data-spy="affix" data-offset-top="39" data-offset-bottom="0" class="large">

            <div class="row container box">
                <div class="col-md-5">
                    <!-- Logo start -->
                    <div class="brand">
                        <h1><a class="scroll-to" href="{!$base_url!}#top"><img class="img-responsive" src="{!$base_url!}{!$setting->sitelogo!}" alt="MNC Finance"></a></h1>
                    </div>
                    <!-- Logo end -->
                </div>

                <div class="col-md-7">
                    <div class="pull-right">
                        <div class="header-info pull-right">
			&nbsp;
                            {!* <div class="contact pull-left">CONTACT: (021) 29701100 / 3929938</div> *!}
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <!-- start navigation -->
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="container-fluid">
                            <!-- Toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand scroll-to" href="#top"><img class="img-responsive"  src="{!$base_url!}Assets/Front/img/logo.png" alt="MNC Finance"></a>
                            </div>
                            <!-- Collect the nav links, for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <!-- Nav-Links start -->
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active"><a href="{!$site_url!}#top" class="scroll-to">Beranda</a></li>
                                    <li><a href="{!$site_url!}#services" class="scroll-to">Simulasi</a></li>
                                    <li><a href="{!$site_url!}#about" class="scroll-to">Tentang Kami</a></li>
                                    <li><a href="{!$site_url!}#locations" class="scroll-to">Lokasi Cabang</a></li>
                                </ul>
                                <!-- Nav-Links end -->
                            </div>
                        </div>
                    </nav>
                    <!-- end navigation -->
                </div>
            </div>

        </header>
        <!-- Header end -->

        <!-- Content Start -->
        {!block name=content!}
        {!/block!}
        <!-- Content End -->

        <!-- Footer start -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <ul class="footer-nav">
                            <li><a class="scroll-to" href="{!$site_url!}#top">Beranda</a></li>
                            <li><a class="scroll-to" href="{!$site_url!}#services">Simulasi</a></li>
                            <li><a class="scroll-to" href="{!$site_url!}#locations">Lokasi Cabang</a></li>
                        </ul>
                        <div class="clearfix"></div>
                        <p class="copyright">&copy; 2019 MNC Finance</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer end -->

        <script>
            var base_url = '{!$base_url!}';
            var site_url = '{!$site_url!}';
        </script>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="{!$base_url!}Assets/Front/js/jquery-1.11.0.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->

        <script src="{!$base_url!}Assets/Front/js/bootstrap.min.js"></script>
        <script src="{!$base_url!}Assets/Front/js/jquery.autocomplete.min.js"></script>
        <script src="{!$base_url!}Assets/Front/js/jquery.placeholder.js"></script>
        <script src="{!$base_url!}Assets/Front/js/locations-autocomplete.js"></script>
        <script src="{!$base_url!}Assets/Front/js/bootstrap-datepicker.js"></script>
        <script src="{!$base_url!}Assets/Front/js/gmap3.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwNVAqE5WQBUUYDJuyuXbwkXxUp7IDtSU" type="text/javascript"></script>

        <!--[if !(gte IE 8)]><!-->
        <script src="{!$base_url!}Assets/Front/js/wow.min.js"></script>

        <script>
            // Initialize WOW
            //-------------------------------------------------------------
            new WOW({mobile: false}).init();
        </script>
        <!--<![endif]-->

        <script src="{!$base_url!}Assets/Front/js/custom.js"></script>
        <script src="{!$base_url!}Assets/Front/sweetalert/dist/sweetalert.min.js"></script>

        {!if $errType && $errMsg!}
        <script>
            swal("", "{!$errMsg!}", "{!$errType!}");
        </script>
        {!/if!}

        {!block name=scripts!}
        {!/block!}
    </body>
</html>