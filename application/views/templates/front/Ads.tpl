{!extends file="../Front.tpl"!}

{!block name=styles!}
    <style>
        #teaser form .submit {
            width: 100%;
            background-color: #313236;
            color: #fff;
            border: none;
            border-radius: 0;
            box-shadow: 6px 6px 0 #efe9e9;
            text-align: center;
            font-size: 24px;
            text-transform: uppercase;
            font-weight: 900;
            padding: 10px 0;
            margin-top: 0px !important;
            transition: 0.2s;
        }
        
        #teaser .subtitle {
            font-size: 24px;
            color: #ffffff;
            text-transform: none;
            display: block;
            font-weight: normal;
            margin-top: 10px;
        }
        
        .form-horizontal .checkbox, .form-horizontal .checkbox-inline, .form-horizontal .radio, .form-horizontal .radio-inline {
            padding-top: 7px;
            margin-top: 0;
            margin-bottom: 0;
            padding-right: 25px;
        }
        
        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
                border-top-color: currentcolor;
                border-top-style: none;
                border-top-width: 0px;
            border-top: 1px solid #c8c8c8;
        }
        
        .well {
            min-height: 20px;
            padding: 19px;
            margin-bottom: 20px;
            background-color: #11256c;
            border: 1px solid #e3e3e3;
            border-radius: 50px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
        }
        
        .well-label {
            color: #ffffff;
        }
        
        .well-price {
            color: #c9c412;
        }
        
        #about .title {
            margin-bottom: 38px;
        }
        
        #about h2 {
            font-size: 46px;
            font-weight: 900;
            text-align: center;
            margin: 0 0 25px 0;
            padding: 0;
        }
        
        #about .underline {
            height: 4px;
            width: 135px;
            display: block;
            background-color: #313236;
            margin: 0 auto;
        }
        
        #about .review {
            font-size: 24px;
            line-height: 1.7;
        }

	.carousel-inner {
		position: relative;
		width: 100%;
		overflow: hidden;
		max-height: 480px;
		height: 480px;
	}
	
	#teaser form .submit {
	  width: 100%;
	  background-color: #FF5733;
	  color: #fff;
	  border: none;
	  border-radius: 0;
	  box-shadow: 6px 6px 0 #efe9e9;
	  text-align: center;
	  font-size: 24px;
	  text-transform: uppercase;
	  font-weight: 900;
	  padding: 10px 0;
	  margin-top: 30px;
	  transition: 0.2s;
	}
	
	#teaser form .submit:hover {
	  background-color: #313236;
	}

	#about .review {
		font-size: 18px;
		line-height: 1.7;
	}
    </style>
{!/block!}

