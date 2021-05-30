<?php


namespace App\models\admin;


use RedBeanPHP\R;

class User extends \App\models\User
{
    public $attributes = [
        'id' => '',
        'login' => '',
        'password' => '',
        'name' => '',
        'email' => '',
        'address' => '',
        'role' => '',
    ];

    public $rules = [
        'required' => [
            ['login'],
            ['name'],
            ['email'],
            ['role'],
        ],
        'email' => [
            ['email'],
        ]
    ];

    public function checkUnique()
    {
        $user = R::findOne('user','(login = ? OR email = ?) AND id <> ?',[$this->attributes['login'], $this->attributes['email'], $this->attributes['id']]);
        if ($user){
            if ($user->login == $this->attributes['login']){
                $this->errors['unique'][] = 'Этот login уже существует';
            }
            if ($user->email == $this->attributes['email']){
                $this->errors['unique'][] = 'Этот email уже существует';
            }
            return false;
        }
        return true;
    }
}