<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\Location;
use Entities\Mstmenu;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MasterLokasi extends CI_Controller {
	
	protected $menu;
    
    public function __construct() {
        parent::__construct();
        
        $this->load->library("auth");
        if(!$this->auth->CheckAdminSession()) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Anda belum login!");
            redirect("account/login");
        }
        
        $this->load->library("httpstatus");
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        $this->smarty->assign("User", $this->auth->GetAdminSession());
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        $this->menu = Mstmenu::with("childmenu")->where("ISACTIVE", "1")->where("menuparentid", null)->get();
    }
    
    public function index() {
        $locations = Location::orderBy("ID", "asc")->get();
        
        // Check if there are flashdata
        if((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }
        
        $data = array(
            'pagetitle' => "Master Lokasi Cabang",
            'menu' => $this->menu,
            'locations' => $locations
        );
        
        $this->smarty->view('admin/MasterLokasi/Index.tpl', $data);
    }
    
    public function PostCreateLocation() {
        $caption = $this->input->post("caption");
        $value = $this->input->post("value");
        $lat = (empty(trim($this->input->post("lat"))) ? NULL : $this->input->post("lat"));
        $lng = (empty(trim($this->input->post("lng"))) ? NULL : $this->input->post("lng"));
        
        if(empty($caption) || empty($value)) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Nama dan Alamat Cabang harus diisi!");
            redirect("MasterLokasi/index");
        }
        
        try {
            $location = new Location;
            $location->caption = $caption;
            $location->value = $value;
            $location->Lat = $lat;
            $location->Lng = $lng;
            $location->ISACTIVE = "1";
            $location->save();
            
            $this->session->set_flashdata("errType", "success");
            $this->session->set_flashdata("errMsg", "Berhasil menambahkan lokasi!");
        } catch (Exception $exc) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Nama dan Alamat Cabang harus diisi!");
        }
        
        redirect("MasterLokasi/index");
    }
    
    public function DeleteLocation() {
        $id = $this->input->post("locationid");
        header('Content-Type: application/json');
        
        if (!empty($id)) {
            try {
                $location = Location::findOrFail($id);
                $location->delete();
                
                header($this->httpstatus->GetHeader(200));
                $data = array(
                    "errType" => "success",
                    "errMsg" => "Lokasi telah dihapus!"
                );
            } catch (ModelNotFoundException $e) {
                header($this->httpstatus->GetHeader(404));
                $data = array(
                    "errType" => "error",
                    "errMsg" => "Data tidak ditemukan!"
                );
            } catch (Exception $exc) {
                header($this->httpstatus->GetHeader(500));
                $data = array(
                    "errType" => "error",
                    "errMsg" => "Terjadi kesalahan saat menghapus lokasi!"
                );
            }
            
            echo json_encode($data);
        } else {
            header($this->httpstatus->GetHeader(405));
            $data = array(
                "errType" => "error",
                "errMsg" => "Method not allowed!"
            );

            echo json_encode($data);
        }
    }
}
