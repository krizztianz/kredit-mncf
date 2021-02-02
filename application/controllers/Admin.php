<?php

defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\Mstmenu;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Admin extends CI_Controller {

    protected $menu;

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
        redirect("admin/home");
    }

    public function home() {

        // Check if there are flashdata
        if ((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }

        $data = array(
            'pagetitle' => "Beranda",
            'menu' => $this->menu
        );

        $this->smarty->view('admin/Index.tpl', $data);
    }

    public function PostChangePassword() {
        $old = trim($this->input->post("oldpassword"));
        $new = trim($this->input->post("newpassword"));
        $conf = trim($this->input->post("passwordconf"));

        if (empty($old) || empty($new) || empty($conf)) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Form penggantian password harus diisi lengkap!");
            redirect("admin/home");
        }

        if ($conf !== $new) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Konfirmasi password tidak sesuai!");
            redirect("admin/home");
        }

        try {
            $usersess = $this->auth->GetAdminSession();
            $user = Entities\User::findOrFail($usersess->ID);
            $oldpassword = $user->password;
            if (!password_verify($old, $oldpassword)) {
                $this->session->set_flashdata("errType", "error");
                $this->session->set_flashdata("errMsg", "Password lama tidak sesuai!");
            } else {
                $user->password = password_hash($new, PASSWORD_BCRYPT);
                $user->MOD_BY = $usersess->username;
                $user->save();
                
                $this->session->set_flashdata("errType", "success");
                $this->session->set_flashdata("errMsg", "Password telah diubah!");
            }
        }
        catch (ModelNotFoundException $nfe) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "User tidak ditemukan!");
        }
        catch (Exception $exc) {
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata("errMsg", "Terjadi kesalahan saat mengubah password!");
        }
        
        redirect("admin/home");
    }
    
    public function createHash($password) {
        echo password_hash($password, PASSWORD_BCRYPT);
    }

}
