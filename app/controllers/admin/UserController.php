<?php

namespace App\controllers\admin;


use App\models\User;

class UserController extends AppController
{
    public function loginAdminAction()
    {
        if (!empty($_POST)){
            $user = new User();
            if (!$user->login(true)){
                $_SESSION['error'] = 'Логин или пароль введены неверно';
            }
            if (User::isAdmin()){
                redirect(ADMIN);
            }else{
                redirect();
            }
        }
        $this->layout = 'login';
    }
}