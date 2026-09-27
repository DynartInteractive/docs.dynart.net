<?php

/**
 * Router script for PHP's built in server, for development only:
 *
 *   php -S 127.0.0.1:8000 -t public public/router.php
 *
 * Apache does this with the rewrite rule in .htaccess; the built in server has no rewriting, so
 * the path is turned into the `route` parameter here.
 */

$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
if ($path !== '/' && is_file(__DIR__ . $path)) {
    return false; // let the server hand back the static file
}
$_GET['route'] = $path;
$_REQUEST['route'] = $path;
require __DIR__ . '/index.php';
