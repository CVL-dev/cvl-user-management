<?php
/**
 * CVL User Management Copyright (C) 2013 Monash University
 *
 * GNU General Public License version 2 or later.
 *
 * Bug report: jupiter.hu@monash.edu or jupiter.hce@gmail.com 
 */
defined('_JEXEC') or die;

class JCvlUtility extends JObject
{
    public static function getVmList() {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select id, vm_server_name, vm_ip from Cvl_cvl_vm";
        $mdb->setQuery($msqi);
        $vmrows = $mdb->loadAssocList();
        return $vmrows;
    }
    
    public static function getUserVmList($userId) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select group_id from Cvl_user_usergroup_map where user_id = " . $userId;
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        $length = count($mrows);
        $groupTitle = "";
        if ($length > 0) {
            $row = $mrows[0];
            $groupId = $mrow["group_id"];
            $mquery = $mdb->getQuery(true);
            $msqi = "select title from Cvl_usergroups where id = " . $groupId;
            $mdb->setQuery($msqi);
            $mrows = $mdb->loadAssocList();
            $length = count($mrows);
            if ($length > 0) {
                $row = $mrows[0];
                $groupTitle = $mrow["title"];
            }
        }
        $mquery = $mdb->getQuery(true);
        if ($groupTitle == "" || $groupTitle == "User") {
            $msqi = "select a.id, a.vm_server_name, a.vm_ip from Cvl_cvl_vm as a left join Cvl_cvl_server_list as b on a.id = b.vmid where b.userid = " . $userId;
        } else {
            $msqi = "select id, vm_server_name, vm_ip from Cvl_cvl_vm";
        }
        $mdb->setQuery($msqi);
        $vmrows = $mdb->loadAssocList();
        $length = count($vmrows);
        return $vmrows;
    }

    public static function getUserVmData($mid) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select b.id, b.vm_server_name, b.vm_ip from Cvl_cvl_server_list as a inner join Cvl_cvl_vm as b on a.vmid = b.id where a.userid = " . $mid;
        $mdb->setQuery($msqi);
        $vmrows = $mdb->loadAssocList();
        return $vmrows;
    }

    public static function getUserVm($mid) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select b.vm_server_name, b.vm_ip from Cvl_cvl_server_list as a inner join Cvl_cvl_vm as b on a.vmid = b.id where a.userid = " . $mid;
        $mdb->setQuery($msqi);
        $vmrows = $mdb->loadAssocList();

        return $vmrows;
    }

    public static function getOneUserData($mid, &$rowLength) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select a.*, b.* from Cvl_cvl_vm_user as a inner join Cvl_users as b where a.userid = b.id and b.id = " . $mid;
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        $rowLength = count($mrows);
        if ($rowLength > 0) {
            $mrow = $mrows[0];
        }
        return $mrow;
    }

    public static function getUserDatabase() {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select a.userid, b.username from Cvl_cvl_vm_user as a inner join Cvl_users as b on a.userid = b.id";
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        $length = count($mrows);
        return $mrows;
    }

    public static function fetchVmList(&$vmDbId, &$vmName, &$vmIp, &$vmState, &$vmOptionValue, &$vmListLength, &$vmId) {
        $mdb = JFactory::getDbo();
        $msqi = "select id, vm_id, vm_server_name, vm_ip, state from Cvl_cvl_vm";
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
//        $vmId = array();
//        $vmName = array();
//        $vmIp = array();
//        $vmState = array();
//        $vmOptionValue = array();
        foreach ($mrows as $mrow) {
            $vmDbId[] = $mrow["id"];
            $vmId[] = $mrow["vm_id"];
            $vmName[] = $mrow["vm_server_name"];
            $vmIp[] = $mrow["vm_ip"];
            $vmState[] = $mrow["state"];
            $vmOptionValue[] = $mrow["vm_server_name"] . ":" . $mrow["vm_ip"];
        }
        $vmListLength = count($vmId);
    }

    public static function fetchNectarData(&$nectarId, &$nectarName, &$nectarListLength) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select provider_id, provider_name from Cvl_cvl_nectar";
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        $nectarId = array();
        $nectarName = array();
        foreach ($mrows as $mrow) {
            $nectarId[] = $mrow["provider_id"];
            $nectarName[] = $mrow["provider_name"];
        }
        $nectarListLength = count($nectarId);
    }
    
    public static function fetchUserData(&$userId, &$username, &$projectGroup, &$email, &$userListLength) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $msqi = "select a.userid, a.project_group, b.username, b.email from Cvl_cvl_vm_user as a inner join Cvl_users as b where a.userid = b.id";
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        foreach ($mrows as $mrow) {
            $userId[] = $mrow["userid"];
            $username[] = $mrow["username"];
            $projectGroup[] = $mrow["project_group"];
            $email[] = $mrow["email"];
        }
        $userListLength = count($userId);
    }
    
    public static function fetchUserIdList(&$userId, &$username, &$userListLength, $myid, $excludeSelf) {
        $mdb = JFactory::getDbo();
        $msqi = "select a.userid, b.username from Cvl_cvl_vm_user as a inner join Cvl_users as b on a.userid = b.id";
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        $userId = array();
        $username = array();
        foreach ($mrows as $mrow) {
            $addToList = TRUE;
            if ($excludeSelf && ($mrow["userid"] == $myid)) {
                $addToList = FALSE;
            }
            if ($addToList) {
                $userId[] = $mrow["userid"];
                $username[] = $mrow["username"];
            }
        }
        $userListLength = count($userId);
    }
    
    public static function fetchVmUser(&$userId, &$username, &$userListLength, $vmId) {
        $mdb = JFactory::getDbo();
        $msqi = "select a.id, a.username from Cvl_users as a left join Cvl_cvl_server_list as b on b.userid = a.id where b.vmid = " . $vmId;
        $mdb->setQuery($msqi);
        $mrows = $mdb->loadAssocList();
        foreach ($mrows as $mrow) {
            $userId[] = $mrow["id"];
            $username[] = $mrow["username"];
        }
        $userListLength = count($userId);
    }


    public static function fetchProjectGroup(&$vmProjectGroupId, &$vmProjectGroupName, &$vmProjectLength) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $mquery->select('a.id, a.project_group_name')->from('#__cvl_project_group AS a');
        $mquery->where('a.id != 1');
        $mdb->setQuery($mquery);
        $vmProjectList = $mdb->loadObjectList();
        $vmProjectLength = count($vmProjectList);
        for ($i = 0; $i < $vmProjectLength; $i++) {
            $project = $vmProjectList[$i];
            $vmProjectGroupId[] = $project->id;
            $vmProjectGroupName[] = $project->project_group_name;
        }
    }

    public static function fetchVmData(&$vmId, &$vmIp, &$vmListLength) {
        $mdb = JFactory::getDbo();
        $mquery = $mdb->getQuery(true);
        $mquery->select('a.id, a.vm_ip')->from('#__cvl_vm AS a');
        $mquery->where('a.state = 2');
        $mdb->setQuery($mquery);
        $vm = $mdb->loadObjectList();
        $vmListLength = count($vm);
        for ($i = 0; $i < $vmListLength; $i++) {
            $v = $vm[$i];
            $vmId[] = $v->id;
            $vmIp[] = $v->vm_ip;
        }
    }
}

