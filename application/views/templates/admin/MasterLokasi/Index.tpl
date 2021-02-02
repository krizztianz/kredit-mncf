{!extends file="../../Admin.tpl"!}

{!block name=styles!}
<link rel="stylesheet" href="{!$base_url!}/Assets/DataTables/datatables.min.css" />
{!/block!}

{!block name=scripts!}
<script src="{!$base_url!}/Assets/DataTables/datatables.min.js"></script>
<script>
    $("#tblslider").dataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                text: 'Tambah Lokasi',
                action: function (e, dt, node, config) {
                    $('#AddLocation').on('hide.bs.modal', function (e) {
                        $("#caption").val(null);
                        $("#address").val(null);
                    });
                    $("#AddLocation").modal("show");
                }
            }
        ]
    });
</script>
<script>
    function HapusImage(id) {
        Swal.fire({
            title: 'Konfirmasi',
            text: "Anda yakin akan menghapus lokasi cabang ini?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Hapus lokasi!',
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.value) {
                var request = $.ajax({
                    url:"{!$site_url!}MasterLokasi/DeleteLocation",
                    method: "post",
                    data:{
                        locationid:id
                    }
                });
                
                request.done(function( result ) {
                    Swal.fire({
                        type: result.errType,
                        text: result.errMsg
                    }).then(function(result){
                        window.location.reload(true);
                    });
                });
                
                request.fail(function( jqXhr ) {
                    var result = jqXhr.responseJSON;
                    
                    Swal.fire({
                        type: result.errType,
                        text: result.errMsg
                    }).then(function(result){
                        window.location.reload(true);
                    });
                });
            }
        });
    }
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
            &nbsp;
            {!*<form class="app-search d-none d-md-block d-lg-block">
                    <input type="text" class="form-control" placeholder="Search &amp; enter">
                </form>*!}
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
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tblslider">
                            <thead>
                                <tr>
                                    <th>Nama Cabang</th>
                                    <th>Alamat</th>
                                    <th>Lat</th>
                                    <th>Lng</th>
                                    <th>Status</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                {!foreach key=k item=v from=$locations!}
                                <tr>
                                    <td>{!$v->caption!}</td>
                                    <td>{!$v->value!}</td>
                                    <td>{!$v->Lat!}</td>
                                    <td>{!$v->Lng!}</td>
                                    <td>{!($v->ISACTIVE == "1") ? "Aktif" : "Non Aktif"!}</td>
                                    <td><button class="btn btn-danger" onclick="HapusImage('{!$v->ID!}');">Hapus</button></td>
                                </tr>
                                {!foreachelse!}
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                {!/foreach!}
                            </tbody>
                        </table>
                    </div>
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
                            
<div class="modal fade" id="AddLocation" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Lokasi Cabang</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="{!$site_url!}MasterLokasi/PostCreateLocation">
            <div class="modal-body">
                <div class="form-group">
                    <label for="title">Nama Cabang</label>
                    <input type="text" class="form-control" id="caption" name="caption" placeholder="Nama Cabang" required>
                </div>
                <div class="form-group">
                    <label for="caption">Alamat</label>
                    <input type="text" class="form-control" id="value" name="value" placeholder="Alamat" required>
                </div>
                <div class="form-group">
                    <label for="caption">Latitude</label>
                    <input type="text" class="form-control" id="lat" name="lat" placeholder="Optional">
                </div>
                <div class="form-group">
                    <label for="caption">Longitude</label>
                    <input type="text" class="form-control" id="lng" name="lng" placeholder="Optional">
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Tambah</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
{!/block!}