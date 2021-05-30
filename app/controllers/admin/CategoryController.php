<?php

namespace App\controllers\admin;

use App\models\AppModel;
use App\models\Category;
use Core\App;
use RedBeanPHP\R;

class CategoryController extends AppController
{
    public function indexAction()
    {
        $this->setMeta('Список категорий');
    }
    public function  deleteAction()
    {
        $id = $this->getRequestID();
        $children = R::count('category','parent_id = ?', [$id]);
        $errors = '';
        if ($children){
            $errors .= '<li>Удаление невозможно, в категории есть вложенные категории</li>';
        }
        $products = R::count('product','category_id = ?', [$id]);
        if ($products){
            $errors .= '<li>Удаление невозможно, существуют товары с данной категорией</li>';
        }
        if ($errors){
            $_SESSION['error'] = "<ul>$errors</ul>";
            redirect();
        }
        $category = R::load('category', $id);
        R::trash($category);
        $_SESSION['success'] = 'Категория успешно удалена';
        redirect();
    }
    public function addAction(){
        if (!empty($_POST)){
            $category = new Category();
            $data = $_POST;
            $category->load($data);
            if (!$category->validate($data)){
                $category->getErrors();
                redirect();
            }
            if ($id = $category->save('category')){
                $alias = AppModel::createAlias('category','alias',$data['title'], $id);
                $cat = R::load('category', $id);
                $cat->alias = $alias;
                R::store($cat);
                $_SESSION['success'] = 'Категория успешно добавлена';
            }
            redirect();
        }
        $this->setMeta('Добавление новой категории');
    }
    public function editAction()
    {
        if (!empty($_POST)){
            $id = $this->getRequestID(false);
            $category = new Category();
            $data = $_POST;
            $category->load($data);
            if (!$category->validate($data)){
                $category->getErrors();
                redirect();
            }
            if ($category->update('category', $id)){
                $alias = AppModel::createAlias('category','alias',$data['title'], $id);
                $category = R::load('category', $id);
                $category->alias = $alias;
                R::store($category);
                $_SESSION['success'] = 'Изменения успешно сохранены';
            }
            redirect();
        }
        $id = $this->getRequestID();
        $category = R::load('category', $id);
        App::$app->setProperty('parent_id', $category->parent_id);
        $this->setMeta("Редактирование категории {$category->title}");
        $this->set(compact('category'));
    }
}