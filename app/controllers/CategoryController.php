<?php

namespace App\controllers;

use App\models\BreadCrumbs;
use App\models\Category;
use App\widgets\filter\Filter;
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

        $sql_part = '';
        if (!empty($_GET['filter'])){
            $filter = Filter::getFilter();
            if ($filter){
                $cnt = Filter::getCountGroups($filter);
                $sql_part = "AND id IN (SELECT product_id FROM attribute_product WHERE attr_id IN ($filter) GROUP BY product_id HAVING COUNT(product_id) = $cnt)";

            }
        }

        $total =R::count('product',"category_id IN ($ids) $sql_part");
        $pagination = new Pagination($page, $perpage, $total);
        $start = $pagination->getStart();

        $products = R::find('product',"status = '1' AND category_id IN ($ids) $sql_part LIMIT $start,$perpage");

        if ($this->isAjax()){
            $this->loadView('filter', compact('products','total', 'pagination'));
        }

        $this->setMeta($category->title, $category->description, $category->keywords);
        $this->set(compact('products','breadcrumbs', 'pagination','total'));
    }
}