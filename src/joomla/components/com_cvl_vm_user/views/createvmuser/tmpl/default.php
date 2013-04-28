<?php
/**
 * @version     1.0.0
 * @package     com_cvl_vm_user
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */


// no direct access
defined('_JEXEC') or die;
jimport('cvl.userVmAccount');

//$currenturl = JURI::current();
//$myself = & JFactory::getUser();
//jimport('cvl.userVmAccount');
//$vmId = array();
//$vmIp = array();
//$vmName = array();
//$vmState = array();
//$vmOptionValue = array();
//$vmListLength = 0;
//jimport('cvl.utility');
//JCvlUtility::fetchVmList(&$vmId, &$vmName, &$vmIp, &$vmState, &$vmOptionValue, $vmListLength);

//$vmProjectGroupId = array();
//$vmProjectGroupName = array();
//$vmProjectLength = 0;
//JCvlUtility::fetchProjectGroup(&$vmProjectGroupId, &$vmProjectGroupName, &$vmProjectLength);

if ($_POST['CreateVmUserSubmit'] == "Submit") {
    jimport('cvl.library');
    $library = JCvlLibrary::getInstance();
    $mypath = $library->getPath();
    $vmUserName = trim($_POST['uName']);
    $vmUserUsername = trim($_POST['uUsername']);
    $vmUserPassword = trim($_POST['uPassword']);
    $vmUserAccessLevel = $_POST['uAccessLevel'];
    $vmUserEmail = trim($_POST['uEmail']);
    $session = & JFactory::getSession();
    $vm = unserialize($session->get("VmObject"));
    $vmProjectGroupIndex = $_POST['uProjectGroup'];
    $projectGroupId = $vm->getProjectGroupId($vmProjectGroupIndex);
    $vmUserOrgnization = $_POST['uOrganization'];
    $vmUserApprovedBy = $_POST['uApprovedBy'];
    $vmUserMassiveAccount = trim($_POST['uMassive']);
    $vmIndex = $_POST['defaultVm'];
    $vmUserVmId = 0;
    $vmUserVmIp = "0.0.0.0";
    $vmListLength = $vm->getVmListLength();
    if ($vmListLength > 0) {
        $vmUserVmId = $vm->getVmId($vmIndex);
        $vmUserVmIp = $vm->getVmIp($vmIndex);
    } 
    $myself = & JFactory::getUser();
    $createBy = $myself->name;
    $encryptedPassword = $library->getEncryptedPassword($vmUserPassword);
    $session->clear("VmObject");
//    echo "--path $mypath --userfullname '$vmUserName' --username '$vmUserUsername' --password '$vmUserPassword' --crypted_password $encryptedPassword --access_level $vmUserAccessLevel --email '$vmUserEmail' --project_group $projectGroupId --organization '$vmUserOrgnization' --approvedby '$vmUserApprovedBy' --createdby '$createBy' --massive_account '$vmUserMassiveAccount' --vm_db_id $vmUserVmId --server_ip $vmUserVmIp";

    exec("$mypath/CvlUserManagement.py --action 6 --path $mypath --userfullname '$vmUserName' --username '$vmUserUsername' --password '$vmUserPassword' --crypted_password $encryptedPassword --access_level $vmUserAccessLevel --email '$vmUserEmail' --project_group $projectGroupId --organization '$vmUserOrgnization' --approvedby '$vmUserApprovedBy' --createdby '$createBy' --massive_account '$vmUserMassiveAccount' --vm_db_id $vmUserVmId --server_ip $vmUserVmIp", $output, $returnCode);
    if ($returnCode == 0) {
        $library->userAccountNotification($vmUserEmail, $vmUserName, $vmUserUsername, $vmUserPassword);
        exec("echo 'send email notification done' >> /tmp/cvldesktopinstaller_php.log");
        $library->postMessage("Creating VM user is done.");
    } else {
        $library->postMessage("Creating VM failed.");
    }
} else {
    $vm = JUserVmAccount::getInstance();
    $vm->fetchProjectGroup();
    $session =& JFactory::getSession();
    $session->set("VmObject", serialize($vm));
    $vmListLength = $vm->getVmListLength();
    $vmOptionValue = $vm->getVmOptionValue();
    $currenturl = JURI::current();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Create VM user form</title>
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
<td align="left">Name:</td>
<td align="right"><input type="text" name="uName" maxlength="64" value="" size = "22" /></td>
</tr>
<tr>
<td align="left">Login name:</td>
<td align="right"><input type="text" name="uUsername" maxlength="64" value="" size = "22" /></td>
</tr>

<tr>
<td align="left">Password:</td>
<td align="right"><input type="password" name="uPassword" maxlength="64" value="" size = "22" /></td>
</tr>

<tr>
<td align="left">Email:</td> 
<td align="right"><input type="text" name="uEmail" maxlength="100" value="" size = "22" /></td>
</tr>
<tr>

<tr>
<td align="left">Access level:</td> 
<td align="right">
<select name = "uAccessLevel" width="100" " style="width: 170px">
<option value=1>User</option>
<option value=2>Administrator</option>
</select>
</td>
</tr>
<tr>

<tr>
<td align="left">Project group:</td> 
<td align="right">
<select name = "uProjectGroup" width="100" " style="width: 170px">
<?php
$vmProjectLength = $vm->getProjectLength();
if($vmProjectLength > 0) {
    $vmProjectGroupName = $vm->getProjectGroupName();
    for ($i = 0; $i < $vmProjectLength; $i++) {
?>
<option value = <?php echo $i ?>><?php echo $vmProjectGroupName[$i] ?></option>
<?php 
    } 
} ?>
</select>
</td>
</tr>

<tr>
<td align="left">Organization:</td>
<td align="right"><input type="text" name="uOrganization" maxlength="100" value="" size = "22" /></td>
</tr>

<tr>
<td align="left">MASSIVE account:</td>
<td align="right"><input type="text" name="uMassive" maxlength="100" value="" size = "22" /></td>
</tr>

<tr>
<td align="left">Approved by:</td>
<td align="right"><input type="text" name="uApprovedBy" maxlength="100" value="" size = "22" /></td>
</tr>
<tr>
<td align="left">VM IP:</td>
<td align="right"><select name = "defaultVm" style="width: 170px">
<?php
if($vmListLength > 0) {
    for ($i = 0; $i < $vmListLength; $i++) {
?>
<option value = <?php echo $i ?>><?php echo $vmOptionValue[$i] ?></option>
<?php
    }
} else {
?>
<option value = 0>No VM found</option>
<?php } ?>
</select></td>
</tr>
</table>
<p>
<input type="submit" name="CreateVmUserSubmit" value="Submit" />
</p>
</form>
</body>
</html>
<?php } ?>




