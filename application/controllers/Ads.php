<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\SliderImages;
use Entities\Location;
use Entities\Setting;

class Ads extends CI_Controller {
    
    protected $header;
    
    public function __construct() {
        parent::__construct();
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        
        $this->load->library("httpstatus");
        $this->load->library("helper");
    }

    public function index() {
        $images = SliderImages::where("ISACTIVE", "1")->orderBy('CRE_DATE', 'desc')->get();
        $setting = Entities\Setting::first();
        $optloan = Entities\OptJumlahPinjaman::where("ISACTIVE", "1")->orderBy('ID', 'ASC')->get();
        
        if(is_null($setting)) {
            $setting = new Entities\Setting();
            $setting->sitename = "MNC Finance";
            $setting->sitelogo = "Assets/Front/img/logo.png";
            $setting->aboutus = "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu commun paroles.";
        }
        
        // Check if there are flashdata
        if((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }
        
        $data = array(
            'images' => $images,
            'setting' => $setting,
            'optloan' => $optloan
        );
        
        $this->smarty->view('front/Ads.tpl', $data);
    }

}
