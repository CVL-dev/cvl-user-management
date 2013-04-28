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
$lang = JFactory::getLanguage();
$lang->load('com_cvl_vm_user', JPATH_ADMINISTRATOR);
$mid = JRequest::getVar('userid');
jimport('cvl.utility');
$rowLength = 0;
$mrow = JCvlUtility::getOneUserData($mid, &$rowLength);
?>
<?php if( $rowLength > 0 ) : ?>
    <div class="item_fields">
        
        <ul class="fields_list">

			<li><?php echo JText::_('User name'); ?>:
			<?php echo $mrow["name"]; ?></li>
			
            <li><?php echo JText::_('User login name'); ?>:
			<?php echo $mrow["username"]; ?></li>

			<li><?php echo JText::_('COM_CVL_VM_USER_FORM_LBL_VMUSER_ORGANISATION'); ?>:
			<?php echo $mrow["organisation"]; ?></li>

			<li><?php echo JText::_('COM_CVL_VM_USER_FORM_LBL_VMUSER_APPOVED_BY'); ?>:
			<?php echo $mrow["approved_by"]; ?></li>

			<li><?php echo JText::_('COM_CVL_VM_USER_FORM_LBL_VMUSER_REGISTER_DATE'); ?>:
			<?php echo $mrow["registerDate"]; ?></li>

			<li><?php echo JText::_('COM_CVL_VM_USER_FORM_LBL_VMUSER_GROUP'); ?>:
			<?php echo $mrow["project_group"]; ?></li>
<?php
$vmrows = JCvlUtility::getUserVm($mid);
foreach ($vmrows as $vmrow) {
?>
    <li><?php echo JText::_('VM IP'); ?>:
    <?php echo $vmrow["vm_ip"]; ?></li>
<?php } ?>
        </ul>
    </div>
    <?php if(0): ?>
		<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&task=vmuser.edit&id='.$this->item->id); ?>">Edit</a>
	<?php endif; ?>
								<?php if(0):
								?>
									<a href="javascript:document.getElementById('form-vmuser-delete-<?php echo $this->item->id ?>').submit()">Delete</a>
									<form id="form-vmuser-delete-<?php echo $this->item->id; ?>" style="display:inline" action="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&task=vmuser.remove'); ?>" method="post" class="form-validate" enctype="multipart/form-data">
										<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
										<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
										<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
										<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
										<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />
										<input type="hidden" name="jform[created_by]" value="<?php echo $this->item->created_by; ?>" />
										<input type="hidden" name="jform[vm_password]" value="<?php echo $this->item->vm_password; ?>" />
										<input type="hidden" name="jform[username]" value="<?php echo $this->item->username; ?>" />
										<input type="hidden" name="jform[email]" value="<?php echo $this->item->email; ?>" />
										<input type="hidden" name="jform[vnc_password]" value="<?php echo $this->item->vnc_password; ?>" />
										<input type="hidden" name="jform[organisation]" value="<?php echo $this->item->organisation; ?>" />
										<input type="hidden" name="jform[driver_id]" value="<?php echo $this->item->driver_id; ?>" />
										<input type="hidden" name="jform[name]" value="<?php echo $this->item->name; ?>" />
										<input type="hidden" name="jform[current_vm_id]" value="<?php echo $this->item->current_vm_id; ?>" />
										<input type="hidden" name="jform[authentication_token]" value="<?php echo $this->item->authentication_token; ?>" />
										<input type="hidden" name="jform[appoved_by]" value="<?php echo $this->item->appoved_by; ?>" />
										<input type="hidden" name="jform[register_date]" value="<?php echo $this->item->register_date; ?>" />
										<input type="hidden" name="jform[group]" value="<?php echo $this->item->group; ?>" />
										<input type="hidden" name="option" value="com_cvl_vm_user" />
										<input type="hidden" name="task" value="vmuser.remove" />
										<?php echo JHtml::_('form.token'); ?>
									</form>
								<?php
								endif;
							?>
<?php else: ?>
    Could not load the item
<?php endif; ?>
