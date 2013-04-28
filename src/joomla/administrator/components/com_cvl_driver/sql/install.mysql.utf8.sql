CREATE TABLE IF NOT EXISTS `#__cvl_driver` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL DEFAULT '1',
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL ,
`driver_id` TINYINT(8)  NOT NULL ,
`driver_description` VARCHAR(128)  NOT NULL ,
`image_id` VARCHAR(64)  NOT NULL ,
`ssh_key` VARCHAR(64)  NOT NULL ,
`security_group` VARCHAR(64)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8_general_ci;

