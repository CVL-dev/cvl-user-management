<?php
/**
 * CVL User Management Copyright (C) 2013 Monash University
 *
 * GNU General Public License version 2 or later.
 *
 * Bug report: jupiter.hu@monash.edu or jupiter.hce@gmail.com 
 */
defined('_JEXEC') or die;

class JUserVmAccount extends JObject 
{
    protected $userId = array();
    protected $username = array();
    protected $vmDbId = array();
    protected $vmInstanceId = array();
    protected $vmName = array();
    protected $vmIp = array();
    protected $vmState = array();
    protected $vmOptionValue = array();
//    protected static $instance = null;
    protected $vmListLength = 0;
    protected $userListLength = 0;
    protected $vmIndex = 0;
    protected $vmProjectGroupId = array();
    protected $vmProjectGroupName = array();
    protected $vmProjectLength = 0;

    public static function getInstance() {
        return new JUserVmAccount();
    }

    public function __construct() {
        exec("echo 'User VM account construct' >> /tmp/cvldesktopinstaller_php.log");
        $this->init();
    }
    
    public function __destruct() {
        exec("echo 'User VM account destruct' >> /tmp/cvldesktopinstaller_php.log");
    }

    public function setVmIndex($index) {
        $this->vmIndex = $index;
    }
    
    public function getUserId($index) {
        return $this->userId[$index];
    }
    
    public function getUserIdList() {
        return $this->userId;
    }

    public function getUserName($index) {
        return $this->username[$index];
    }
    
    public function getUserNameList() {
        return $this->username;
    }

    public function getVmIndex() {
        return $this->vmIndex;
    }

    public function getVmId($index) {
        return $this->vmDbId[$index];
    }

    public function getVmInstanceId($index) {
        return $this->vmInstanceId[$index];
    }

    public function getVmIp($index) {
        return $this->vmIp[$index];
    }
    
    public function getVmName($index) {
        return $this->vmName[$index];
    }

    public function getVmState() {
        return $this->vmState;
    }

    public function fetchVmUser($vmDbId) {
        jimport('cvl.utility');
        JCvlUtility::fetchVmUser(&$this->userId, &$this->username, &$this->userListLength, $vmDbId);
    }

    public function fetchVmUserId($userId, $excludeUser) {
        jimport('cvl.utility');
        JCvlUtility::fetchUserIdList(&$this->userId, &$this->username, &$this->userListLength, $userId, $excludeUser);
    }

    public function getUserVmListLength() {
        return $this->userListLength;
    }

    public function getVmOptionValue() {
        return $this->vmOptionValue;
    }

    public function getVmListLength() {
        $length = $this->vmListLength;
        exec("echo 'getVmListLength $length' >> /tmp/cvldesktopinstaller_php.log");
        return $this->vmListLength;
    }

    public function init() {
        jimport('cvl.utility');
        JCvlUtility::fetchVmList(&$this->vmDbId, &$this->vmName, &$this->vmIp, &$this->vmState, &$this->vmOptionValue, &$this->vmListLength, &$this->vmInstanceId);
        $length = $this->vmListLength;
        exec("echo 'Initialisation $length' >> /tmp/cvldesktopinstaller_php.log");
    }

    public function fetchProjectGroup() {
        jimport('cvl.utility');
        JCvlUtility::fetchProjectGroup(&$this->vmProjectGroupId, &$this->vmProjectGroupName, &$this->vmProjectLength);
    }

    public function getProjectLength() {
        return $this->vmProjectLength;
    }

    public function getProjectGroupName() {
        return $this->vmProjectGroupName;
    }

    public function getProjectGroupId($index) {
        return $this->vmProjectGroupId[$index];
    }
}

