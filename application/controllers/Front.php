<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\SliderImages;
use Entities\Location;
use Entities\Setting;

class Front extends CI_Controller {
    
    protected $header;
    
    public function __construct() {
        parent::__construct();
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $this->smarty->assign("base_url", base_url()."/");
        $this->smarty->assign("site_url", site_url()."/");
        
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
        
        $this->smarty->view('front/Index.tpl', $data);
    }
    
    public function GetLocations() {
        header('Content-Type: application/json');
        
        $templocations = Location::where("ISACTIVE", "1")->get();
        $location = array();
        
        if($templocations->count() > 0) {
            foreach ($templocations as $item) {
                $temp = array(
                    "value" => $item->url,
                    "caption" => $item->caption
//                    "latLng" => array(
//                        $item->Lat, $item->Lng
//                    )
                );

                array_push($location, $temp);
            }
            
            header($this->httpstatus->GetHeader(200));
            
            $data["locations"] = $location;
            echo json_encode($data);
        } else {
            header($this->httpstatus->GetHeader(404));
            
            $error = array(
                "status" => 404,
                "message" => "No data found"
            );
            
            echo json_encode($error);
        }
    }

    
    public function hitungangsuran() {
        header('Content-Type: application/json');
        
        $pinjaman = $this->input->post("pinjaman");
        $tenor = $this->input->post("tenor");
        
        if((empty($pinjaman) || $pinjaman < 0) || (empty($tenor) || $tenor < 0)) {
            header($this->httpstatus->GetHeader(200));
            $data = array(
                'pinjaman' => $this->helper->rupiah(0),
                'tenor' => 0,
                'angsuran' => $this->helper->rupiah(0)
            );
        } else {
            $setting = Setting::first();
        
            if (!is_null($setting)) {
                $bunga = ($setting->interest_rate);
            } else {
                $bunga = 20;
            }

            $hutang = $pinjaman;
            $bunga_bulan = ($bunga / 12) / 100;
            $pembagi = 1 - (1 / pow(1 + $bunga_bulan, $tenor));
            $anuitas = $pinjaman / ($pembagi / $bunga_bulan);

            $ang_bunga = $hutang * (($bunga / 12) / 100);
            $ang_pokok = $anuitas - $ang_bunga;
            $cicilan = $ang_bunga + $ang_pokok;
            
            header($this->httpstatus->GetHeader(200));
            $data = array(
                'pinjaman' => $this->helper->rupiah($pinjaman),
                'tenor' => $tenor,
                'angsuran' => $this->helper->rupiah($cicilan)
            );
        }

        echo json_encode($data);
    }

}
