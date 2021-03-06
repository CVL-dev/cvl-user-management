<?php
/**
 * @version     1.0.0
 * @package     com_cvl_project_group
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Projectgroup controller class.
 */
class Cvl_project_groupControllerProjectgroup extends JControllerForm
{

    function __construct() {
        $this->view_list = 'projectgroups';
        parent::__construct();
    }

}