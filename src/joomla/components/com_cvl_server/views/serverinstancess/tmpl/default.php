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
$currenturl = JURI::current();
jimport('cvl.userVmAccount');

if ($_POST['formDelete'] == "Delete") {
    // Delete VM account
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $session = & JFactory::getSession();
    $vm = unserialize($session->get("VmObject"));
    $vmIndex = $vm->getVmIndex();
    $vmDbId = $vm->getVmId($vmIndex);
    $serverIp = $vm->getVmIp($vmIndex);
    $vmUserIdIndex = $_POST['UserAccount'];
    $vmUserId = $vm->getUserId($vmUserIdIndex);
    $vmUserName = $vm->getUserName($vmUserIdIndex);
    $mypath = $cvl->getPath();
    $session->clear("VmObject");
    exec("$mypath/CvlUserManagement.py --action 3 --user_id $vmUserId --username $vmUserName --vm_db_id $vmDbId --server_ip $serverIp --path $mypath", $output, $returnCode);
    //if ($returnCode == 0) {
    //    $cvl->postMessage("Delete user account is done.");
    //} else {
    //    $cvl->postMessage("Delete user account failed 2");
    //}
    $cvl->postMessage($output[0]);
} else if ($_POST['formDelete'] == "Confirm") {
    // Delete VM instance
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $session = & JFactory::getSession();
    $vm = unserialize($session->get("VmObject"));
    $vmIndex = $vm->getVmIndex();
    $vmDbId = $vm->getVmId($vmIndex);
    $vmInstanceId = $vm->getVmInstanceId($vmIndex);
    $serverIp = $vm->getVmIp($vmIndex);
    $serverName = $vm->getVmName($vmIndex);
    $mypath = $cvl->getPath();
    $session->clear("VmObject");
    exec("$mypath/CvlUserManagement.py --action 8 --vm_db_id $vmDbId --server_id $vmInstanceId --server_ip $serverIp --server_name '$serverName' --path $mypath", $output, $returnCode);
    //if ($returnCode == 0) {
    //    $cvl->postMessage("Terminate VM instance is done.");
    //} else {
    //    $cvl->postMessage("Terminate VM instance failed, there may be more user accounts in the VM");
    // }
    $cvl->postMessage($output[0]);
} else if ($_POST['formDelete'] == "Select") {
    $vmIndex = $_POST['vm'];
    $session =& JFactory::getSession();
    $vm = unserialize($session->get("VmObject"));
    $vmDbId = $vm->getVmId($vmIndex);
    $serverIp = $vm->getVmIp($vmIndex);
    $serverName = $vm->getVmName($vmIndex);
    $vm->setVmIndex($vmIndex);
    $vm->fetchVmUser($vmDbId);
    $username = $vm->getUserNameList();
    $userListLength = $vm->getUserVmListLength();
    $session->set("VmObject", serialize($vm));
    exec("echo 'Length: $userListLength' >> /tmp/cvldesktopinstaller_php.log");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Delete VM account form</title>
</head>
<body>
<?php
if (!empty($errorMessage)) {
echo("<p>There was an error with your form:</p>\n");
echo("<ul>" . $errorMessage . "</ul>\n");
}
?>
<form action="<?php echo $currenturl ?>" method="post">
<?php
    if ($userListLength == 0) {
        echo "Are you sure you want to terminate VM instance: '$serverName' ($serverIp)?";
?>
<p>
<p>
<input type="submit" name="formDelete" value="Confirm" />
<input type="submit" name="formDelete" value="Cancel" />
</p>
</p>
<?php
    } else {
        echo "Select a user account to be removed from $serverName ($serverIp)";
?>
<p>
<table>
<td align="left">User account:</td>
<td align="right">
<select name = "UserAccount" width="100" " style="width: 200px">
<?php
    for ($i = 0; $i < $userListLength; $i++) {
?>
<option value=<?php echo $i ?>><?php echo $username[$i] ?></option>
<?php
    }
?>
</select>
</td>
</tr>
</table>
</p>
<p>
<p>
<input type="submit" name="formDelete" value="Delete" />
<input type="submit" name="formDelete" value="Cancel" />
</p>
</p>
<?php } ?>
</form>
</body>
</html>
<?php 
} else {
    $vm = JUserVmAccount::getInstance();
    $session =& JFactory::getSession();
    $session->set("VmObject", serialize($vm));
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Delete VM Form</title>
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
<td align="left">VM list:</td>
<td align="right">
<select name = "vm" width="100" style="width: 200px">
<?php
$vmListLength = $vm->getVmListLength();
$vmOptionValue = $vm->getVmOptionValue();
if($vmListLength > 0) {
    for ($i = 0; $i < $vmListLength; $i++) {
?>
<option value=<?php echo $i ?>><?php echo $vmOptionValue[$i] ?></option>
<?php
    }
}
?>
</select>
</td>
</tr>
</table>

<p>
<p>
<input type="submit" name="formDelete" value="Select" />
</p>
</p>
</form>
</body>
</html>
<?php } ?>
