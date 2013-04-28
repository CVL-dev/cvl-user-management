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
jimport('cvl.user');

if ($_POST['DeleteVmUserSubmit'] == "Delete") {
    jimport('cvl.library');
    $library = JCvlLibrary::getInstance();
    $mypath = $library->getPath();
    $session = & JFactory::getSession();
    $user = unserialize($session->get("CvlUserObject"));
    $userListLength = $user->getUserListLength();
    if ($userListLength > 0) {
        $vmUserIdIndex = $_POST['UserAccount'];
        $vmUserId = $user->getUserId($vmUserIdIndex);
        $vmUserName = $user->getUserName($vmUserIdIndex);
        $session->clear("CvlUserObject");
        exec("$mypath/CvlUserManagement.py --action 7 --username $vmUserName --user_id $vmUserId --path $mypath", $output, $returnCode);
        if ($returnCode == 0) {
            $library->postMessage("Delete user account is done.");
        } else {
            $library->postMessage("Delete user account failed 1");
        }
    } else {
        $library->postMessage("No user account found");
    }
} else {
    $currenturl = JURI::current();
    $user = JCvlUser::getInstance();
    $excludeUser = TRUE;
    $myself = & JFactory::getUser();
    $user->fetchVmUserId($myself->id, $excludeUser);
    $session =& JFactory::getSession();
    $session->set("CvlUserObject", serialize($user));
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Delete VM user form</title>
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
<td align="left">User account:</td>
<td align="right">
<select name = "UserAccount" width="100" " style="width: 150px">
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
</table>
<p>
<input type="submit" name="DeleteVmUserSubmit" value="Delete" />
</p>
</form>
</body>
</html>
<?php } ?>




