{!extends file="../Front.tpl"!}

{!block name=styles!}

{!/block!}

{!block name=scripts!}
<script>
<!-- WhatsHelp.io widget --><script type="text/javascript">
(function () {
                var options = {
                         whatsapp: "+6287775057745", // WhatsApp number
                        sms: "+6287775057745", // Sms phone number
                        call: "+6287775057745", // Call phone number
                        company_logo_url: "//scontent.xx.fbcdn.net/v/t1.0-1/p50x50/12311047_1163931763636623_7122208117689027599_n.jpg?oh=4afcecfaf79bddddd5e6ad305cae5217&oe=5A4F733B", // URL of company logo (png, jpg, gif)
                        greeting_message: "Hii.. Sobat MNC Finance, ada yang bisa kami bantu?", // Text of greeting message
                        call_to_action: "Hubungi Kami ", // Call to action
                        button_color: "#FF6550", // Color of button
                        position: "right", // Position may be 'right' or 'left'
                        order: "whatsapp,call,sms" // Order of buttons
                };
                var proto = document.location.protocol, host = "whatshelp.io", url = proto + "//static." + host;
                var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
                s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
                var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
        })();
</script><!-- /WhatsHelp.io widget -->
{!/block!}

{!block name=content!}
<!-- Services start -->
    <section id="detailsfrm" class="container">
        <div class="row">
            <div class="col-md-12 title">
                <h2>Formulir Pengajuan Kredit</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-xs-12 pull-left">
                <p class="contact-info">Isi formulir sekarang, dan Anda akan kami hubungi dalam 1x24 Jam. <br>
                    {!*<span class="address"><span class="highlight">Address:</span>  Car|Rental / 3861 Sepulveda Blvd. / Culver City, CA 90230</span></p>*!}
                    <form action="{!$postUrl!}" method="post">
                    <input type="hidden" name="sumber" id="sumber" value="{!$sumber!}" />
                    <input type="hidden" name="rdjaminan" id="rdjaminan" value="{!$form.jaminan!}" />
                    <div class="form-group">
                        <label for="namalengkap">Nama Lengkap</label>
                        <input type="text" class="form-control text-field" name="nama" id="namalengkap" placeholder="Nama Lengkap:" value="{!$form.nama!}" required>
                        <div class="clearfix"></div>
                    </div>
                    <div class="form-group">
                        <label for="namalengkap">Email</label>
                        <input type="email" class="form-control text-field" name="email" id="email" placeholder="Email:" value="{!$form.email!}" required>
                        <div class="clearfix"></div>
                    </div>
                    <div class="form-group">
                        <label for="identitas">Jenis Kartu Identitas</label>
                        <select class="form-control text-field" name="identitas" id="identitas" placeholder="Jenis Kartu Identitas:" required>
                            <option value="">Silakan Pilih</option>
                            <option value="ktp">KTP</option>
                            <option value="sim">SIM</option>
                        </select>
                        <div class="clearfix"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="idcardno">Nomor Kartu Identitas</label>
                        <input type="tel" pattern="[0-9]{10,20}" class="form-control text-field" name="idcardno" id="idcardno" placeholder="Nomor Kartu Identitas:" required>
                    </div>
                    
                    <hr />
                    
                    <div class="form-group">
                        <label for="alamat">Alamat</label>
                        <textarea class="form-control message" name="alamat" id="alamat" placeholder="Alamat Lengkap:" required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="kotaprovinsi">Kota/Provinsi</label>
                        <input type="text" class="form-control text-field" name="kotaprovinsi" id="kotaprovinsi" placeholder="Kota/Provinsi:" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="telepon">Nomor Telepon</label>
                        <input type="tel" class="form-control telephone text-field" name="phone" id="phone" placeholder="Nomor Telepon:" value="{!$form.phone!}" required>
                    </div>

                    <div class="form-group">
                        <label for="lokasiagunan">Lokasi Agunan</label>
                        <select class="form-control text-field" name="lokasiagunan" id="lokasiagunan" placeholder="Lokasi Agunan:" required>
                            <option value="">Silakan pilih</option>
                            <option value="DKI Jakarta">DKI Jakarta</option>
                            <option value="Bogor">Bogor</option>
                            <option value="Depok">Depok</option>
                            <option value="Tangerang">Tangerang</option>
                            <option value="Bekasi">Bekasi</option>
                            <option value="Lainnya">Di luar JABODETABEK</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="jumlahpinjaman">Jumlah Pinjaman</label>
                        <select class="form-control text-field" name="jumlahpinjaman" id="jumlahpinjaman" placeholder="Jumlah Pinjaman:" required>
                            <option value="">Silakan pilih</option>
                            {!if count($optloan) > 0!}
                            {!foreach $optloan as $item!}
                            <option value="{!$item->opt!}">{!$item->descs!}</option>
                            {!/foreach!}
                            {!/if!}
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background: #11256c;">Submit Message</button>
                </form>
            </div>
        </div>
    </section>
<!-- About End -->
{!/block!}