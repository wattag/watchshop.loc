<?php

namespace App\models;

use Core\App;

class Category extends AppModel
{
    public $attributes = [
        'title' => '',
        'parent_id' => '',
        'keywords' => '',
        'description' => '',
        'alias' => '',
    ];

    public $rules = [
        'required' => [
            ['title'],
        ]
    ];


    public function getIDS($id)
    {
        $cats = App::$app->getProperty('cats');
        $ids = '';
        foreach ($cats as $k => $v){
            if ($v['parent_id'] == $id){
                $ids .= $k . ',';
                $ids .= $this->getIDS($k);
            }
        }
        return $ids;
    }
}