<section class="content-header">
    <h1>
        Добавление товара
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li><a href="<?=ADMIN;?>/product">Список товаров</a></li>
        <li class="active">Добавление нового товара</a></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <form action="<?=ADMIN;?>/product/add" method="post" data-toggle="validator">
                    <div class="box-body">

                        <div class="form-group has-feedback">
                            <label for="title">Наименование товара</label>
                            <input type="text" name="title" class="form-control" id="title" placeholder="Наименование товара" value="<?php isset($_SESSION['form_data']['title']) ? h($_SESSION['form_data']['title']): null;?>" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>

                        <div class="form-group">
                            <label for="category_id">Категория</label>
                            <?php new \App\widgets\menu\Menu([
                                'tpl' => WWW . '/menu/select.php',
                                'container' => 'select',
                                'cache' => 0,
                                'cacheKey' => 'admin_select',
                                'class' => 'form-control',
                                'attrs' => [
                                    'name' => 'category_id',
                                    'id' => 'category_id',
                                ],
                                'prepend' => '<option>Выберите категорию</option>',
                            ]) ?>
                        </div>

                        <div class="form-group">
                            <label for="keywords">Ключевые слова (необязательное поле)</label>
                            <input type="text" name="keywords" class="form-control" id="keywords" placeholder="Ключевые слова" value="<?php isset($_SESSION['form_data']['keywords']) ? h($_SESSION['form_data']['keywords']): null;?>">
                        </div>

                        <div class="form-group">
                            <label for="description">Описание (необязательное поле)</label>
                            <input type="text" name="description" class="form-control" id="description" placeholder="Описание" value="<?php isset($_SESSION['form_data']['description']) ? h($_SESSION['form_data']['description']): null;?>">
                        </div>

                        <div class="form-group has-feedback">
                            <label for="price">Цена</label>
                            <input type="text" name="price" class="form-control" id="price" placeholder="Цена" pattern="^[0-9.]{1,}$" value="<?php isset($_SESSION['form_data']['price']) ? h($_SESSION['form_data']['price']): null;?>" required data-error="Допусткаются только цифры">
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group has-feedback">
                            <label for="old_price">Прежняя цена</label>
                            <input type="text" name="old_price" class="form-control" id="old_price" placeholder="Прежняя цена" pattern="^[0-9.]{1,}$" value="<?php isset($_SESSION['form_data']['old_price']) ? h($_SESSION['form_data']['old_price']): null;?>" data-error="Допусткаются только цифры">
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group has-feedback">
                            <label for="content">Описание товара</label>
                            <textarea name="content" id="editor1" cols="80" rows="10"><?php isset($_SESSION['form_data']['content']) ? $_SESSION['form_data']['content']: null;?></textarea>
                        </div>

                        <div class="form-group">
                            <input type="checkbox" name="status" checked> Статус
                        </div>

                        <div class="form-group">
                            <input type="checkbox" name="hit"> Хит
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn btn-success">Добавить</button>
                    </div>
                </form>
                <?php if (isset($_SESSION['form_data'])) unset($_SESSION['form_data']) ;?>
            </div>
        </div>
    </div>
</section>