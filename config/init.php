<?php

define("DEBUG", 1);
define("ROOT", dirname(__DIR__));
define("WWW", ROOT . '/public');
define("CSS", WWW . '/css/style.css');
define("APP", ROOT . '/app');
define("CORE", ROOT . '/core');
define("LIBS", CORE . '/libs');
define("CACHE", ROOT . '/tmp/cache');
define("CONF", ROOT . '/config');
define("LAYOUT", 'watches');
define("PATH", 'http://' . $_SERVER['SERVER_NAME']);
define("ADMIN", PATH . '/admin');

require_once ROOT . '/vendor/autoload.php';