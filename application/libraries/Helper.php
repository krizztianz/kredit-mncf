<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Helper {
    protected $CI;

    public function __construct() {
        $this->CI =& get_instance();
        
    }
    
    function rupiah($number) {
        $result = "Rp " . number_format($number, 2, ',', '.');
        return $result;
    }

}
