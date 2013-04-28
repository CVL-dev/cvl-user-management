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
jimport('cvl.user');
$myself = & JFactory::getUser();

if ($_POST['formSubmit'] == "Add VM Account") {
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $serverName = trim($_POST['vmName']);
    if ($userListLength > 0) {
        $vmUserId = $_POST['VmUser'];
    } else {
        $vmUserId = $myself->id;
    }
    $nectar = $_POST["Nectar"];
    $mypath = $cvl->getPath();
    // exec("$mypath/CvlUserManagement.py --action 9 --user_id $vmUserId --server_name '$serverName' --nectar_id $nectar --path $mypath", $output, $returnCode);
    // if ($returnCode == 0) {
    //     $cvl->postMessage("Adding user account is done.");
    // } else {
    //     $cvl->postMessage("Adding user account failed");
    // }
    $cvl->postMessage("Not implemented.");
} else {
    $currenturl = JURI::current();
    $user = JCvlUser::getInstance();
    $excludeUser = FALSE;
    $user->fetchVmUserId($myself->id, $excludeUser);
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

<p> <b> NOT IMPLEMENTED! </b> </p>
<table>

<tr>
<td align="left">Server name:</td>
<td align="right"><input type="text" name="vmName" maxlength="50" value="CvlLab1" size = "26"/></td>
</tr>

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
<td align="left">User name:</td>
<td align="right">
<select name = "VmUser" width="100" " style="width: 200px">
<?php
$userListLength = $user->getUserListLength();
if($userListLength > 0) {
    $username = $user->getUserNameList();
    $userId = $user->getUserIdList();
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
<input type="submit" name="formSubmit" value="Add VM Account" />
</p>
</form>
</body>
</html>
<?php } ?>

