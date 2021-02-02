<?php

class FormPengajuan extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $this->load->library("httpstatus");
        $this->load->library("helper");
    }
    
    public function index() {
        $nama = $this->input->post("nama");
        $email = $this->input->post("email");
        $phone = $this->input->post("phone");
        $jaminan = $this->input->post("rdjaminan");
        $sumber = $this->input->post("sumber");
        $postUrl = site_url("PengajuanKredit/PostPengajuan");
        
        if(is_null($sumber)) {
            $sumber = "reguler";
            
        }
        
        if($sumber == "ads") {
            $postUrl = site_url("PengajuanKredit/PostPengajuanAds");
        }
        
        $form = array(
            "nama" => $nama,
            "email" => $email,
            "phone" => $phone,
            "jaminan" => $jaminan,
            "sumber" => $sumber
        );
        
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        
        $setting = Entities\Setting::first();
        $optloan = Entities\OptJumlahPinjaman::where("ISACTIVE", "1")->orderBy('ID', 'ASC')->get();
        
        if(is_null($setting)) {
            $setting = new Entities\Setting();
            $setting->sitename = "MNC Finance";
            $setting->sitelogo = "Assets/Front/img/logo.png";
            $setting->aboutus = "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu commun paroles.";
        }
        
        $data = array(
            "optloan" => Entities\OptJumlahPinjaman::where("ISACTIVE", "1")->orderBy('ID', 'ASC')->get(),
            "setting" => $setting,
            "sumber" => $sumber,
            "form" => $form,
            "postUrl" => $postUrl
        );
        
        $this->smarty->view('front/FormDetail.tpl', $data);
    }
}
