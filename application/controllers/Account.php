<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//use Aidantwoods\SecureHeaders\SecureHeaders;
use \Entities\User;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Account extends CI_Controller {
    
    
    public function __construct() {
        parent::__construct();
        $this->load->library("auth");
        $this->smarty->assign("base_url", base_url());
        $this->smarty->assign("site_url", site_url());
    }
    
    public function Index() {
        redirect("account/login");
    }
    
    public function Login() {
        // Prevent opening Login page if the user has been log in
        if($this->auth->CheckAdminSession()) {
            redirect("admin/index");
        }
        
        // Set Smarty delimeter
        $this->smarty->left_delimiter = '{!';
        $this->smarty->right_delimiter = '!}';
        
        // Check if there are flashdata
        if((!is_null($this->session->flashdata("errType"))) && (!is_null($this->session->flashdata("errMsg")))) {
            $this->smarty->assign("errType", $this->session->flashdata("errType"));
            $this->smarty->assign("errMsg", $this->session->flashdata("errMsg"));
        }
        
        $this->smarty->view('Login.tpl');
    }
    
    public function Logout() {
        $this->session->sess_destroy();      
        
        $this->session->set_flashdata('errType', 'success');
        $this->session->set_flashdata('errMsg', 'Anda telah keluar dari sistem');
        redirect("account/login");
    }

    public function PostLogin() {
        $username = $this->input->post("Username");
        $password = $this->input->post("Password");
        
        try {
            $user = User::where("userid", $username)->firstOrFail();
            if(password_verify($password, $user->password)) {
                $this->auth->SetAdminSession($user);
                redirect("admin/index");
            }
            
            $this->session->set_flashdata("errType", "error");
            $this->session->set_flashdata('errMsg', 'Password tidak sesuai!');
        }
        catch (ModelNotFoundException $e) {
            $this->session->set_flashdata('errType', 'error');
            $this->session->set_flashdata('errMsg', 'User tidak ditemukan!');
        }
        catch (Exception $exc) {
            $this->session->set_flashdata('errType', 'error');
            $this->session->set_flashdata('errMsg', 'Terjadi kesalahan saat mencari data!');
        }
        
        redirect("account/login");
    }

}
