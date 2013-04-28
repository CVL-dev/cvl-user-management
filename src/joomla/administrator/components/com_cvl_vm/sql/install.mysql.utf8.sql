CREATE TABLE IF NOT EXISTS `#__cvl_vm` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL DEFAULT '1',
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL ,
`driver_id` TINYINT(8)  NOT NULL ,
`vm_id` VARCHAR(64)  NOT NULL ,
`vm_server_name` VARCHAR(128)  NOT NULL ,
`vm_ip` VARCHAR(16)  NOT NULL ,
`vm_ram_size` INT(32)  NOT NULL ,
`vm_cpu_number` TINYINT(8)  NOT NULL ,
`vm_disk_size` INT(32)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8_general_ci;

