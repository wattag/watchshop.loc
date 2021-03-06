<?php

namespace App\models;

use Core\App;

class Cart extends AppModel
{
    public function  addToCart($product, $qty = 1, $mod = null){
        if (!isset($_SESSION['cart.currency'])){
            $_SESSION['cart.currency'] = App::$app->getProperty('currency');
        }
        if ($mod){
            $ID = "{$product->id}-{$mod->id}";
            $title = "{$product->title} ({$mod->title})";
            $price = $mod->price;
        }else{
            $ID = $product->id;
            $title = $product->title;
            $price = $product->price;
        }
        if (isset($_SESSION['cart'][$ID])){
            $_SESSION['cart'][$ID]['qty'] += $qty;
        }else{
            $_SESSION['cart'][$ID] = [
                'qty' => $qty,
                'title' => $title,
                'alias' => $product->alias,
                'price' => $price * $_SESSION['cart.currency']['value'],
                'img' => $product->img
            ];
        }
        $_SESSION['cart.qty'] = isset($_SESSION['cart.qty']) ? $_SESSION['cart.qty'] + $qty : $qty;
        $_SESSION['cart.sum'] = isset($_SESSION['cart.sum']) ? $_SESSION['cart.sum'] + $qty * ($price * $_SESSION['cart.currency']['value']) : $qty * ($price * $_SESSION['cart.currency']['value']);
    }

    public function deleteItem($id){
        $qtyMinus = $_SESSION['cart'][$id]['qty'];
        $sumMinus = $_SESSION['cart'][$id]['qty'] * $_SESSION['cart'][$id]['price'];
        $_SESSION['cart.qty'] -= $qtyMinus;
        $_SESSION['cart.sum'] -= $sumMinus;
        unset($_SESSION['cart'][$id]);
    }

    public function plusItem($id)
    {
        $qtyPlus = 1;
        $sumPlus = 1 * $_SESSION['cart'][$id]['price'];
        $_SESSION['cart'][$id]['qty'] += $qtyPlus;
        $_SESSION['cart.qty'] += $qtyPlus;
        $_SESSION['cart.sum'] += $sumPlus;
    }

    public function minusItem($id)
    {
        $qtyMinus = 1;
        $sumMinus = 1 * $_SESSION['cart'][$id]['price'];
        $_SESSION['cart'][$id]['qty'] -= $qtyMinus;
        $_SESSION['cart.qty'] -= $qtyMinus;
        $_SESSION['cart.sum'] -= $sumMinus;
        if ($_SESSION['cart'][$id]['qty'] < 1){
            $_SESSION['cart.qty'] -= $_SESSION['cart'][$id]['qty'];
            $_SESSION['cart.sum'] -= $_SESSION['cart'][$id]['qty'] * $_SESSION['cart'][$id]['price'];
            unset($_SESSION['cart'][$id]);
        }
    }

    public static function recalculate($curr){
        if (isset($_SESSION['cart.currency'])){
            if ($_SESSION['cart.currency']['base']){
                $_SESSION['cart.sum'] *= $curr->value;
            }else{
                $_SESSION['cart.sum'] = $_SESSION['cart.sum'] / $_SESSION['cart.currency']['value'] * $curr->value;
            }
            foreach ($_SESSION['cart'] as $key => $value){
                if ($_SESSION['cart.currency']['base']){
                    $_SESSION['cart'][$key]['price'] *= $curr->value;
                }else{
                    $_SESSION['cart'][$key]['price'] = $_SESSION['cart'][$key]['price'] / $_SESSION['cart.currency']['value'] * $curr->value;
                }
            }
            foreach ($curr as $key => $value){
                $_SESSION['cart.currency'][$key] = $value;
            }
        }
    }
}