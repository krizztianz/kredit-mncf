<?php

defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\Mstmenu;

class Setting extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library("auth");

        if (!$this->auth->CheckAdminSession()) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Anda belum login!");
            redirect("account/login");
        }

        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';

        $this->smarty->assign("User", $this->auth->GetAdminSession());
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
        $this->menu = Mstmenu::with("childmenu")->where("ISACTIVE", "1")->where("menuparentid", null)->get();
    }

    public function index() {
        $setting = Entities\Setting::first();

        // Check if there are flashdata
        if ((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }

        if (is_null($setting)) {
            $setting = new Entities\Setting();
            $setting->sitename = "MNC Finance";
            $setting->interest_rate = 20;
            $setting->aboutus = "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu commun paroles.";
            $setting->sitelogo = "Assets/Front/img/logo.png";
        }

        $data = array(
            'pagetitle' => "Pengaturan Umum",
            'menu' => $this->menu,
            'setting' => $setting
        );

        $this->smarty->view('admin/Setting/Index.tpl', $data);
    }

    public function PostSaveSetting() {
        $sitename = trim($this->input->post("sitename"));
        $sukubunga = trim($this->input->post("sukubunga"));
        $about = trim($this->input->post("aboutus"));

        if (empty($sitename)) {
            $sitename = "MNC Finance";
        }

        if (empty($sukubunga)) {
            $sukubunga = 20;
        }

        if (empty($about)) {
            $about = "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu commun paroles.";
        }

        $setting = Entities\Setting::first();

        if (is_null($setting)) {
            $setting = new Entities\Setting();
            $setting->sitename = $sitename;
            $setting->interest_rate = $sukubunga;
            $setting->aboutus = $about;
        } else {
            $setting->sitename = $sitename;
            $setting->interest_rate = $sukubunga;
            $setting->aboutus = $about;
        }

        try {
            if (empty($_FILES['logo']['name'])) {
                $setting->sitelogo = "Assets/Front/img/logo.png";
            } else {
                $filename = $this->doUpload('logo');
                $setting->sitelogo = "Upload/Logo/".$filename;
            }
            
            $admin = $this->auth->GetAdminSession();
            $setting->MOD_BY = $admin->username;
            $setting->save();
            $this->session->set_flashdata("errType", "success");
            $this->session->set_flashdata("errMsg", "Berhasil menyimpan pengaturan!");
        }
        catch (FileUploadException $fxc) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", $fxc->getMessage());
        }
        catch (Exception $exc) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Terjadi kesalahan saat menyimpan pengaturan!");
        }

        redirect("Setting/index");
    }

    public function doUpload($element) {
        $config['upload_path'] = './Upload/Logo/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_width'] = 300;
        $config['max_height'] = 57;
        $config["file_name"] = md5(uniqid());

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($element)) {
            $error = array('error' => $this->upload->display_errors());
            $errmsgs = array();

            foreach ($error as $key => $value) {
                array_push($errmsgs, strip_tags($value));
            }

            $errmsg = implode("<br/>", $errmsgs);
            
            throw new FileUploadException($errmsg);
        } else {
            $uploadData = $this->upload->data();
            return $uploadData["file_name"];
        }
    }

}

class FileUploadException extends Exception {
    
    public function __construct(string $message = "", int $code = 0, \Throwable $previous = NULL) {
        parent::__construct($message, $code, $previous);
    }
    
}
