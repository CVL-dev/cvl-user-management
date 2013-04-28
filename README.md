cvl-user-management
=================

## Authors:

* Jupiter Hu: Joomla UI, initial Python code.
* Carlo Hamalainen: Python code that uses `celery` and `fabric`.

## Moving parts

* Joomla web interface.
* MySQL database.
* Python library for creating, starting, stopping, deleting VMs, and also managing user identity.
* Celery job queue for long running tasks (e.g. VM creation).
* Web API - the Massive/CVL Launcher queries the user management system (see CvlCommunication.py).

## Repository overview

* `cvl-user-management/README.md`: this file.
* `cvl-user-management/CvlUserManagementAdmin3.sql`: dump of MySQL database tables.
* `cvl-user-management/src/joomla`: Joomla directories.
* `cvl-user-management/src/joomla/configuration.php`: Joomla configuration file.
* `cvl-user-management/src/joomla/components`: Joomla components (includes views/templates).
* `cvl-user-management/src/joomla/libraries/cvl`: CVL user management libraries (PHP).
* `cvl-user-management/src/python`: Python code.
* `cvl-user-management/src/python/cvl_config.py`: configuration for Python code.
* `cvl-user-management/src/python/CvlEnvironment.py`: more configuration for Python code.

## Installation

Install base Centos packages:

    sudo yum -y install mysql mysql-server httpd mysql sendmail mailx MySQL-python php php-common php-gd php-pear php-pecl-memcache php-mysql php-xml

Turn on httpd and mysqld:

    sudo chkconfig httpd on
    sudo service httpd restart

    sudo chkconfig mysqld on
    sudo service mysqld restart

Install extra packages from epel:

    sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    sudo yum -y install python-novaclient python-iso8601

Install redis:

    wget http://redis.googlecode.com/files/redis-2.6.12.tar.gz
    sudo tar xzf redis-2.6.12.tar.gz -C /opt/
    cd /opt/redis-2.6.12
    sudo make

Install fabric:

    sudo yum -y install gcc python-devel
    sudo easy_install pip
    sudo pip install fabric
    sudo pip install Pycrypto

Install celery:

    sudo pip install -U Celery
    sudo pip install -U celery-with-redis

Install SQLObject:

    sudo pip install -U sqlobject

Install ssh:

    sudo pip install ssh

Install pycrypto (optional?):

    wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.tar.gz
    tar zxf pycrypto-2.6.tar.gz
    cd pycrypto-2.6
    sudo python setup.py install

## Configuration

### selinux

Set `SELINUX=disabled` in `/etc/selinux/config`. Reboot.

### mysqld

Set the root password for mysql:

    sudo /usr/bin/mysqladmin -u root password YOURPASSWORD

Edit `/etc/my.cnf` and add this line:

    default-storage-engine=InnoDB

then restart mysqld: `sudo service mysqld restart`.

### httpd

If necessary, configure httpd:

On a freshly installed CentOS instance, all that is required
to get the Apache server to work is to add this to the end of
`/etc/httpd/conf.d/php.conf`:

    <Directory /var/www/html/cvl/>
        Order allow,deny
        Allow from all
    </Directory>

Note: we assume that the Joomla site will be at `http://example.com/cvl`.

After editing, always restart httpd: `service httpd restart`.

### Joomla

Create joomla user and set its password (not echoed here):

    mysql -u root -p

    mysql> CREATE USER 'joomla'@'localhost' IDENTIFIED BY 'joomla';
    mysql> SET PASSWORD FOR 'joomla'@'localhost' = PASSWORD('JOOMLA_PASSWORD');
    mysql> CREATE DATABASE CvlUserManagementAdmin3;
    mysql> GRANT ALL PRIVILEGES ON CvlUserManagementAdmin3.* TO 'joomla'@'localhost';

### User Management system

#### Clone the repo

    git clone git@github.com:CVL-dev/cvl-user-management.git

