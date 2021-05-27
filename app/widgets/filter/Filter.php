<?php


namespace App\widgets\filter;


use Core\Cache;
use RedBeanPHP\R;

class Filter
{
    public $groups;
    public $attrs;
    public $tpl;

    public function __construct()
    {
        $this->tpl = __DIR__ . '/filter_tpl.php';
        $this->run();
    }

    protected function run()
    {
        $cache = Cache::instance();
        $this->groups = $cache->get('filter_group');
        if (!$this->groups){
            $this->groups = $this->getGroups();
            $cache->set('filter_group', $this->groups, 30);
        }
        $this->attrs = $cache->get('filter_attrs');
        if (!$this->attrs){
            $this->attrs = $this->getAttrs();
            $cache->set('filter_attrs', $this->attrs, 30);
        }
        echo $filters = $this->getHTML();
    }

    protected function getHTML()
    {
        ob_start();
        require $this->tpl;
        return ob_get_clean();
    }

    protected function getGroups()
    {
        return R::getAssoc('SELECT id, title FROM attribute_group');
    }
    protected function getAttrs()
    {
        $data = R::getAssoc('SELECT * FROM attribute_value');
        $attrs = [];
        foreach ($data as $key => $value){
            $attrs[$value['attr_group_id']][$key] = $value['value'];
        }
        return $attrs;
    }

    public static function getFilter()
    {
        $filter = null;
        if (!empty($_GET['filter'])){
            $filter = preg_replace("#[^\d,]+#",'', $_GET['filter']);
            $filter = rtrim($filter, ',');
        }
        return $filter;
    }
}