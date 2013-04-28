CREATE TABLE IF NOT EXISTS `#__cvl_vm_user` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`asset_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(8)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL ,
`vm_password` VARCHAR(64)  NOT NULL ,
`username` VARCHAR(64)  NOT NULL ,
`email` VARCHAR(100)  NOT NULL ,
`vnc_password` VARCHAR(16)  NOT NULL ,
`organisation` VARCHAR(100)  NOT NULL ,
`driver_id` TINYINT(8)  NOT NULL ,
`name` VARCHAR(64)  NOT NULL ,
`current_vm_id` INT(11)  NOT NULL ,
`authentication_token` VARCHAR(100)  NOT NULL ,
`appoved_by` VARCHAR(100)  NOT NULL ,
`register_date` DATETIME NOT NULL ,
`group` VARCHAR(100)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8_general_ci;

