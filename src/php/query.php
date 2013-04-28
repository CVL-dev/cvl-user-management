<?php
define('_JEXEC', 1);
define('DS', DIRECTORY_SEPARATOR);
if (file_exists(dirname(__FILE__) . '/defines.php')) {
    include_once dirname(__FILE__) . '/defines.php';
}
if (!defined('_JDEFINES')) {
    define('JPATH_BASE', dirname(__FILE__));
    require_once JPATH_BASE.'/includes/defines.php';
}
require_once JPATH_BASE .'/includes/framework.php';
require_once JPATH_BASE . '/libraries/import.php';
require_once JPATH_BASE . '/libraries/loader.php';

header('Cache-Control: no-cache, must-revalidate');
header('Expires: ' . date("Y-m-d H:i:s", strtotime ("+1 second")));
header('Content-type: application/json');

if ($_POST["query"] == "Send to user management") {
    $error = array("error" => "error");
    exec("echo 'POST: query string match' >> /tmp/cvldesktopinstaller_php.log");
    $jQuery = $_POST['queryMessage'];

    $query = json_decode($jQuery, TRUE);
    if (array_key_exists("username", $query) == FALSE) {
        $error["error"] = "Missing username";
        exec("echo 'Missing username' >> /tmp/cvldesktopinstaller_php.log");
        echo json_encode($error);
        return FALSE;
    }
    if (array_key_exists("password", $query) == FALSE) {
        $error["error"] = "Missing password";
        exec("echo 'Missing password' >> /tmp/cvldesktopinstaller_php.log");
        echo json_encode($error);
        return FALSE;
    }
    $username = $query["username"];
    $password = $query["password"];

    exec("echo '$username' >> /tmp/cvldesktopinstaller_php.log");

    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $mypath = $cvl->getPath();
    if ($cvl->credential($username, $password) === FALSE) {
        $error["error"] = "Failed authentication";
        exec("echo 'failed authentication' >> /tmp/cvldesktopinstaller_php.log");
        echo json_encode($error);
        return FALSE;
    }
    
    exec("echo 'Pass authentication' >> /tmp/cvldesktopinstaller_php.log");

    exec("$mypath/CvlCommunication.py '$jQuery'", $output, $returnCode);

    if ($returnCode == 0) {
        echo $output[0];
    } else {
        $error["error"] = "System error";
        exec("echo 'System error' >> /tmp/cvldesktopinstaller_php.log");
        echo json_encode($error);
        return FALSE;
    }
    return TRUE;
}
?>


