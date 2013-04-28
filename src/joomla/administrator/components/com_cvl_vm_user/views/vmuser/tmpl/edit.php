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

JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('behavior.keepalive');
// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet('components/com_cvl_vm_user/assets/css/cvl_vm_user.css');
?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'vmuser.cancel' || document.formvalidator.isValid(document.id('vmuser-form'))) {
			Joomla.submitform(task, document.getElementById('vmuser-form'));
		}
		else {
			alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED'));?>');
		}
	}
</script>

<form action="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&layout=edit&id='.(int) $this->item->id); ?>" method="post" enctype="multipart/form-data" name="adminForm" id="vmuser-form" class="form-validate">
	<div class="width-60 fltlft">
		<fieldset class="adminform">
			<legend><?php echo JText::_('COM_CVL_VM_USER_LEGEND_VMUSER'); ?></legend>
			<ul class="adminformlist">
                
				<li><?php echo $this->form->getLabel('id'); ?>
				<?php echo $this->form->getInput('id'); ?></li>
				<li><?php echo $this->form->getLabel('state'); ?>
				<?php echo $this->form->getInput('state'); ?></li>
				<li><?php echo $this->form->getLabel('created_by'); ?>
				<?php echo $this->form->getInput('created_by'); ?></li>
				<li><?php echo $this->form->getLabel('vm_password'); ?>
				<?php echo $this->form->getInput('vm_password'); ?></li>
				<li><?php echo $this->form->getLabel('username'); ?>
				<?php echo $this->form->getInput('username'); ?></li>
				<li><?php echo $this->form->getLabel('email'); ?>
				<?php echo $this->form->getInput('email'); ?></li>
				<li><?php echo $this->form->getLabel('vnc_password'); ?>
				<?php echo $this->form->getInput('vnc_password'); ?></li>
				<li><?php echo $this->form->getLabel('organisation'); ?>
				<?php echo $this->form->getInput('organisation'); ?></li>
				<li><?php echo $this->form->getLabel('driver_id'); ?>
				<?php echo $this->form->getInput('driver_id'); ?></li>
				<li><?php echo $this->form->getLabel('name'); ?>
				<?php echo $this->form->getInput('name'); ?></li>
				<li><?php echo $this->form->getLabel('current_vm_id'); ?>
				<?php echo $this->form->getInput('current_vm_id'); ?></li>
				<li><?php echo $this->form->getLabel('authentication_token'); ?>
				<?php echo $this->form->getInput('authentication_token'); ?></li>
				<li><?php echo $this->form->getLabel('appoved_by'); ?>
				<?php echo $this->form->getInput('appoved_by'); ?></li>
				<li><?php echo $this->form->getLabel('register_date'); ?>
				<?php echo $this->form->getInput('register_date'); ?></li>
				<li><?php echo $this->form->getLabel('group'); ?>
				<?php echo $this->form->getInput('group'); ?></li>


            </ul>
		</fieldset>
	</div>
    
    <div class="clr"></div>

<?php if (JFactory::getUser()->authorise('core.admin','cvl_vm_user')): ?>
	<div class="width-100 fltlft">
		<?php echo JHtml::_('sliders.start', 'permissions-sliders-'.$this->item->id, array('useCookie'=>1)); ?>
		<?php echo JHtml::_('sliders.panel', JText::_('ACL Configuration'), 'access-rules'); ?>
		<fieldset class="panelform">
			<?php echo $this->form->getLabel('rules'); ?>
			<?php echo $this->form->getInput('rules'); ?>
		</fieldset>
		<?php echo JHtml::_('sliders.end'); ?>
	</div>
<?php endif; ?>

	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>
	<div class="clr"></div>

    <style type="text/css">
        /* Temporary fix for drifting editor fields */
        .adminformlist li {
            clear: both;
        }
    </style>
</form>