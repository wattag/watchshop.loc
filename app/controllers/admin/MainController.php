<?php

namespace App\controllers\admin;

class MainController extends AppController
{
    public function indexAction()
    {
        $this->setMeta('Панель управления', 'Описание...', 'Ключевики');
    }
}