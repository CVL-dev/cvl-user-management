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
jimport('cvl.utility');
$mrows = JCvlUtility::getUserDatabase();
?>

<div class="items">
    <ul class="items_list">
        <?php $show = true; ?>
        <?php foreach ($mrows as $mrow) :?>
				<?php
					if(1):
						$show = true;
						?>
							<li>
								<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&view=vmuser&userid=' . (int)$mrow["userid"]); ?>"><?php echo $mrow["username"]; ?></a>
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

<?php if(0): ?>
		<a href="<?php echo JRoute::_('index.php?option=com_cvl_vm_user&task=vmuser.edit&id=0'); ?>">Add</a>
	<?php endif; ?>
