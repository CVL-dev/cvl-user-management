<?php
/**
 * @version     1.0.0
 * @package     com_cvl_server
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Serverinstances controller class.
 */
class Cvl_serverControllerServerinstances extends JControllerForm
{

    function __construct() {
        $this->view_list = 'serverinstancess';
        parent::__construct();
    }

}