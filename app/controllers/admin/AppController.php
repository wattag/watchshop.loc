<?php

namespace App\controllers\admin;

use App\models\AppModel;
use App\models\User;
use Core\base\Controller;

class AppController extends Controller
{
    public $layout = 'admin';

    public function __construct($route)
    {
        parent::__construct($route);
        if (!User::isAdmin() && $route['action'] != 'login-admin'){
            redirect(ADMIN . '/user/login-admin');
        }
        new AppModel();
    }
}