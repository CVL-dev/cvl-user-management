<?php
/**
 * @version     1.0.1
 * @package     com_cvl_driver
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */


// No direct access
defined('_JEXEC') or die;

class Cvl_driverController extends JController
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
		require_once JPATH_COMPONENT.'/helpers/cvl_driver.php';

		// Load the submenu.
		Cvl_driverHelper::addSubmenu(JRequest::getCmd('view', 'drivers'));

		$view		= JRequest::getCmd('view', 'drivers');
        JRequest::setVar('view', $view);

		parent::display();

		return $this;
	}
}
