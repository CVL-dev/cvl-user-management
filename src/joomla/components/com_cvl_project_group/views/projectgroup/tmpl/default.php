<?php
/**
 * @version     1.0.0
 * @package     com_cvl_project_group
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      jupiter <jupiter.hce@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;

//Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_cvl_project_group', JPATH_ADMINISTRATOR);
?>
<?php if( $this->item ) : ?>

    <div class="item_fields">
        
        <ul class="fields_list">

			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_ID'); ?>:
			<?php echo $this->item->id; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_ORDERING'); ?>:
			<?php echo $this->item->ordering; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_STATE'); ?>:
			<?php echo $this->item->state; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_CHECKED_OUT'); ?>:
			<?php echo $this->item->checked_out; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_CHECKED_OUT_TIME'); ?>:
			<?php echo $this->item->checked_out_time; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_CREATED_BY'); ?>:
			<?php echo $this->item->created_by; ?></li>
			<li><?php echo JText::_('COM_CVL_PROJECT_GROUP_FORM_LBL_PROJECTGROUP_PROJECT_GROUP_NAME'); ?>:
			<?php echo $this->item->project_group_name; ?></li>


        </ul>
        
    </div>
    <?php if(JFactory::getUser()->authorise('core.edit.own', 'com_cvl_project_group.projectgroup.'.$this->item->id)): ?>
		<a href="<?php echo JRoute::_('index.php?option=com_cvl_project_group&task=projectgroup.edit&id='.$this->item->id); ?>">Edit</a>
	<?php endif; ?>
								<?php if(JFactory::getUser()->authorise('core.delete','com_cvl_project_group.projectgroup.'.$this->item->id)):
								?>
									<a href="javascript:document.getElementById('form-projectgroup-delete-<?php echo $this->item->id ?>').submit()">Delete</a>
									<form id="form-projectgroup-delete-<?php echo $this->item->id; ?>" style="display:inline" action="<?php echo JRoute::_('index.php?option=com_cvl_project_group&task=projectgroup.remove'); ?>" method="post" class="form-validate" enctype="multipart/form-data">
										<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
										<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
										<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
										<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
										<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />
										<input type="hidden" name="jform[created_by]" value="<?php echo $this->item->created_by; ?>" />
										<input type="hidden" name="jform[project_group_name]" value="<?php echo $this->item->project_group_name; ?>" />
										<input type="hidden" name="option" value="com_cvl_project_group" />
										<input type="hidden" name="task" value="projectgroup.remove" />
										<?php echo JHtml::_('form.token'); ?>
									</form>
								<?php
								endif;
							?>
<?php else: ?>
    Could not load the item
<?php endif; ?>
