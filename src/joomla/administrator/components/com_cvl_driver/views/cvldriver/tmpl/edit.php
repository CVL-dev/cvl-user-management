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

JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet('components/com_cvl_driver/assets/css/cvl_driver.css');
?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'cvldriver.cancel' || document.formvalidator.isValid(document.id('cvldriver-form'))) {
			Joomla.submitform(task, document.getElementById('cvldriver-form'));
		}
		else {
			alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED'));?>');
		}
	}
</script>

<form action="<?php echo JRoute::_('index.php?option=com_cvl_driver&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="cvldriver-form" class="form-validate">
	<div class="width-60 fltlft">
		<fieldset class="adminform">
			<legend><?php echo JText::_('COM_CVL_DRIVER_LEGEND_CVLDRIVER'); ?></legend>
			<ul class="adminformlist">

            
			<li><?php echo $this->form->getLabel('id'); ?>
			<?php echo $this->form->getInput('id'); ?></li>

            
			<li><?php echo $this->form->getLabel('created_by'); ?>
			<?php echo $this->form->getInput('created_by'); ?></li>

            
			<li><?php echo $this->form->getLabel('driver_id'); ?>
			<?php echo $this->form->getInput('driver_id'); ?></li>

            
			<li><?php echo $this->form->getLabel('driver_description'); ?>
			<?php echo $this->form->getInput('driver_description'); ?></li>

            
			<li><?php echo $this->form->getLabel('image_id'); ?>
			<?php echo $this->form->getInput('image_id'); ?></li>

            
			<li><?php echo $this->form->getLabel('ssh_key'); ?>
			<?php echo $this->form->getInput('ssh_key'); ?></li>

            
			<li><?php echo $this->form->getLabel('security_group'); ?>
			<?php echo $this->form->getInput('security_group'); ?></li>

            

            <li><?php echo $this->form->getLabel('state'); ?>
                    <?php echo $this->form->getInput('state'); ?></li><li><?php echo $this->form->getLabel('checked_out'); ?>
                    <?php echo $this->form->getInput('checked_out'); ?></li><li><?php echo $this->form->getLabel('checked_out_time'); ?>
                    <?php echo $this->form->getInput('checked_out_time'); ?></li>

            </ul>
		</fieldset>
	</div>


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