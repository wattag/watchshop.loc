<?php


namespace App\controllers;


use App\models\User;

class UserController extends AppController
{
    public function signupAction()
    {
        if (!empty($_POST)){
            $user = new User();
            $data = $_POST;
            $user->load($data);
            if (!$user->validate($data) || !$user->checkUnique()){
                $user->getErrors();
                $_SESSION['form_data'] = $data;
                redirect();
            }else{
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
                if ($user->save('user')){
                    $_SESSION['success'] = 'Пользователь успешно зарегестрирован';
                    redirect(PATH . '/user/login');
                }else{
                    $_SESSION['error'] = 'Что-то пошло не так..';
                    redirect();
                }
            }
        }
        $this->setMeta('Registration');
    }

    public function loginAction()
    {
        if (!empty($_POST)){
            $user = new User();
            if ($user->login()){
                $_SESSION['success'] = "Пользователь успешно авторизован";
            }else{
                $_SESSION['error'] = "Логин/пароль введены неверно";
            }
            redirect();
        }
        $this->setMeta('Login');
    }

    public function logoutAction()
    {
        if (isset($_SESSION['user'])) unset($_SESSION['user']);
        redirect();
    }
}