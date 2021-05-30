<?php


namespace App\models;


use Core\base\Model;
use RedBeanPHP\R;

class AppModel extends Model
{

    public static function createAlias($table, $field, $str, $id)
    {
        $str = self::str2ur($str);
        $res = R::findOne($table, "$field = ?",[$str]);
        if ($res){
            $str = "{$str}-{$id}";
            $res = R::count($table,"$field = ?",[$str]);
            if ($res){
                $str = self::createAlias($table,$field, $str, $id);
            }
        }
        return $str;
    }

    public static function str2ur($str)
    {
        $str = self::rus2tran($str);
        $str = strtolower($str);
        $str = preg_replace('~[^-a-z0-9]+~u','-', $str);
        $str = trim($str, "-");
        return $str;
    }

    public static function rus2tran($string)
    {
        $converter = array(
          'а' => 'a', 'б' => 'b', 'в' => 'v',
          'г' => 'g', 'д' => 'd', 'е' => 'e',
          'ё' => 'e', 'ж' => 'zh', 'з' => 'z',
          'и' => 'i', 'й' => 'y', 'к' => 'k',
          'л' => 'l', 'м' => 'm', 'н' => 'n',
          'о' => 'o', 'п' => 'p', 'р' => 'r',
          'с' => 's', 'т' => 't', 'у' => 'u',
          'ф' => 'f', 'х' => 'h', 'ц' => 'c',
          'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sch',
          'ь' => '\'', 'ы' => 'y', 'ъ' => '\'',
          'э' => 'e', 'ю' => 'yu', 'я' => 'ya',


          'А' => 'A', 'Б' => 'B', 'В' => 'V',
          'Г' => 'G', 'Д' => 'D', 'Е' => 'E',
          'Ё' => 'E', 'Ж' => 'ZH', 'З' => 'Z',
          'И' => 'I', 'Й' => 'Y', 'К' => 'K',
          'Л' => 'J', 'М' => 'M', 'Н' => 'N',
          'О' => 'O', 'П' => 'P', 'Р' => 'R',
          'С' => 'S', 'Т' => 'T', 'У' => 'U',
          'Ф' => 'F', 'Х' => 'H', 'Ц' => 'C',
          'Ч' => 'CH', 'Ш' => 'SH', 'Щ' => 'SCH',
          'Ь' => '\'', 'Ы' => 'Y', 'Ъ' => '\'',
          'Э' => 'E', 'Ю' => 'YU', 'Я' => 'YA',
        );
        return strtr($string, $converter);
    }
}