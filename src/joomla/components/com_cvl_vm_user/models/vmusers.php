<?php

/**
 * @version     1.0.0
 * @package     com_cvl_vm_user
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Cvl_vm_user records.
 */
class Cvl_vm_userModelVmusers extends JModelList {

    /**
     * Constructor.
     *
     * @param    array    An optional associative array of configuration settings.
     * @see        JController
     * @since    1.6
     */
    public function __construct($config = array()) {
        parent::__construct($config);
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @since	1.6
     */
    protected function populateState($ordering = null, $direction = null) {
        
        // Initialise variables.
        $app = JFactory::getApplication();

        // List state information
        $limit = $app->getUserStateFromRequest('global.list.limit', 'limit', $app->getCfg('list_limit'));
        $this->setState('list.limit', $limit);

        $limitstart = JFactory::getApplication()->input->getInt('limitstart', 0);
        $this->setState('list.start', $limitstart);
        
        
		if(empty($ordering)) {
			$ordering = 'a.ordering';
		}
        
        // List state information.
        parent::populateState($ordering, $direction);
    }

    /**
     * Build an SQL query to load the list data.
     *
     * @return	JDatabaseQuery
     * @since	1.6
     */
    protected function getListQuery() {
        // Create a new query object.
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select(
                $this->getState(
                        'list.select', 'a.*'
                )
        );
        
        $query->from('`#__cvl_vm_user` AS a');
        

    // Join over the users for the checked out user.
    $query->select('uc.name AS editor');
    $query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');
    
		// Join over the created by field 'created_by'
		$query->select('created_by.name AS created_by');
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');


		// Filter by search in title
		$search = $this->getState('filter.search');
		if (!empty($search)) {
			if (stripos($search, 'id:') === 0) {
				$query->where('a.id = '.(int) substr($search, 3));
			} else {
				$search = $db->Quote('%'.$db->escape($search, true).'%');
                $query->where('( a.vm_password LIKE '.$search.'  OR  a.username LIKE '.$search.'  OR  a.email LIKE '.$search.'  OR  a.vnc_password LIKE '.$search.'  OR  a.organisation LIKE '.$search.'  OR  a.name LIKE '.$search.'  OR  a.authentication_token LIKE '.$search.'  OR  a.appoved_by LIKE '.$search.'  OR  a.group LIKE '.$search.' )');
			}
		}
        


		//Filtering created_by
		$filter_created_by = $this->state->get("filter.created_by");
		if ($filter_created_by) {
			$query->where("a.created_by = '".$filter_created_by."'");
		}

		//Filtering register_date
		$filter_register_date_from = $this->state->get("filter.register_date.from");
		if ($filter_register_date_from) {
			$query->where("a.register_date >= '".$filter_register_date_from."'");
		}
		$filter_register_date_to = $this->state->get("filter.register_date.to");
		if ($filter_register_date_to) {
			$query->where("a.register_date <= '".$filter_register_date_to."'");
		}        
        
        return $query;
    }

}
