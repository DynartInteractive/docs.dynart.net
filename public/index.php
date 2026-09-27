<?php

use Dynart\Micro\Micro;
use Dynart\Dpress\DpressWebApp;

require_once __DIR__ . '/../vendor/autoload.php';

Micro::run(new DpressWebApp([__DIR__ . '/../dpress.ini']));
