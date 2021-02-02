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
            'csv', 'excel', 'pdf'
        ]
    });
</script>
<script>
    function HapusImage(id) {
        Swal.fire({
            title: 'Konfirmasi',
            text: "Anda yakin akan menghapus slider ini?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Hapus slider!',
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.value) {
                var request = $.ajax({
                    url:"{!$site_url!}MasterSlider/DeleteImage",
                    method: "post",
                    data:{
                        sliderid:id
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
                                    <th>Nama Debitur</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Agunan</th>
                    <th>Tanggal</th>
                                    <th>Status</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                {!foreach key=k item=v from=$pengajuan!}
                                <tr>
                                    <td>{!$v->nama!}</td>
                                    <td>{!$v->email!}</td>
                                    <td>{!$v->phone!}</td>
                                    <td>{!$v->agunan!}</td>
                    <td>{!$v->CRE_DATE!}</td>
                                    <td>{!($v->ISACTIVE == "1") ? "Aktif" : "Non Aktif"!}</td>
                                    <td><button class="btn btn-danger" onclick="DetailPengajuan('{!$v->ID!}');">Detail</button></td>
                                </tr>
                                {!foreachelse!}
                                <tr>
                                    <td>&nbsp;</td>
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
                            
<div class="modal fade" id="UploadModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Upload Slider</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="{!$site_url!}MasterSlider/PostCreateSlider" enctype="multipart/form-data">
            <div class="modal-body">
                <div class="form-group">
                    <label for="title">Slider Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Optional">
                </div>
                <div class="form-group">
                    <label for="caption">Slider Caption</label>
                    <input type="text" class="form-control" id="caption" name="caption" placeholder="Optional">
                </div>
                <div class="form-group">
                    <label for="customFile">Pilih gambar</label>
                    <input type="file" class="form-control" name="image" id="customFile" required="">
                    <small id="fileHelp" class="form-text text-muted">Ukuran yang direkomendasian adalah: 590x323 px</small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Upload</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
{!/block!}