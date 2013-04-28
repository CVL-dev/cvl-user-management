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

class Cvl_vmController extends JController
{
	/**
	 * Method to display a view.
	 *
	 * @param	boolean			$cachable	If true, the view output will be cached
	 * @param	array			$urlparams	An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return	JController		This object to support chaining.
	 * @since	1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
		require_once JPATH_COMPONENT.'/helpers/cvl_vm.php';

		// Load the submenu.
		Cvl_vmHelper::addSubmenu(JRequest::getCmd('view', 'cvlvmlists'));

		$view		= JRequest::getCmd('view', 'cvlvmlists');
        JRequest::setVar('view', $view);

		parent::display();

		return $this;
	}
}
