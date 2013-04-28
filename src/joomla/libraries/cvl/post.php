<?php
/**
 * CVL User Management Copyright (C) 2013 Monash University
 *
 * GNU General Public License version 2 or later.
 *
 * Bug report: jupiter.hu@monash.edu or jupiter.hce@gmail.com 
 */
defined('_JEXEC') or die;

class JCvlPost extends JApplication
{
    public function redirect($url, $msg='hello for test', $msgType='message', $moved = false, $persistMsg = true) {
        parent::redirect($url, $msg, $msgType, $moved);
    }

    public function message($m) {
        $url = 'index.php?option=com_users&view=login';
        $url = JRoute::_($url, false);
        $this->redirect($url, JText::_($m));
    }
}

