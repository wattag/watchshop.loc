<?php


namespace Core\base;

use Core\Db;

abstract class Model
{
    public $attributes = [];
    public  $errors = [];
    public $rules = [];


    public function __construct()
    {
        Db::instance();
    }
}