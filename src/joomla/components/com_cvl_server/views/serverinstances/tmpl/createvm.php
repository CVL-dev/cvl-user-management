<?php
/**
 * @version     1.0.0
 * @package     com_cvl_server
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;

//Load admin language file
//$lang = JFactory::getLanguage();
//$lang->load('com_cvl_server', JPATH_ADMINISTRATOR);
?>
<?php 
$cpu = $_GET[cpu];
echo "cpu = $cpu";

//$myself = & JFactory::getUser();
//echo $myself->id;
//echo $myself->name;
//echo "*";
//echo $myself->serverPassword;
//echo "*";
//echo $myself->vncPassword;
//exec("~/bin/CvlUserManagement.py --action 1 --driver 4 --days 1 --user_id $myself->id --username $myself->name --password $myself->serverPassword", $output, $returnCode);

//echo "return code: $returnCode";

//$mdb = JFactory::getDbo();
//$mquery = $mdb->getQuery(true);
//$mquery->select('a.name')->from('#__users AS a');
//$mdb->setQuery($mquery);
?>
