<?php
/**
 * @version     1.0.1
 * @package     com_cvl_vm
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;
jimport('cvl.userVmAccount');

if ($_POST['formSubmit'] == "Join") {
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $session = & JFactory::getSession();
    $vm = unserialize($session->get("VmObject"));
    $vmIndex = $_POST['vm'];
    $vmDbId = $vm->getVmId($vmIndex); 
    $serverIP = $vm->getVmIp($vmIndex); 
    $serverName = $vm->getVmName($vmIndex); 
    $userListLength = $vm->getUserVmListLength();
    if ($userListLength > 0) {
        $vmUserId = $_POST['VmUser'];
    } else {
        $myself = & JFactory::getUser();
        $vmUserId = $myself->id;
    }
    $mypath = $cvl->getPath();
    $session->clear("VmObject");
    exec("$mypath/CvlUserManagement.py --action 2 --user_id $vmUserId --vm_db_id $vmDbId --server_ip $serverIP --server_name '$serverName' --path $mypath", $output, $returnCode);
    if ($returnCode == 0) {
        $cvl->postMessage("Adding user account is done.");
    } else {
        $cvl->postMessage("Adding user account failed");
    }
} else {
    $vm = JUserVmAccount::getInstance();
    $myself = & JFactory::getUser();
    $excludeUser = FALSE;
    $vm->fetchVmUserId($myself->id, $excludeUser);
    $session =& JFactory::getSession();
    $session->set("VmObject", serialize($vm));
    $currenturl = JURI::current();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Add VM Form</title>
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
<select name = "vm" width="100" " style="width: 200px">
<?php
$vmListLength = $vm->getVmListLength();
if($vmListLength > 0) {
    $vmOptionValue = $vm->getVmOptionValue();
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

<tr>
<td align="left">User name:</td>
<td align="right">
<select name = "VmUser" width="100" " style="width: 200px">
<?php
$userListLength = $vm->getUserVmListLength();
if($userListLength > 0) {
    $userId = $vm->getUserIdList();
    $username = $vm->getUserNameList();
    for ($i = 0; $i < $userListLength; $i++) {
?>
<option value=<?php echo $userId[$i] ?>><?php echo $username[$i] ?></option>
<?php
    }
}
?>
</select>
</td>
</tr>
</table>
<p>
<!--
<button type="submit" name="formSubmit" class="button"><?php echo JText::_('Join'); ?></button>
-->
<input type="submit" name="formSubmit" value="Join" />
</p>
</form>
</body>
</html>
<?php } ?>

