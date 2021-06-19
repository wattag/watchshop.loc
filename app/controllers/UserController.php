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
            }else{
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
                if ($user->save('user')){
                    $_SESSION['success'] = 'Пользователь успешно зарегестрирован';
                }else{
                    $_SESSION['error'] = 'Что-то пошло не так..';
                }
            }
            redirect();
        }
        $this->setMeta('Registration');
    }

    public function loginAction()
    {
        if (!empty($_POST)){
            $user = new User();
            if ($user->login()){
                $_SESSION['success'] = "Пользователь успешно авторизован";
                redirect('/user/cabinet');
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

    public function cabinetAction()
    {
        if (!User::checkAuth()) redirect();
        $this->setMeta('Личный кабинет');
    }
    public function editAction(){
        if (!User::checkAuth()) redirect('/user/login');
        if (!empty($_POST)){
            $user = new \App\models\admin\User();
            $data = $_POST;
            $data['id'] = $_SESSION['user']['id'];
            $data['role'] = $_SESSION['user']['role'];
            $user->load($data);
            if (!$user->attributes['password']){
                unset($user->attributes['password']);
            }else{
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
            }
            if (!$user->validate($data) || !$user->checkUnique()){
                $user->getErrors();
                redirect();
            }
            if ($user->update('user', $_SESSION['user']['id'])){
                foreach ($user->attributes as $key => $value){
                    if (!$key != 'password') $_SESSION['user'][$key] = $value;
                }
                $_SESSION['success'] = 'Изменения сохранены';
            }
            redirect();
        }
        $this->setMeta('Изменение личных данных');
    }
}