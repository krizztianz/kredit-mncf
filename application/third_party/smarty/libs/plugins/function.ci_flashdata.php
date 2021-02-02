<?php

/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * Smarty {ci_flashdata} function plugin
 *
 * Type:     function<br>
 * Name:     ci_flashdata<br>
 * Purpose:  bridge to code igniter url properties
 * @author Kristian Andi <kristianandi33 at gmail dot com>
 * @param array Format:
 * <pre>
 * array(
 *   'name' => required name of the config properties
 *   'assign' => optional smarty variable name to assign to - defaults to name
 * )
 * </pre>
 * @param Smarty
 */
function smarty_function_ci_flashdata($params, &$smarty) {
    if ($smarty->debugging) {
        $_params = array();
        require_once(SMARTY_CORE_DIR . 'core.get_microtime.php');
        $_debug_start_time = smarty_core_get_microtime($_params, $smarty);
    }

    $_name = isset($params['name']) ? $params['name'] : '';
    $_assign = isset($params['assign']) ? $params['assign'] : + $_name;

    if ($_name != '') {
        // get a Code Igniter instance
        $CI = &get_instance();
        
        $value = $CI->session->flashdata($_name);
        
        $smarty->assign($_assign, $value);
    }

    if ($smarty->debugging) {
        $_params = array();
        require_once(SMARTY_CORE_DIR . 'core.get_microtime.php');
        $smarty->_smarty_debug_info[] = array('type' => 'config',
            'filename' => $_file . ' [' . $_section . '] ' . $_scope,
            'depth' => $smarty->_inclusion_depth,
            'exec_time' => smarty_core_get_microtime($_params, $smarty) - $_debug_start_time);
    }
}

/* vim: set expandtab: */
?>
