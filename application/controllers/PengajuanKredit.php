<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\PengajuanKredit as Pengajuan;
use Entities\PengajuankreditAds as PengajuanAds;
use Entities\Mstmenu;

class PengajuanKredit extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->library("auth");
    }
    
    public function index() {
        if(!$this->auth->CheckAdminSession()) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Anda belum login!");
            redirect("account/login");
        }
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $menu = Mstmenu::with("childmenu")->where("ISACTIVE", "1")->where("menuparentid", null)->get();
        $pengajuan = Pengajuan::orderBy("CRE_DATE", "desc")->get();
        
        $data = array(
            'pagetitle' => "Report Webform",
            'menu' => $menu
        );
        
        $this->smarty->assign("pengajuan", $pengajuan);
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        $this->smarty->view("admin/Pengajuan/Index.tpl", $data);
    }

    public function ads() {
        if(!$this->auth->CheckAdminSession()) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Anda belum login!");
            redirect("account/login");
        }
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $menu = Mstmenu::with("childmenu")->where("ISACTIVE", "1")->where("menuparentid", null)->get();
        $pengajuan = PengajuanAds::orderBy("CRE_DATE", "desc")->get();
        
        $data = array(
            'pagetitle' => "Report Webform",
            'menu' => $menu
        );
        
        $this->smarty->assign("pengajuan", $pengajuan);
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        $this->smarty->view("admin/Pengajuan/Ads.tpl", $data);
    }
    
    public function PostPengajuan() {
        $nama = $this->input->post("nama");
        $email = $this->input->post("email");
        $phone = $this->input->post("phone");
        $agunan = $this->input->post("rdjaminan");
        $identitas = $this->input->post("identitas");
        $idcardno = $this->input->post("idcardno");
        $alamat = $this->input->post("alamat");
        $kotaprovinsi = $this->input->post("kotaprovinsi");
        $lokasiagunan = $this->input->post("lokasiagunan");
        $jumlahpinjaman = $this->input->post("jumlahpinjaman");
        
        if(empty($nama) || empty($email) || empty($phone) || empty($agunan)) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Data pengajuan harus diisi lengkap!");
        } else {
            try {
                $pengajuan = new Pengajuan();
                $pengajuan->nama = $nama;
                $pengajuan->email = $email;
                $pengajuan->phone = $phone;
                $pengajuan->agunan = $agunan;
                $pengajuan->jenisidentitas = $identitas;
                $pengajuan->nomoridentitas = $idcardno;
                $pengajuan->alamat = $alamat;
                $pengajuan->kotaprovinsi = $kotaprovinsi;
                $pengajuan->lokasiagunan = $lokasiagunan;
                $pengajuan->jumlahpinjaman = $jumlahpinjaman;
                $pengajuan->CRE_BY = $idcardno;
                $pengajuan->ISACTIVE = "1";
                $pengajuan->save();

                $this->session->set_flashdata("errType", "success");
                $this->session->set_flashdata("errMsg", "Data pengajuan telah kami terima, kami akan menghubungi anda");
            } catch (Exception $exc) {
                $this->session->set_flashdata("errType", "error");
                $this->session->set_flashdata("errMsg", "Terjadi kesalahan saat melakukan pengajuan!");
            }
        }
        
        redirect("front/index");
    }

    public function PostPengajuanAds() {
        $nama = $this->input->post("nama");
        $email = $this->input->post("email");
        $phone = $this->input->post("phone");
        $agunan = $this->input->post("rdjaminan");
        $identitas = $this->input->post("identitas");
        $idcardno = $this->input->post("idcardno");
        $alamat = $this->input->post("alamat");
        $kotaprovinsi = $this->input->post("kotaprovinsi");
        $lokasiagunan = $this->input->post("lokasiagunan");
        $jumlahpinjaman = $this->input->post("jumlahpinjaman");
        
        if(empty($nama) || empty($email) || empty($phone) || empty($agunan)) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Data pengajuan harus diisi lengkap!");
        } else {
            try {
                $pengajuan = new PengajuanAds();
                $pengajuan->nama = $nama;
                $pengajuan->email = $email;
                $pengajuan->phone = $phone;
                $pengajuan->agunan = $agunan;
                $pengajuan->jenisidentitas = $identitas;
                $pengajuan->nomoridentitas = $idcardno;
                $pengajuan->alamat = $alamat;
                $pengajuan->kotaprovinsi = $kotaprovinsi;
                $pengajuan->lokasiagunan = $lokasiagunan;
                $pengajuan->jumlahpinjaman = $jumlahpinjaman;
                $pengajuan->CRE_BY = $idcardno;
                $pengajuan->ISACTIVE = "1";
                $pengajuan->save();

                $this->session->set_flashdata("errType", "success");
                $this->session->set_flashdata("errMsg", "Data pengajuan telah kami terima, kami akan menghubungi anda");
            } catch (Exception $exc) {
                $this->session->set_flashdata("errType", "error");
                $this->session->set_flashdata("errMsg", "Terjadi kesalahan saat melakukan pengajuan!");
            }
        }
        
        redirect("front/index");
    }


}