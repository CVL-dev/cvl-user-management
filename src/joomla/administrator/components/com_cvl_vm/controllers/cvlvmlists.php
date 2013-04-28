<?php
/**
 * @version     1.0.1
 * @package     com_cvl_vm
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.controlleradmin');

/**
 * Cvlvmlists list controller class.
 */
class Cvl_vmControllerCvlvmlists extends JControllerAdmin
{
	/**
	 * Proxy for getModel.
	 * @since	1.6
	 */
	public function getModel($name = 'cvlvmlist', $prefix = 'Cvl_vmModel')
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));
		return $model;
	}
}