<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\User;

class Auth {
    protected $CI;

    public function __construct() {
        $this->CI =& get_instance();
        $this->CI->load->library("session");
    }

    public function CheckUserSession() {
        $user = $this->CI->session->userdata("user");
        return ($user instanceof User);
    }
    
    public function CheckAdminSession() {
        $user = $this->CI->session->userdata("admin");
        return ($user instanceof User);
    }
    
    public function GetUserSession() {
        $user = $this->CI->session->userdata("user");
        
        if($user instanceof User) {
            return $user;
        }
        
        return NULL;
    }
    
    public function GetAdminSession() {
        $user = $this->CI->session->userdata("admin");
        
        if($user instanceof User) {
            return $user;
        }
        
        return NULL;
    }
    
    public function SetUserSession(User $user) {
        if($user instanceof User) {
            $this->CI->session->set_userdata("user", $user);
            return TRUE;
        }
        
        return FALSE;
    }
    
    public function SetAdminSession(User $user) {
        if($user instanceof User) {
            $this->CI->session->set_userdata("admin", $user);
            return TRUE;
        }
        
        return FALSE;
    }
}
