<?php

namespace App\models;

use Core\App;
use RedBeanPHP\R;
class Order extends AppModel
{
    public static function saveOrder($data)
    {
        $order = R::dispense('order');
        $order->user_id = $data['user_id'];
        $order->note = $data['note'];
        $order->currency = $_SESSION['cart.currency']['code'];
        $order->sum = $_SESSION['cart.sum'];
        $order_id = R::store($order);
        self::saveOrderProduct($order_id);
        return $order_id;
    }

    public static function saveOrderProduct($order_id)
    {
        $sql_part = '';
        foreach ($_SESSION['cart'] as $product_id =>$product){
            $product_id = (int)$product_id;
            $sql_part .= "($order_id, $product_id, {$product['qty']}, '{$product['title']}', {$product['price']}),";
        }
        $sql_part = rtrim($sql_part,',');
        R::exec("INSERT INTO order_product (order_id, product_id, qty, title, price) VALUES $sql_part");
    }

    public static function mailOrder($order_id, $user_email)
    {
        /*$transport = (new Swift_SmtpTransport(App::$app->getProperty('smtp_host'),App::$app->getProperty('smtp_port'),App::$app->getProperty('smtp_protocol')))
        ->setUsername(App::$app->getProperty('smtp_login'))
        ->setPassword(App::$app->getProperty('smtp_password'))
        ;
        $mailer = new Swift_Mailer($transport);

        ob_start();
        require  APP . '/views/mail/mail_order.php';
        $body = ob_get_clean();

        $clientMessage = (new Swift_Message("Заказ №{$order_id} принят"))
            ->setFrom([App::$app->getProperty('smtp_login') => 'Luxury Watches Shop'])
            ->setTo($user_email)
            ->setBody($body, 'text/html')
            ;

        $adminMessage = (new Swift_Message("Заказ №{$order_id} составлен"))
            ->setFrom([App::$app->getProperty('smtp_login') => 'Luxury Watches Shop'])
            ->setTo(App::$app->getProperty('admin_email'))
            ->setBody($body, 'text/html')
        ;

        $adminResult = $mailer->send($adminMessage);
        $clientResult = $mailer-> send($clientMessage);*/

        unset($_SESSION['cart']);
        unset($_SESSION['cart.currency']);
        unset($_SESSION['cart.qty']);
        unset($_SESSION['cart.sum']);
        $_SESSION['success'] = "Спасибо за ваш заказ! В ближайщее время с вами свяжется наши менеджеры для согласлования заказа";
    }
}