{!block name=scripts!}
    <script>
	function Comma(Num) { //function to add commas to textboxes
            Num += '';
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            x = Num.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            return x1 + x2;

        }

        function checkEnter(e, elem) {
            if(elem.value.match(/[^0-9,]/)) {
                    elem.value=elem.value.replace(/[^0-9,elem.value=Comma(elem.value);]/g,'');
            }
        }
	
        function HitungAngsuran() {
            var totalpinjaman = ($("#jumlahpinjaman").val() === "" ? 0 : $("#jumlahpinjaman").val());
            //var tenor = $("input[name='tenor']:checked").val();
	    var tenor = $("#tenor").val();
            
            var data = {};
            data.pinjaman = totalpinjaman.replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "");
            data.tenor = tenor;
            
            $.post(site_url+'front/hitungangsuran', data, function (result){
                $("#estimasipinjaman").html('<b>'+result.pinjaman+'</b>');
                $("#estimasiangsuran").html('<b>'+result.angsuran+'</b>');
            }, "json");
        }
    </script>
	
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
    <!-- Teaser start -->
    <section id="teaser">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-xs-12 pull-right">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Wrapper for slides start -->
                        <div class="carousel-inner">
                            {!if $images->count() > 0!}
                            {!foreach key=k item=v from=$images!}
                            <div class="item{!($k == 0) ? ' active' : ''!}">
                                <h1 class="title">{!$v->slider_title!}
                                    <span class="subtitle">{!$v->slider_caption!}</span></h1>
                                <div class="car-img">
                                    <img src="{!$base_url!}/{!$v->slider_imagepath!}" class="img-responsive" alt="slider{!$k!}">
                                </div>
                            </div>
                            {!/foreach!}
                            {!else!}
                            <div class="item active">
                                <h1 class="title"> Slider Title
                                    <span class="subtitle">Slider Caption</span></h1>
                                <div class="car-img">
                                    <img src="{!$base_url!}/Assets/Front/img/banner-default.png" class="img-responsive" alt="car1">
                                </div>
                            </div>
                            <div class="item">
                                <h1 class="title"> Slider Title
                                    <span class="subtitle">Slider Caption</span></h1>
                                <div class="car-img">
                                    <img src="{!$base_url!}/Assets/Front/img/banner-default.png" class="img-responsive" alt="car1">
                                </div>
                            </div>
                            {!/if!}
                        </div>
                        <!-- Wrapper for slides end -->

                        {!* <!-- Slider Controls start -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        <!-- Slider Controls end --> *!}
                    </div>
                </div>
                <div class="col-md-5 col-xs-12 pull-left">
                    <div class="reservation-form-shadow">

                        <form action="{!$site_url!}FormPengajuan/Index" method="post" name="pengajuanKredit" id="pengajuanKredit">
                            <input type="hidden" name="sumber" id="sumber" value="ads" />
                            <div class="alert alert-danger hidden" id="car-select-form-msg">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
                                <strong>Note:</strong> All fields required!
                            </div>
                            
                            <div class="text-center">
                                <h3><b>Kredit Cepat, Agunan Sertifikat Rumah</b></h3>
                            </div>
                            <div class="clearfix">&nbsp;</div>
                            <!-- Pick-up location start -->
                            <div class="location">
                                <div class="input-group pick-up">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> Nama</span>
                                    <input type="text" name="nama" id="nama" class="form-control" placeholder="Nama Lengkap Anda" required>
                                </div>
                                <div class="clearfix">&nbsp;</div>
                                <div class="input-group pick-up">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span> Email</span>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Alamat Email" required>
                                </div>
                                <div class="clearfix">&nbsp;</div>
                                <div class="input-group pick-up">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span> Phone</span>
                                    <input type="tel" pattern="[0-9]{10,15}" name="phone" id="phone" class="form-control" placeholder="Nomor Telepon" required>
                                </div>
                            </div>
                            <!-- Drop-off location end -->
                            
                            <div>
                                <h4>Jaminan</h4>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rdjaminan" id="rdSertifikat" value="sertifikat-rumah" checked>
                                <label class="form-check-label" for="rdSertifikat">
                                    Sertifikat Rumah
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rdjaminan" id="rdlainnya" value="lainnya">
                                <label class="form-check-label" for="rdlainnya">
                                    Lainnya
                                </label>
                            </div>
                            <input type="submit" class="submit" name="submit" value="Lanjutkan" id="submitApplication">
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </section>
    <div class="arrow-down"></div>
    <!-- Teaser end -->


    <!-- Services start -->
    <section id="services" class="container">
        <div class="row">
            <div class="col-md-12 title">
                <h2>Simulasi Kredit</h2>
                <span class="underline">&nbsp;</span>
            </div>
        </div>
        <div class="row">
            <div class="form-horizontal">
                <div class="form-group form-group-lg">
                    <center>
                        <label for="jumlahpinjaman" class="col-sm-3 col-lg-6 control-label">Jumlah Pinjaman yang dibutuhkan</label>
                        <div class="col-sm-3 col-lg-3">
                            <input type="text" min="300000000" max="2000000000" step="50000" name="jumlahpinjaman" id="jumlahpinjaman" class="form-control" value="300000000" onkeypress="if(this.value.match(/[^0-9,]/)) this.value=this.value.replace(/[^0-9,javascript:this.value=Comma(this.value);]/g,'')" onkeyup="javascript:this.value=Comma(this.value);if(this.value.match(/[^0-9.,]/)); this.value=this.value.replace(/[^0-9.,]/g,''); HitungAngsuran();" />
                        </div>
                    </center>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-horizontal">
                <div class="form-group form-group-lg">
                    <center>
                    <label for="inputPassword3" class="col-sm-3 col-lg-6 control-label">Tenor (Bulan)</label>
                    {!* <div class="col-sm-3 col-lg-3">
                        <label class="radio-inline">
                            <input type="radio" name="tenor" onclick="HitungAngsuran();" id="tenor12" value="12" checked /> 12
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="tenor" onclick="HitungAngsuran();" id="tenor24" value="24" /> 24
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="tenor" onclick="HitungAngsuran();" id="tenor36" value="36" /> 36
                        </label>
                    </div> *!}
					<div class="col-sm-3 col-lg-3">
					<select name="tenor" class="form-control" id="tenor" onchange="HitungAngsuran();">
						<option value="12">12</option>
						<option value="24">24</option>
						<option value="36">36</option>
						<option value="48">48</option>
						<option value="60">60</option>
						<option value="72">72</option>
						<option value="84">84</option>
						<option value="96">96</option>
						<option value="108">108</option>
						<option value="120">120</option>
					</select>
					</div>
                    </center>
		
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="well">
                    <div class="row">
                        <div class="col-md-6 well-label">
                            <h4>Estimasi Jumlah Pinjaman Anda</h4>
                        </div>
                        <div class="col-md-6 text-right well-price">
                            <h3 id="estimasipinjaman"><b>Rp 0</b></h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="well">
                    <div class="row">
                        <div class="col-md-6 well-label">
                            <h4>Estimasi Jumlah Angsuran per bulan</h4>
                        </div>
                        <div class="col-md-6 text-right well-price">
                            <h3 id="estimasiangsuran"><b>Rp 0</b></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h5><b>Keterangan</b></h5>
            <h5><small>* Perhitungan di atas merupakan simulasi (Tidak mengikat)</small></h5>
            <h5><small>* Besaran biaya angsuran yang dibayarkan belum termasuk biaya administrasi, biaya asuransi, dan dapat berubah sewaktu-waktu.</small></h5>
        </div>
    </section>
    <!-- Services end -->
    <hr/>
    
    
    <!-- About Start -->
    <!-- Services start -->
    <section id="about" class="container">
        <div class="row">
            <div class="col-md-12 title">
                <h2>Tentang Kami</h2>
                <span class="underline">&nbsp;</span>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-10 col-md-offset-1">
                <div class="review">
                    {!$setting->aboutus!}
                </div>
                {!*<div class="author">
                    – Michael Smith, Santa Barbara CA
                </div>*!}
            </div>
        </div>
    </section>
    <!-- About End -->
    
    
    <hr/>
    <!-- Locations start -->
    <section id="locations">
        <div class="container location-select-container wow bounceInDown" data-wow-offset="200">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="location-select">
                        <div class="row">
                            <div class="col-md-6">
                                <h2>Kantor Cabang&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home" aria-hidden="true"></i></h2>
                            </div>
                            <div class="col-md-6">
                                <div class="styled-select-location">
                                    <select id="location-map-select"></select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="arrow-down-location">&nbsp;</div>
        </div>
        <div class="map wow bounceInUp" data-wow-offset="100"><!-- map by gmap3 --></div>
    </section>
    <!-- Locations end -->

    <a href="#" class="scrollup">ScrollUp</a>

{!/block!}