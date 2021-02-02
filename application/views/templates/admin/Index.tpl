{!extends file="../Admin.tpl"!}

{!block name=styles!}
    <link rel="stylesheet" href="{$base_url}/Assets/DataTables/datatables.min.css" />
{!/block!}

{!block name=scripts!}
    <script src="{$base_url}/Assets/DataTables/datatables.min.js"></script>
    <script>
        $("#tblslider").dataTable();
    </script>
{!/block!}

{!block name=content!}
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="row page-titles">
            <div class="col-md-12">
                <h4 class="text-white">{!$pagetitle!}</h4>
            </div>
            <div class="col-md-6">
                &nbsp;
            </div>
            <div class="col-md-6 text-right">
                <form class="app-search d-none d-md-block d-lg-block">
                    <input type="text" class="form-control" placeholder="Search &amp; enter">
                </form>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h3>Hallo, {!$User->username!}</h3>
                        <h4>Selamat datang di Dashboard  MFin Landing Page</h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End PAge Content -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right sidebar -->
        <!-- ============================================================== -->
        <!-- .right-sidebar -->

        <!-- ============================================================== -->
        <!-- End Right sidebar -->
        <!-- ============================================================== -->
    </div>
{!/block!}