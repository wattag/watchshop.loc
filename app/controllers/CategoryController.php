<?php

namespace App\controllers;

use App\models\BreadCrumbs;
use App\models\Category;
use Core\App;
use Core\libs\Pagination;
use RedBeanPHP\R;

class CategoryController extends AppController
{
    public function viewAction()
    {
        $alias = $this->route['alias'];
        $category = R::findOne('category','alias = ?',[$alias]);
        if (!$category){
            throw new \Exception('Страница не найдена',404);
        }
        // хлебные крошки
        $breadcrumbs = BreadCrumbs::getBreadCrumbs($category->id);

        $cat_model = new Category();
        $ids = $cat_model->getIDS($category->id);
        $ids = !$ids ? $category->id : $ids . $category->id;

        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = App::$app->getProperty('pagination');
        $total =R::count('product',"category_id IN ($ids)");
        $pagination = new Pagination($page, $perpage, $total);
        $start = $pagination->getStart();

        $products = R::find('product',"category_id IN ($ids) LIMIT $start,$perpage");
        $this->setMeta($category->title, $category->description, $category->keywords);
        $this->set(compact('products','breadcrumbs', 'pagination','total'));
    }
}