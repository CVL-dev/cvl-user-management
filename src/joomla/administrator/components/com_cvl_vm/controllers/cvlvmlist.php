<?php
/**
 * @version     1.0.1
 * @package     com_cvl_vm
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Cvlvmlist controller class.
 */
class Cvl_vmControllerCvlvmlist extends JControllerForm
{

    function __construct() {
        $this->view_list = 'cvlvmlists';
        parent::__construct();
    }

}