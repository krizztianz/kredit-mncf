{!extends file="../../Admin.tpl"!}

{!block name=styles!}
<link rel="stylesheet" href="{!$base_url!}/Assets/DataTables/datatables.min.css" />
{!/block!}

{!block name=scripts!}

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

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form method="post" action="{!$site_url!}Setting/PostSaveSetting" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="sitename">Nama Website</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="sitename" name="sitename" placeholder="Nama Situs (Default: MNC Finance)" value="{!$setting->sitename!}" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sukubunga">Suku Bunga (%)</label>
                            <div class="col-md-3">
                                <input type="number" class="form-control" id="sukubunga" name="sukubunga" placeholder="Suku Bunga untuk perhitungan simulasi kredit (Default: 20)" value="{!$setting->interest_rate!}" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="logo">Logo Website</label>
                            <div class="col-md-6">
                                <input class="form-control" type="file" id="logo" name="logo">
                                <p class="help-block">Ukuran yang direkmoendasikan adalah: <b>300px × 57px</b></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="logothumb">Preview Logo</label>
                            <br/>
                            <img id="logothumb" class="img-responsive" src="{!$base_url!}{!$setting->sitelogo!}" />
                        </div>
                        <div class="form-group">
                            <label for="aboutus">Tentang Kami</label>
                            <div class="col-md-6">
                                <textarea class="form-control" id="aboutus" name="aboutus" rows="5" placeholder="Teks singkat tentang website/organisasi" required>{!$setting->aboutus!}</textarea>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Simpan Pengaturan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{!/block!}