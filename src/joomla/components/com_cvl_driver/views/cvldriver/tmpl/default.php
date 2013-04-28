<?php
/**
 * @version     1.0.1
 * @package     com_cvl_driver
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;

if ($_POST['ChangePassword'] == "Update") {
    $myself = & JFactory::getUser();
    $myname = $myself->username;
    $myid = $myself->id;
    $mypassword = $myself->password;
    jimport('cvl.library');
    $cvl = JCvlLibrary::getInstance();
    $mypath = $cvl->getPath();
    $currentPassword = trim($_POST['CurrentPassword']);
    $newPassword = trim($_POST['NewPassword']);
    echo "new password = " . $newPassword;

    if ($cvl->authentication($currentPassword, $mypassword) == TRUE) {
        $newEncryptedPassword = $cvl->getEncryptedPassword($newPassword);
        exec("$mypath/CvlUserManagement.py --action 5 --username $myname --user_id $myid --password $newPassword --crypted_password $newEncryptedPassword --path $mypath", $output, $returnCode); 
        if ($returnCode == 0) {
            $cvl->postMessage("Change password is done.");
        } else {
            $cvl->postMessage("Change password failed.");
        }
    } else {
        $cvl->postMessage("Authentication failed.");
    }

} else {
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
<td align="left">Current password:</td>
<td align="right"><input type="password" name="CurrentPassword" maxlength="64" value="" /></td>
</tr>

<tr>
<td align="left">New password:</td>
<td align="right"><input type="password" name="NewPassword" maxlength="64" value="" /></td>
</tr>

</tr>
</table>
<p>
<input type="submit" name="ChangePassword" value="Update" />
</p>
</form>
</body>
</html>
<?php } ?>

