<?php
/**
 * CVL User Management Copyright (C) 2013 Monash University
 *
 * GNU General Public License version 2 or later.
 *
 * Bug report: jupiter.hu@monash.edu or jupiter.hce@gmail.com
 */

defined('_JEXEC') or die;

class JCvlLibrary extends JObject
{
    protected static $_mypath = "";
    protected static $config_mailfrom = "";
    protected static $config_fromname = "";
    protected static $config_siteurl = "";

    public static function getInstance() {
        return new JCvlLibrary();
    }

    public function __construct() {
        if (self::$_mypath == "") {
            $this->setup();
        }
    }

    public function setup() {
        self::$_mypath = "/opt/cvl-user-management/python"; //  JPATH_LIBRARIES . "/cvl/extension"; // EDIT_THIS
        $config =& JFactory::getConfig();
        self::$config_mailfrom = $config->getValue("mailfrom");
        self::$config_fromname = $config->getValue("fromname");
        self::$config_siteurl = $config->getValue("siteurl");
    }

    public function getPath() {
        return self::$_mypath;
    }

    public function logout() {
        $app = JFactory::getApplication();
        $error = $app->logout();
        // Check if the log out succeeded.
        if (!($error instanceof Exception)) {
            // Get the return url from the request and validate that it is internal.
            $return = JRequest::getVar('return', '', 'method', 'base64');
            $return = base64_decode($return);
            if (!JURI::isInternal($return)) {
                $return = '';
            }

            // Redirect the user.
            $app->redirect(JRoute::_($return, false));
        } else {
            $app->redirect(JRoute::_('index.php?option=com_users&view=login', false));
        }
    }
    
    public function postMessage($m) {
        JLog::add(JText::_('CVL message'));
        jimport('cvl.post');
        $post = new JCvlPost;
        $post->message($m);
    }

    public function getEncryptedPassword($clearPassword) {
        $salt = JUserHelper::genRandomPassword(32);
        $encryptedPassword = JUserHelper::getCryptedPassword($clearPassword, $salt);
        return $encryptedPassword . ":" . $salt;
    }

    public function credential($username, $password) {
        $encryptedPassword = $this->getPassword($username);
        return $this->authentication($password, $encryptedPassword);
    }

    public function getPassword($username) {
        $password = "";
        $mdb = JFactory::getDbo();
        $msqi = "select password from Cvl_users where username = \"" . $username . "\"";
        $mdb->setQuery($msqi);
        $vm = $mdb->loadObjectList();
        if (count($vm) > 0) {
            $v = $vm[0];
            $password = $v->password;
        }

        return $password;
    }

    public function authentication($clearPassword, $encryptedPassword) {
        $passed = FALSE;
        $mix = explode(":", $encryptedPassword);
        $crypt = $mix[0];
        $salt = $mix[1];

        $inputCryptPassword = JUserHelper::getCryptedPassword($clearPassword, $salt);
        if ($inputCryptPassword == $crypt) {
            $passed = TRUE; 
        }

        return $passed;
    }

    public function sendEmail($emailAddress, $subject, $body) {
        JFactory::getMailer()->sendMail(self::$config_mailfrom, self::$config_fromname, $emailAddress, $subject, $body);    
    }

    public function userAccountNotification($email, $fullName, $username, $password, $ip) {
        $subject = "User account register notification";
        $body = "Hi " . $fullName . ",\n\n";
        $body .= "Your CVL user account is created, you may login to " . self::$config_siteurl . " and change your password using the following username and password:\n\n";
        $body .= "Username: " . $username . "\n";
        $body .= "Password: " . $password . "\n\n";
        $body .= "Regards,\n\n";
        $body .= self::$config_fromname;

        $fromname = self::$config_fromname;
        $siteurl = self::$config_siteurl;
        $mailfrom = self::$config_mailfrom;
        exec("echo 'Create user account and send email to $email' >> /tmp/cvldesktopinstaller_php.log");    
        $this->sendEmail($email, $subject, $body);
    }
}
