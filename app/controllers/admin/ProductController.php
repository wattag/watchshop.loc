<?php

namespace App\controllers\admin;

use App\models\admin\Product;
use App\models\AppModel;
use Core\libs\Pagination;
use RedBeanPHP\R;

class ProductController extends AppController
{
    public function indexAction()
    {
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = 3;
        $count = R::count('product');
        $pagination = new Pagination($page, $perpage, $count);
        $start = $pagination->getStart();
        $products = R::getAll("SELECT product.*, category.title AS catTitle
                                  FROM product
                                  JOIN category ON category.id = product.category_id 
                                  ORDER BY product.title
                                  LIMIT {$start},{$perpage}");
        $this->setMeta('Список товаров');
        $this->set(compact('products','pagination','count'));
    }
    public function addAction()
    {
        if (!empty($_POST)){
            $product = new Product();
            $data = $_POST;
            $product -> load($data);
            $product->attributes['status'] = $product->attributes['status'] ? '1' : '0';
            $product->attributes['hit'] = $product->attributes['hit'] ? '1' : '0';

            if (!$product->validate($data)){
                $product->getErrors();
                $_SESSION['form_data'] = $data;
                redirect();
            }

            if ($id = $product->save('product')){
                $alias = AppModel::createAlias('product','alias', $data['title'], $id);
                $prd = R::load('product', $id);
                $prd->alias = $alias;
                R::store($prd);
                $_SESSION['success'] = 'Товар успешно добавлен';
            }
            redirect();
        }
        $this->setMeta('Добавление нового товара');
    }
}