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
jimport('cvl.user');

$myself = & JFactory::getUser();
$myname = $myself->username;

if ($_POST['formSubmit'] == "Submit") {
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $serverName = trim($_POST['vmName']);
    $cpu = $_POST['cpu'];
    $session = & JFactory::getSession();
    $user = unserialize($session->get("CvlUserObject"));
    exec("echo 'JCvlUser $user' >> /tmp/cvldesktopinstaller_php.log");
    $userListLength = $user->getUserListLength();
    if ($userListLength > 0) {
        $vmUserIdIndex = $_POST['UserAccount'];
        $vmUserId = $user->getUserId($vmUserIdIndex);
        $vmUserName = $user->getUserName($vmUserIdIndex);
        $vmProjectGroup = $user->getProjectGroup($vmUserIdIndex);
        $vmUserEmail = $user->getUserEmail($vmUserIdIndex);
    } else {
        $vmUserId = $myself->id;
        $vmUserName = $myname;
    }
    $nectar = $_POST["Nectar"];
    $mypath = $cvl->getPath(); 
    $session->clear("CvlUserObject");
    exec("$mypath/CvlCheckResource.py $cpu", $output, $returnCode);
    if ($returnCode != 0) {
        $cvl->postMessage("System error.");
    } else {
        $result = $output[0];
        if ($result != "OK") {
            $cvl->postMessage($result);
        } else {
            exec("$mypath/CvlUserManagement.py --action 1 --cpu $cpu --server_name '$serverName' --username '$vmUserName' --user_id $vmUserId --path $mypath --email '$vmUserEmail' --project_group '$vmProjectGroup' --nectar_id $nectar", $output, $returnCode);
            //if ($returnCode == 0) {
            //    $cvl->postMessage("Creating VM is in process, please wait for an email notification when the system software installation and setup process is done.");
            //} else {
            //    $cvl->postMessage("Creating VM failed.");
            //} 
            // $cvl->postMessage(implode("\n", array_slice(1, $output)));
            $cvl->postMessage($output[1]);
        }
    }
} else {
    $user = JCvlUser::getInstance();
    $session =& JFactory::getSession();
    $session->set("CvlUserObject", serialize($user));
    $currenturl = JURI::current();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>My Form</title>
</head>
<body>
<?php
if(!empty($errorMessage)) {
echo("<p>There was an error with your form:</p>\n");
echo("<ul>" . $errorMessage . "</ul>\n");
}
?>
<form action="<?php echo $currenturl ?>" method="post">
<table>

<tr>
<td align="left">NeCTAR site:</td>
<td align="right">
<select name = "Nectar" width="100" " style="width: 200px">
<?php
$nectarListLength = $user->getNectarListLength();
if($nectarListLength > 0) {
    $nectarId = $user->getNectarId();
    $nectarName = $user->getNectarName();
    for ($i = 0; $i < $nectarListLength; $i++) {
?>
<option value=<?php echo $nectarId[$i] ?>><?php echo $nectarName[$i] ?></option>
<?php
    }
}
?>
</select>
</td>
</tr>

<tr>
<td align="left">VM name:</td>
<td align="right"><input type="text" name="vmName" maxlength="100" value="<?php echo $myname; ?>" size = "27" />
</tr>
<tr>
<td align="left">User account:</td>
<td align="right">
<select name = "UserAccount" width="100" " style="width: 200px">
<?php
$userListLength = $user->getUserListLength();
if($userListLength > 0) {
    $username = $user->getUserNameList();
    for ($i = 0; $i < $userListLength; $i++) {
?>
<option value=<?php echo $i ?>><?php echo $username[$i] ?></option>
<?php
    }
}
?>
</select>
</td>
</tr>

<tr>
<td align="left">CPU:</td>
<td align="right">
<select name = "cpu" width="100" " style="width: 200px">
<option value=0>1 CPU</option>
<option value=1>2 CPUs</option>
<option value=4>4 CPUs</option>
<option value=2>8 CPUs</option>
<option value=3>16 CPUs</option>
</select>
</td>
</tr>

<tr>
<td align="left">Request GPU:    </td>
<td align="right">
<input type="checkbox" name="vehicle" value="Bike">   Only available if the GPU is supported<br>
</td>
</tr>
</table>
<p>
<input type="submit" name="formSubmit" value="Submit" />
</p>
</form>
</body>
</html>
<?php } ?>

