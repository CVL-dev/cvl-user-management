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
<?php
$state = array("Idle", "Setup", "Active", "Error");
?>

<?php if( $this->item ) : ?>

    <div class="item_fields">
        
        <ul class="fields_list">
          <h1>
            <li><?php echo 'Name'; ?>: 
            <?php echo $this->item->vm_server_name; ?></li>
        
            <li><?php echo 'IP'; ?>: 
            <?php echo $this->item->vm_ip; ?></li>
        
            <li><?php echo 'CPUs'; ?>: 
            <?php echo $this->item->vm_cpu_number; ?></li>

            <li><?php echo 'RAM (GB)'; ?>: 
            <?php echo $this->item->vm_ram_size; ?></li>
        
            <li><?php echo 'Disk (GB)'; ?>: 
            <?php echo $this->item->vm_disk_size; ?></li>
            <li><?php echo 'With GPU'; ?>: 
            <?php  if($this->item->has_gpu) { 
                      echo "Yes"; 
                  } else {
                      echo "No"; 
                  }
            ?></li>

            <li><?php echo 'State'; ?>: 
            <?php echo $state[$this->item->state]; ?></li>
            </h1>
        </ul>
        
    </div>
    <?php if(0): ?>
		<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm&task=cvlvmlist.edit&id='.$this->item->id); ?>">Edit</a>
	<?php endif; ?>
<?php else: ?>
    Could not load the item
<?php endif; ?>
