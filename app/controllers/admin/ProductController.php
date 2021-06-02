<?php

namespace App\controllers\admin;

use App\models\admin\Product;
use App\models\AppModel;
use Core\App;
use Core\libs\Pagination;
use RedBeanPHP\R;

class ProductController extends AppController
{
    public function addImageAction()
    {
        if (isset($_GET['upload'])){
            if ($_POST['name'] == 'single'){
                $wMAX = App::$app->getProperty('img_width');
                $hMAX = App::$app->getProperty('img_height');
            }else{
                $wMAX = App::$app->getProperty('gallery_width');
                $hMAX = App::$app->getProperty('gallery_height');
            }
            $name = $_POST['name'];
            $product = new Product();
            $product->uploadIMG($name, $wMAX, $hMAX);
        }
    }

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

    public function editAction()
    {
        if (!empty($_POST)){
            $id = $this->getRequestID(false);
            $product = new Product();
            $data = $_POST;
            $product->load($data);
            $product->attributes['status'] = $product->attributes['status'] ? '1' : '0';
            $product->attributes['hit'] = $product->attributes['hit'] ? '1' : '0';
            $product->getIMG();
            if (!$product->validate($data)){
                $product->getErrors();
                redirect();
            }
            if ($product->update('product', $id)){
                $product->editFilter($id, $data);
                $product->editRelatedProduct($id, $data);
                $product->getGallery($id);
                $alias = AppModel::createAlias('product','alias', $data['title'], $id);
                $product = R::load('product', $id);
                $product->alias($alias);
                R::store($product);
                $_SESSION['success'] = 'Товар успешно изменен';
                redirect();
            }
        }
        $id = $this->getRequestID();
        $product = R::load('product', $id);
        App::$app->setProperty('parent_id', $product->category_id);
        $filter = R::getCol('SELECT attr_id FROM attribute_product WHERE product_id = ?', [$id]);

        $related_product = R::getAll("SELECT related_product.related_id, product.title FROM related_product JOIN product ON product.id = related_product.related_id WHERE related_product.product_id = ?", [$id]);
        $gallery = R::getCol('SELECT img FROM gallery WHERE product_id = ?', [$id]);
        $this->setMeta('Редактирование товаров');
        $this->set(compact('product','filter', 'related_product', 'gallery'));
    }


    public function addAction()
    {
        if (!empty($_POST)){
            $product = new Product();
            $data = $_POST;
            $product -> load($data);
            $product->attributes['status'] = $product->attributes['status'] ? '1' : '0';
            $product->attributes['hit'] = $product->attributes['hit'] ? '1' : '0';
            $product->getIMG();

            if (!$product->validate($data)){
                $product->getErrors();
                $_SESSION['form_data'] = $data;
                redirect();
            }

            if ($id = $product->save('product')){
                $product->getGallery($id);
                $alias = AppModel::createAlias('product','alias', $data['title'], $id);
                $prd = R::load('product', $id);
                $prd->alias = $alias;
                R::store($prd);
                $product->editFilter($id, $data);
                $product->editRelatedProduct($id, $data);
                $_SESSION['success'] = 'Товар успешно добавлен';
            }
            redirect();
        }
        $this->setMeta('Добавление нового товара');
    }

    public function relatedProductAction()
    {
        $q = isset($_GET['q']) ? $_GET['q'] : '';
        $data['items'] = [];
        $products = R::getAssoc('SELECT id, title FROM product WHERE title LIKE ? LIMIT 10', ["%{$q}%"]);
        if ($products){
            $i = 0;
            foreach ($products as $id => $title){
                $data['items'][$i]['id'] = [$id];
                $data['items'][$i]['text'] = [$title];
                $i++;
            }
        }
        echo json_encode($data);
        die;
    }
    public function deleteGalleryAction()
    {
        $id = isset($_POST['id']) ? $_POST['id'] : null;
        $src = isset($_POST['src']) ? $_POST['src'] : null;
        if (!$id || !$src){
            return;
        }
        if (R::exec("DELETE FROM gallery WHERE product_id = ? AND img = ?", [$id, $src])){
            @unlink(WWW . "/images/$src");
            exit('1');
        }
    }
}