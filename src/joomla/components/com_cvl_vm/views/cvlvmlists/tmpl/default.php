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

<?php if($this->items) : ?>
    <div class="items">
        <ul class="items_list">
<?php 
$myself = & JFactory::getUser();
jimport('cvl.utility');
$vmrows = JCvlUtility::getUserVmList($myself->id);

foreach ($vmrows as $vmrow) {
?>
<li><a href="<?php echo JRoute::_('index.php?option=com_cvl_vm&view=cvlvmlist&id=' . (int)$vmrow["id"]); ?>"><?php echo $vmrow["vm_server_name"]; ?></a></li>

<?php } ?>
    </ul>

  </div>

     <div class="pagination">
        <p class="counter">
            <?php echo $this->pagination->getPagesCounter(); ?>
        </p>
        <?php echo $this->pagination->getPagesLinks(); ?>
    </div>

<?php else: ?>
    
    There are no items in the list

<?php endif; ?>
