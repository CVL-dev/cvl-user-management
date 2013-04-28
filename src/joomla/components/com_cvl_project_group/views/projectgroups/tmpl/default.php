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
?>

<div class="items">
    <ul class="items_list">
        <?php $show = false; ?>
        <?php foreach ($this->items as $item) :?>

                
				<?php
					if($item->state == 1 || ($item->state == 0 && JFactory::getUser()->authorise('core.edit.own',' com_cvl_project_group.projectgroup.'.$item->id))):
						$show = true;
						?>
							<li>
								<a href="<?php echo JRoute::_('index.php?option=com_cvl_project_group&view=projectgroup&id=' . (int)$item->id); ?>"><?php echo $item->project_group_name; ?></a>
								<?php
									if(JFactory::getUser()->authorise('core.edit.state','com_cvl_project_group.projectgroup'.$item->id)):
									?>
										<a href="javascript:document.getElementById('form-projectgroup-state-<?php echo $item->id; ?>').submit()"><?php if($item->state == 1):?>Unpublish<?php else:?>Publish<?php endif; ?></a>
										<form id="form-projectgroup-state-<?php echo $item->id ?>" style="display:inline" action="<?php echo JRoute::_('index.php?option=com_cvl_project_group&task=projectgroup.save'); ?>" method="post" class="form-validate" enctype="multipart/form-data">
											<input type="hidden" name="jform[id]" value="<?php echo $item->id; ?>" />
											<input type="hidden" name="jform[ordering]" value="<?php echo $item->ordering; ?>" />
											<input type="hidden" name="jform[state]" value="<?php echo (int)!((int)$item->state); ?>" />
											<input type="hidden" name="jform[checked_out]" value="<?php echo $item->checked_out; ?>" />
											<input type="hidden" name="jform[checked_out_time]" value="<?php echo $item->checked_out_time; ?>" />
											<input type="hidden" name="jform[project_group_name]" value="<?php echo $item->project_group_name; ?>" />
											<input type="hidden" name="option" value="com_cvl_project_group" />
											<input type="hidden" name="task" value="projectgroup.save" />
											<?php echo JHtml::_('form.token'); ?>
										</form>
									<?php
									endif;
									if(JFactory::getUser()->authorise('core.delete','com_cvl_project_group.projectgroup'.$item->id)):
									?>
										<a href="javascript:document.getElementById('form-projectgroup-delete-<?php echo $item->id; ?>').submit()">Delete</a>
										<form id="form-projectgroup-delete-<?php echo $item->id; ?>" style="display:inline" action="<?php echo JRoute::_('index.php?option=com_cvl_project_group&task=projectgroup.remove'); ?>" method="post" class="form-validate" enctype="multipart/form-data">
											<input type="hidden" name="jform[id]" value="<?php echo $item->id; ?>" />
											<input type="hidden" name="jform[ordering]" value="<?php echo $item->ordering; ?>" />
											<input type="hidden" name="jform[state]" value="<?php echo $item->state; ?>" />
											<input type="hidden" name="jform[checked_out]" value="<?php echo $item->checked_out; ?>" />
											<input type="hidden" name="jform[checked_out_time]" value="<?php echo $item->checked_out_time; ?>" />
											<input type="hidden" name="jform[created_by]" value="<?php echo $item->created_by; ?>" />
											<input type="hidden" name="jform[project_group_name]" value="<?php echo $item->project_group_name; ?>" />
											<input type="hidden" name="option" value="com_cvl_project_group" />
											<input type="hidden" name="task" value="projectgroup.remove" />
											<?php echo JHtml::_('form.token'); ?>
										</form>
									<?php
									endif;
								?>
							</li>
						<?php endif; ?>

        <?php endforeach; ?>
        <?php if(!$show): ?>
            There are no items in the list
        <?php endif; ?>
    </ul>
</div>
<?php if($show): ?>
    <div class="pagination">
        <p class="counter">
            <?php echo $this->pagination->getPagesCounter(); ?>
        </p>
        <?php echo $this->pagination->getPagesLinks(); ?>
    </div>
<?php endif; ?>


									<?php if(JFactory::getUser()->authorise('core.create','com_cvl_project_group.projectgroup'.$item->id)): ?><a href="<?php echo JRoute::_('index.php?option=com_cvl_project_group&task=projectgroup.edit&id=0'); ?>">Add</a>
	<?php endif; ?>