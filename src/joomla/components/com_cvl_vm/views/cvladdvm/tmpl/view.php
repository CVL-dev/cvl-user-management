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
?>

<?php if( $this->item ) : ?>

    <div class="item_fields">
        
        <ul class="fields_list">

        
        
            <li><?php echo 'id'; ?>: 
            <?php echo $this->item->id; ?></li>

        
        
            <li><?php echo 'ordering'; ?>: 
            <?php echo $this->item->ordering; ?></li>

        
        
            <li><?php echo 'state'; ?>: 
            <?php echo $this->item->state; ?></li>

        
        
            <li><?php echo 'checked_out'; ?>: 
            <?php echo $this->item->checked_out; ?></li>

        
        
            <li><?php echo 'checked_out_time'; ?>: 
            <?php echo $this->item->checked_out_time; ?></li>

        
        
            <li><?php echo 'created_by'; ?>: 
            <?php echo $this->item->created_by; ?></li>

        
        
            <li><?php echo 'driver_id'; ?>: 
            <?php echo $this->item->driver_id; ?></li>

        
        
            <li><?php echo 'vm_id'; ?>: 
            <?php echo $this->item->vm_id; ?></li>

        
        
            <li><?php echo 'vm_server_name'; ?>: 
            <?php echo $this->item->vm_server_name; ?></li>

        
        
            <li><?php echo 'vm_ip'; ?>: 
            <?php echo $this->item->vm_ip; ?></li>

        
        
            <li><?php echo 'vm_ram_size'; ?>: 
            <?php echo $this->item->vm_ram_size; ?></li>

        
        
            <li><?php echo 'vm_cpu_number'; ?>: 
            <?php echo $this->item->vm_cpu_number; ?></li>

        
        
            <li><?php echo 'vm_disk_size'; ?>: 
            <?php echo $this->item->vm_disk_size; ?></li>

        

        </ul>
        
    </div>
    <?php if(JFactory::getUser()->authorise('core.edit', 'com_cvl_vm.cvlvmlist'.$this->item->id)): ?>
		<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm&task=cvlvmlist.edit&id='.$this->item->id); ?>">Edit</a>
	<?php endif; ?>
<?php else: ?>
    Could not load the item
<?php endif; ?>