#### Install the Python code

    sudo mkdir -p /opt/cvl-user-management/python
    sudo cp cvl-user-management/src/python/* /opt/cvl-user-management/python/

#### Install the Joomla code

    sudo mkdir -p /var/www/html/cvl
    sudo cp -r cvl-user-management/src/joomla/* /var/www/html/cvl/

#### Install your Nectar key

    sudo mkdir -p /opt/cvl-user-management/keys
    sudo cp my_nectar_key.pem /opt/cvl-user-management/keys/my_nectar_key.pem

#### Create log directories

    sudo mkdir -p /var/www/html/logs  # these values are set in configuration.php
    sudo mkdir -p /var/www/html/tmp   # these values are set in configuration.php
    sudo touch /tmp/cvldesktopinstaller.log /tmp/cvldesktopinstaller_php.log

#### Fix permissions

    sudo chown -R apache.apache /opt/cvl-user-management
    sudo chown -R apache.apache /var/www/html/cvl
    sudo chown -R apache.apache /var/www/html/logs /var/www/html/tmp
    sudo chown apache.apache /tmp/cvldesktopinstaller*log

#### Import the database snapshot

    mysql -u joomla -p CvlUserManagementAdmin3 < CvlUserManagementAdmin3.sql

#### Configure Joomla

Edit the Joomla configuration file `/var/www/html/cvl/configuration.php` and ensure that
the `siteurl` is appropriate along with the database options:

    public $siteurl = 'http://example.com/cvl/';

	public $mailfrom = 'cvl.admin@example.com';

    public $host = 'localhost';
    public $user = 'joomla';
    public $password = 'MYSQL_joomla_user_password';
    public $db = 'CvlUserManagementAdmin3';

Check all settings that are marked with `EDIT_THIS`.

#### Configure Python

Edit `/opt/cvl-user-management/python/cvl_config.py` and set anything
marked with `EDIT_THIS`.

Joomla password:

    DATABASE_PASSWORD = "joomla_user_password"

It is worth perusing `cvl_config.py` for other options that may not match your setup, e.g. the system
creates all VMs with a particular key name and security group:

    VM_KEY_NAME = 'key_name.pem'
    VM_SECURITY_GROUP = "CVLDemoSecurityGroup"

Edit `/opt/cvl-user-management/python/CvlEnvironment.py` and set these parameters:

    if os.environ.get('OS_AUTH_URL') == None:
        os.environ["OS_AUTH_URL"] = "https://keystone.rc.nectar.org.au:5000/v2.0/"
        os.environ["OS_TENANT_ID"] = "YOUR TENANCY ID"
        os.environ["OS_TENANT_NAME"] = "YOUR TENANCY NAME"
        os.environ["OS_USERNAME"] = "YOUR EMAIL ADDRESS"
        os.environ["OS_PASSWORD"] = "YOUR OPENRC PASSWORD"

#### Set the location of the Python code

Edit `/var/www/html/cvl/libraries/cvl/library.php` and ensure that
`self::$_mypath` in `setup()` is appropriate, e.g.

    self::$_mypath = "/opt/cvl-user-management/python";

### Create a new Joomla super-administrator

Run `mysql -u joomla -p` and enter these SQL commands:

    use CvlUserManagementAdmin3;
    INSERT INTO `Cvl_users` (`name`, `username`, `password`, `params`) VALUES ('Administrator2', 'admin2', 'd2064d358136996bd22421584a7cb33e:trd7TvKHx6dMeoMmBVxYmg0vuXEA4199', '');
    INSERT INTO `Cvl_user_usergroup_map` (`user_id`,`group_id`) VALUES (LAST_INSERT_ID(),'8');

This creates a user called `admin2` with password `secret`. **Change this password immediately as it is a known example username/password pair in the Joomla documentation**.

To manually delete this user (proceed with caution!):

    use CvlUserManagementAdmin3;
    DELETE FROM Cvl_user_usergroup_map WHERE user_id IN (SELECT id FROM Cvl_users WHERE username = 'admin2');
    DELETE FROM Cvl_users WHERE username = 'admin2';

## Start services

### logging

Python errors go to `/var/log/httpd/error_log` or similar, depending on your httpd configuration.

### redis

Run the redis server in a screen session (TODO: crontab/flock entry):

    /opt/redis-2.6.12/src/redis-server

### celery

Run the celery server in a screen session (TODO: crontab/flock entry):

    cd /opt/cvl-user-management/python && celery -A utils worker --loglevel=info --no-color

If this fails with `ImportError: cannot import name OSRNG` then you may need to comment out
a few lines in `/usr/lib64/python2.6/site-packages/Crypto/Util/number.py`:

    # You need libgmp v5 or later to get mpz_powm_sec.  Warn if it is not available.
    if _fastmath is not None and not _fastmath.HAVE_DECL_MPZ_POWM_SEC:
        _warn("Not using mpz_powm_sec.  You should rebuild using libgmp >= 5 to avoid timing attack vulnerability.", PowmInsecureWarning)

This problem has been observed on CentOS, e.g. https://github.com/ansible/ansible/issues/276


## Try it out

Visit `http://example.com/cvl` (substitute appropriate IP address) and you should see the login page
for the User Management system.

## Notes

### Save a database snapshot

To save a snapshot of the user management database:

    mysqldump -u root -pPASSWORD CvlUserManagementAdmin3 --single-transaction --flush-logs > mysqldump_CvlUserManagementAdmin3_`date +%Y-%m-%d-%H%M`.sql


## TODO

* Are the redirect links needed? see the database snapshot `INSERT INTO` line with `127.0.0.1` IP URLs.
* Where to install `query.php`?
