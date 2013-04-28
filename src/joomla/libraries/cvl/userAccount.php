<?php
/**
 * CVL User Management Copyright (C) 2013 Monash University
 *
 * GNU General Public License version 2 or later.
 *
 * Bug report: jupiter.hu@monash.edu or jupiter.hce@gmail.com 
 */
defined('_JEXEC') or die;

class JCvlUserAccount extends JObject 
{
    protected $userId = array();
    protected $username = array();
    protected $email = array();
    protected $projectGroup = array();
    protected $nectarId = array();
    protected $nectarName = array();
    protected $userListLength = 0;
    protected $nectarListLength = 0;

    public static function getInstance() {
        return new JCvlUser();
    }

    public function __construct() {
        exec("echo 'JCvlUser construct' >> /tmp/cvldesktopinstaller_php.log");
        $this->init();
    }
    
    public function __destruct() {
        exec("echo 'JCvlUser destruct' >> /tmp/cvldesktopinstaller_php.log");
    }

    public function getUserId($index) {
        return $this->userId[$index];
    }

    public function getUserName($index) {
        return $this->username[$index];
    }
    
    public function getUserNameList() {
        return $this->username;
    }
    
    public function getUserEmail($index) {
        return $this->email[$index];
    }

    public function getProjectGroup($index) {
        return $this->projectGroup[$index];
    }
    
    public function getUserListLength() {
        return $this->userListLength;
    }

    public function getNectarListLength() {
        return $this->nectarListLength;
    }
    
    public function getNectarId() {
        return $this->nectarId;
    }
    
    public function getNectarName() {
        return $this->nectarName;
    }

    public function init() {
        jimport('cvl.utility');
        JCvlUtility::fetchUserData(&$this->userId, &$this->username, &$this->projectGroup, &$this->email, &$this->userListLength);
        JCvlUtility::fetchNectarData(&$this->nectarId, &$this->nectarName, &$this->nectarListLength);
    }
}

