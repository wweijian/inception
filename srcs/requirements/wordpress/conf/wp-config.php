<?php
define('DB_USER', 'user');
define('DB_NAME', 'db_pwd');
define('DB_PASSWORD', 'db_pwd');
define('DB_HOST', 'mariadb:3306');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', __DIR__. '/');
require_once ABSPATH . 'wp-settings.php';
