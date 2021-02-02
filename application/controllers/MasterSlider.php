<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\Mstmenu;
use Entities\SliderImages;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MasterSlider extends CI_Controller {
    
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
        $images = SliderImages::where("ISACTIVE", "1")->orderBy('CRE_DATE', 'desc')->get();
        
        // Check if there are flashdata
        if((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }
        
        $data = array(
            'pagetitle' => "Master Slider",
            'menu' => $this->menu,
            'images' => $images
        );
        
        $this->smarty->view('admin/MasterSlider/Index.tpl', $data);
    }
    
    public function PostCreateSlider() {
        $config['upload_path'] = './Upload/Slider/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_width'] = 590;
        $config['max_height'] = 480;
        $config["file_name"] = md5(uniqid());

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('image')) {
            $error = array('error' => $this->upload->display_errors());
            $errmsgs = array();
            
            foreach ($error as $key => $value) {
                array_push($errmsgs, strip_tags($value));
            }
            
            $errmsg = implode("<br/>", $errmsgs);
            
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", $errmsg);
        } else {
            $uploadData = $this->upload->data();
            
            try {
                $sliderimages = new SliderImages();
                $sliderimages->slider_title = $this->input->post("title");
                $sliderimages->slider_caption = $this->input->post("caption");
                $sliderimages->slider_imagepath = "Upload/Slider/".$uploadData["file_name"];
                $sliderimages->ISACTIVE = "1";
                $sliderimages->save();
                
                $this->session->set_flashdata("errType", "success");
                $this->session->set_flashdata("errMsg", "Berhasil mengunggah slider!");
            } catch (Exception $exc) {
                $this->session->set_flashdata("errType", "error");
                $this->session->set_flashdata("errMsg", "Terjadi kesalahan saat mengunggah slider!");
            }
        }
        
        redirect("MasterSlider/index");
    }
    
    public function DeleteImage() {
        $id = $this->input->post("sliderid");
        header('Content-Type: application/json');
        
        if (!empty($id)) {
            try {
                $slider = SliderImages::findOrFail($id);
                $slider->delete();
                
                header($this->httpstatus->GetHeader(200));
                $data = array(
                    "errType" => "success",
                    "errMsg" => "Slider telah dihapus!"
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
                    "errMsg" => "Terjadi kesalahan saat menghapus slider!"
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
