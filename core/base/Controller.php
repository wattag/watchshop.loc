<?php

namespace Core\base;

abstract class Controller
{
    public $route;
    public $controller;
    public $view;
    public $model;
    public $prefix;
    public $layout;
    public $data = [];
    public $meta = ['title' => '', 'desc' => '', 'keywords' => ''];


    public function __construct($route)
    {
        $this -> route = $route;
        $this -> controller = $route['controller'];
        $this -> view = $route['action'];
        $this -> model = $route['controller'];
        $this -> prefix = $route['prefix'];
    }

    public function getView()
    {
        $viewObject = new View($this->route,$this->layout, $this->view, $this->meta);
        $viewObject->render($this->data);
    }

    public function set($data)
    {
        $this->data = $data;
    }

    public function setMeta($title = '', $description = '', $keywords = '')
    {
        $this->meta['title'] = $title;
        $this->meta['desc'] = $description;
        $this->meta['keywords'] = $keywords;
    }
    public function isAjax(){
        return (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && (strtolower(getenv('HTTP_X_REQUESTED_WITH')) === 'xmlhttprequest'));
    }
    public function loadView($view, $vars = []){
        extract($vars);
        require APP."/views/{$this->prefix}{$this->controller}/{$view}.php";
        die;
    }
}