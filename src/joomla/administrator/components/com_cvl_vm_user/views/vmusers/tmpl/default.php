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
JHTML::_('script','system/multiselect.js',false,true);
// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet('components/com_cvl_vm_user/assets/css/cvl_vm_user.css');

$user	= JFactory::getUser();
$userId	= $user->get('id');
$listOrder	= $this->state->get('list.ordering');
$listDirn	= $this->state->get('list.direction');
$canOrder	= $user->authorise('core.edit.state', 'com_cvl_vm_user');
$saveOrder	= $listOrder == 'a.ordering';
?>

<form action="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&view=vmusers'); ?>" method="post" name="adminForm" id="adminForm">
	<fieldset id="filter-bar">
		<div class="filter-search fltlft">
			<label class="filter-search-lbl" for="filter_search"><?php echo JText::_('JSEARCH_FILTER_LABEL'); ?></label>
			<input type="text" name="filter_search" id="filter_search" value="<?php echo $this->escape($this->state->get('filter.search')); ?>" title="<?php echo JText::_('Search'); ?>" />
			<button type="submit"><?php echo JText::_('JSEARCH_FILTER_SUBMIT'); ?></button>
			<button type="button" onclick="document.id('filter_search').value='';this.form.submit();"><?php echo JText::_('JSEARCH_FILTER_CLEAR'); ?></button>
		</div>
		
        
		<div class='filter-select fltrt'>
			<select name="filter_published" class="inputbox" onchange="this.form.submit()">
				<option value=""><?php echo JText::_('JOPTION_SELECT_PUBLISHED');?></option>
				<?php echo JHtml::_('select.options', JHtml::_('jgrid.publishedOptions'), "value", "text", $this->state->get('filter.state'), true);?>
			</select>
		</div>

		<div class='filter-select fltrt'>
			<?php //Filter for the field created_by
			$selected_created_by = JRequest::getVar('filter_created_by');
			jimport('joomla.form.form');
			JForm::addFormPath(JPATH_COMPONENT . '/models/forms');
			$form = JForm::getInstance('com_cvl_vm_user.vmuser', 'vmuser');
			echo $form->getInput('filter_created_by', null, $selected_created_by);
			?>
		</div>

		<div class='filter-select fltrt'>
			<?php //Filter for the field register_date
			$selected_from_register_date = JRequest::getVar('filter_from_register_date');
			$selected_to_register_date = JRequest::getVar('filter_to_register_date');
				echo JHtml::_('calendar', $selected_from_register_date, 'filter_from_register_date', 'filter_from_register_date', '%Y-%m-%d', 'onchange="this.form.submit();"');
				echo JHtml::_('calendar', $selected_to_register_date, 'filter_to_register_date', 'filter_to_register_date', '%Y-%m-%d',  'onchange="this.form.submit();"');
			?>
		</div>


	</fieldset>
	<div class="clr"> </div>

	<table class="adminlist">
		<thead>
			<tr>
				<th width="1%">
					<input type="checkbox" name="checkall-toggle" value="" onclick="checkAll(this)" />
				</th>

				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_CREATED_BY', 'a.created_by', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_VM_PASSWORD', 'a.vm_password', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_USERNAME', 'a.username', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_EMAIL', 'a.email', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_VNC_PASSWORD', 'a.vnc_password', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_ORGANISATION', 'a.organisation', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_DRIVER_ID', 'a.driver_id', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_NAME', 'a.name', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_CURRENT_VM_ID', 'a.current_vm_id', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_AUTHENTICATION_TOKEN', 'a.authentication_token', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_APPOVED_BY', 'a.appoved_by', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_REGISTER_DATE', 'a.register_date', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('grid.sort',  'COM_CVL_VM_USER_VMUSERS_GROUP', 'a.group', $listDirn, $listOrder); ?>
				</th>


                <?php if (isset($this->items[0]->state)) { ?>
				<th width="5%">
					<?php echo JHtml::_('grid.sort',  'JPUBLISHED', 'a.state', $listDirn, $listOrder); ?>
				</th>
                <?php } ?>
                <?php if (isset($this->items[0]->ordering)) { ?>
				<th width="10%">
					<?php echo JHtml::_('grid.sort',  'JGRID_HEADING_ORDERING', 'a.ordering', $listDirn, $listOrder); ?>
					<?php if ($canOrder && $saveOrder) :?>
						<?php echo JHtml::_('grid.order',  $this->items, 'filesave.png', 'vmusers.saveorder'); ?>
					<?php endif; ?>
				</th>
                <?php } ?>
                <?php if (isset($this->items[0]->id)) { ?>
                <th width="1%" class="nowrap">
                    <?php echo JHtml::_('grid.sort',  'JGRID_HEADING_ID', 'a.id', $listDirn, $listOrder); ?>
                </th>
                <?php } ?>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="10">
					<?php echo $this->pagination->getListFooter(); ?>
				</td>
			</tr>
		</tfoot>
		<tbody>
		<?php foreach ($this->items as $i => $item) :
			$ordering	= ($listOrder == 'a.ordering');
			$canCreate	= $user->authorise('core.create',		'com_cvl_vm_user');
			$canEdit	= $user->authorise('core.edit',			'com_cvl_vm_user');
			$canCheckin	= $user->authorise('core.manage',		'com_cvl_vm_user');
			$canChange	= $user->authorise('core.edit.state',	'com_cvl_vm_user');
			?>
			<tr class="row<?php echo $i % 2; ?>">
				<td class="center">
					<?php echo JHtml::_('grid.id', $i, $item->id); ?>
				</td>

				<td>
					<?php echo $item->created_by; ?>
				</td>
				<td>
				<?php if (isset($item->checked_out) && $item->checked_out) : ?>
					<?php echo JHtml::_('jgrid.checkedout', $i, $item->editor, $item->checked_out_time, 'vmusers.', $canCheckin); ?>
				<?php endif; ?>
				<?php if ($canEdit) : ?>
					<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&task=vmuser.edit&id='.(int) $item->id); ?>">
					<?php echo $this->escape($item->vm_password); ?></a>
				<?php else : ?>
					<?php echo $this->escape($item->vm_password); ?>
				<?php endif; ?>
				</td>
				<td>
					<?php echo $item->username; ?>
				</td>
				<td>
					<?php echo $item->email; ?>
				</td>
				<td>
					<?php echo $item->vnc_password; ?>
				</td>
				<td>
					<?php echo $item->organisation; ?>
				</td>
				<td>
					<?php echo $item->driver_id; ?>
				</td>
				<td>
					<?php echo $item->name; ?>
				</td>
				<td>
					<?php echo $item->current_vm_id; ?>
				</td>
				<td>
					<?php echo $item->authentication_token; ?>
				</td>
				<td>
					<?php echo $item->appoved_by; ?>
				</td>
				<td>
					<?php echo $item->register_date; ?>
				</td>
				<td>
					<?php echo $item->group; ?>
				</td>


                <?php if (isset($this->items[0]->state)) { ?>
				    <td class="center">
					    <?php echo JHtml::_('jgrid.published', $item->state, $i, 'vmusers.', $canChange, 'cb'); ?>
				    </td>
                <?php } ?>
                <?php if (isset($this->items[0]->ordering)) { ?>
				    <td class="order">
					    <?php if ($canChange) : ?>
						    <?php if ($saveOrder) :?>
							    <?php if ($listDirn == 'asc') : ?>
								    <span><?php echo $this->pagination->orderUpIcon($i, true, 'vmusers.orderup', 'JLIB_HTML_MOVE_UP', $ordering); ?></span>
								    <span><?php echo $this->pagination->orderDownIcon($i, $this->pagination->total, true, 'vmusers.orderdown', 'JLIB_HTML_MOVE_DOWN', $ordering); ?></span>
							    <?php elseif ($listDirn == 'desc') : ?>
								    <span><?php echo $this->pagination->orderUpIcon($i, true, 'vmusers.orderdown', 'JLIB_HTML_MOVE_UP', $ordering); ?></span>
								    <span><?php echo $this->pagination->orderDownIcon($i, $this->pagination->total, true, 'vmusers.orderup', 'JLIB_HTML_MOVE_DOWN', $ordering); ?></span>
							    <?php endif; ?>
						    <?php endif; ?>
						    <?php $disabled = $saveOrder ?  '' : 'disabled="disabled"'; ?>
						    <input type="text" name="order[]" size="5" value="<?php echo $item->ordering;?>" <?php echo $disabled ?> class="text-area-order" />
					    <?php else : ?>
						    <?php echo $item->ordering; ?>
					    <?php endif; ?>
				    </td>
                <?php } ?>
                <?php if (isset($this->items[0]->id)) { ?>
				<td class="center">
					<?php echo (int) $item->id; ?>
				</td>
                <?php } ?>
			</tr>
			<?php endforeach; ?>
		</tbody>
	</table>

	<div>
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="boxchecked" value="0" />
		<input type="hidden" name="filter_order" value="<?php echo $listOrder; ?>" />
		<input type="hidden" name="filter_order_Dir" value="<?php echo $listDirn; ?>" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>