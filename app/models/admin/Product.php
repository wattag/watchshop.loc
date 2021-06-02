<?php


namespace App\models\admin;


use App\models\AppModel;
use RedBeanPHP\R;

class Product extends AppModel
{
    public $attributes = [
        'title' => '',
        'category_id' => '',
        'keywords' => '',
        'description' => '',
        'price' => '',
        'old_price' => '',
        'content' => '',
        'status' => '',
        'hit' => '',
        'alias' => '',
    ];
    public $rules = [
      'required' => [
          ['title'],
          ['category_id'],
          ['price'],
      ],
        'integer' =>[
            ['category_id']
        ]
    ];

    public function editRelatedProduct($id, $data)
    {
        $related_product = R::getCol('SELECT related_id FROM related_product WHERE product_id = ?', [$id]);

        if (empty($data['related']) && !empty($related_product)){
            R::exec("DELETE FROM related_product WHERE product_id = ?",[$id]);
            return;
        }
        if (empty($related_product) && !empty($data['related'])){
            $sql_part = '';
            foreach ($data['related'] as $value){
                $value = (int)$value;
                $sql_part .= "($id, $value),";
            }
            $sql_part = rtrim($sql_part, ',');
            R::exec("INSERT INTO related_product (product_id, related_id) VALUES $sql_part");
            return;
        }
        if (!empty($data['related'])) {
            $result = array_diff($related_product, $data['related']);
            if (!empty($result) || count($related_product) != $data['related']) {
                R::exec("DELETE FROM related_product WHERE product_id = ?", [$id]);
                $sql_part = '';
                foreach ($data['related'] as $value) {
                    $sql_part .= "($id, $value),";
                }
                $sql_part = rtrim($sql_part, ',');
                R::exec("INSERT INTO related_product (product_id, related_id) VALUES $sql_part");
            }
        }
    }

    public function editFilter($id, $data)
    {
        $filter = R::getCol('SELECT attr_id FROM attribute_product WHERE product_id = ?', [$id]);
        if (empty($data['attrs']) && !empty($filter)){
            R::exec("DELETE FROM attribute_product WHERE product_id = ?",[$id]);
            return;
        }
        if (empty($filter) && !empty($data['attrs'])){
            $sql_part = '';
            foreach ($data['attrs'] as $value){
                $sql_part .= "($value, $id),";
            }
            $sql_part = rtrim($sql_part, ',');
            R::exec("INSERT INTO attribute_product (attr_id, product_id) VALUES $sql_part");
            return;
        }
        if (!empty($data['attrs'])){
            $result = array_diff($filter, $data['attrs']);
            if (!$result || count($filter) != $data['attrs']){
                R::exec("DELETE FROM attribute_product WHERE product_id = ?",[$id]);
                $sql_part = '';
                foreach ($data['attrs'] as $value){
                    $sql_part .= "($value, $id),";
                }
                $sql_part = rtrim($sql_part, ',');
                R::exec("INSERT INTO attribute_product (attr_id, product_id) VALUES $sql_part");
            }
        }
    }

    public function getIMG(){
        if (!empty($_SESSION['single'])){
            $this->attributes['img'] = $_SESSION['single'];
            unset($_SESSION['single']);
        }
    }

    public function getGallery($id)
    {
        if (!empty($_SESSION['multi'])){
            $sql_part = '';
            foreach ($_SESSION['multi'] as $value){
                $sql_part .="($id, '$value'),";
            }
            $sql_part = rtrim($sql_part, ',');
            R::exec("INSERT INTO gallery (product_id, img) VALUES $sql_part");
            unset($_SESSION['multi']);
        }
    }

    public function uploadIMG($name, $wmax, $hmax)
    {
        $uploadDIR = WWW . '/images/';
        $ext = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $_FILES[$name]['name']));
        $types = array("image/gif","image/png","image/jpeg","image/pjpeg","image/x-png");
        if ($_FILES[$name]['size'] > 1048576){
            $res = array("error"=>"Ошибка! Максимальный вес файла 1 МБ");
            exit(json_encode($res));
        }
        if ($_FILES[$name]['error']){
            $res = array("error"=>"Ошибка! Возможно, файл был слишком большой");
            exit(json_encode($res));
        }
        if (!in_array($_FILES[$name]['type'], $types)){
            $res = array("error"=>"Ошибка! Допустимые расширения - .gif, .jpeg, .png ");
            exit(json_encode($res));
        }
        $new_name = md5(time()).".$ext";
        $uploadFILE = $uploadDIR.$new_name;
        if (@move_uploaded_file($_FILES[$name]['tmp_name'], $uploadFILE)){
            if ($name == 'single'){
                $_SESSION['single'] = $new_name;
            }else{
                $_SESSION['multi'][] = $new_name;
            }
            self::resize($uploadFILE, $uploadFILE, $wmax, $hmax, $ext);
            $res = array("file" => $new_name);
            exit(json_encode($res));
        }
    }
    public static function resize($target, $dest, $wmax, $hmax, $ext)
    {
        list($w_orig, $h_orig) = getimagesize($target);
        $ratio = $w_orig / $h_orig;

        if (($wmax / $hmax) > $ratio){
            $wmax = $hmax * $ratio;
        }else{
            $hmax = $wmax / $ratio;
        }
        $img = "";

        switch ($ext){
            case ("gif"):
                $img = imagecreatefromgif($target);
                break;
            case  ('png'):
                $img = imagecreatefrompng($target);
                break;
            default:
                $img = imagecreatefromjpeg($target);
        }
        $newImg = imagecreatetruecolor($wmax, $hmax);

        if ($ext == 'png'){
            imagesavealpha($newImg, true);
            $transPng = imagecolorallocatealpha($newImg, 0,0,0,127);
            imagefill($newImg,0,0,$transPng);
        }

        imagecopyresampled($newImg, $img,0,0,0,0,$wmax, $hmax, $w_orig, $h_orig);
        switch ($ext){
            case ("gif"):
                imagegif($newImg, $dest);
                break;
            case ("png"):
                imagepng($newImg, $dest);
                break;
            default:
                imagejpeg($newImg, $dest);
        }
        imagedestroy($newImg);
    }
}