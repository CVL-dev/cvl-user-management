<?php
/**
 * @version     1.0.0
 * @package     com_cvl_vm_user
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Vmuser controller class.
 */
class Cvl_vm_userControllerVmuser extends JControllerForm
{

    function __construct() {
        $this->view_list = 'vmusers';
        parent::__construct();
    }

}