<?php


namespace App\controllers;

use App\models\AppModel;
use App\widgets\currency\Currency;
use Core\App;
use Core\base\Controller;
use Core\Cache;
use RedBeanPHP\R;
use RedUNIT\Blackhole\Debug;

class AppController extends Controller
{
    public function __construct($route)
    {
        parent::__construct($route);

        new AppModel();

        App::$app->setProperty('currencies', Currency::getCurrencies());
        App::$app->setProperty('currency', Currency::getCurrency(App::$app->getProperty('currencies')));
        App::$app->setProperty('cats', self::cacheCategory());

    }

    public static function cacheCategory()
    {
        $cache = Cache::instance();
        $cats = $cache->get('cats');
        if (!$cats){
            $cats = R::getAssoc("SELECT * FROM category");
            $cache->set('cats',$cats);
        }
        return $cats;
    }
}