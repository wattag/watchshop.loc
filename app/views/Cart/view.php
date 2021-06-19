<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li class="active"><a href="<?=PATH;?>">Главная</a></li>
                <li>Корзина</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<div class="prdt">
    <div class="container">
        <div class="prdt-top">
            <div class="col-md-121">
                <div class="product-one cart">
                    <div class="register-top heading">
                        <h2>Оформление заказа</h2>
                    </div>
                    <br><br>
                    <?php if (!empty($_SESSION['cart'])):?>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Изображение</th>
                                        <th>Наименование</th>
                                        <th>Количество</th>
                                        <th>Стоимость</th>
                                        <th><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($_SESSION['cart'] as $id => $item): ?>
                                    <tr>
                                        <td><a href="product/<?=$item['alias'];?>"><img src="images/<?=$item['img'];?>" alt=""></a></td>
                                        <td><a href="product/<?=$item['alias'];?>"><?=$item['title'];?></a></td>
                                        <td><?=$item['qty'];?></td>
                                        <td><?= $_SESSION['cart.currency']['symbol_left'] . $item['price'];?></td>
                                        <td><a href="/cart/delete/?id=<?=$id ;?>"><span data-id="<?=$id ;?>" class="glyphicon glyphicon-remove text-danger del-item" aria-hidden="true"></span></a></td>
                                    </tr>
                                <?php endforeach; ?>
                                <tr>
                                    <td>Всего:</td>
                                    <td colspan="4" class="text-right cart-qty"><?=$_SESSION['cart.qty'];?></td>
                                </tr>
                                <tr>
                                    <td>Общая стоимость:</td>
                                    <td colspan="4" class="text-right cart-sum"><?=$_SESSION['cart.currency']['symbol_left'] . $_SESSION['cart.sum'];?></td>
                                </tr>
                                </tbody>
                            </table>
                        <div class="col-md-6 account-left">
                            <form method="post" action="cart/checkout" role="form" data-toggle="validator">
                                <?php if (!isset($_SESSION['user'])):?>
                                    <div class="form-group has-feedback">
                                        <label for="login">Логин</label>
                                        <input type="text" name="login" class="form-control" id="login" placeholder="Логин" value="<?=isset($_SESSION['form_data']['login']) ? h($_SESSION['form_data']['login']):'';?>" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="password">Пароль</label>
                                        <input type="password" name="password" class="form-control" id="password" placeholder="Пароль" data-error="Пароль должен содержать не менее 6 символов" data-minlength="6" value="<?=isset($_SESSION['form_data']['password']) ? h($_SESSION['form_data']['password']):'';?>" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="name">Имя</label>
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Имя" value="<?=isset($_SESSION['form_data']['name']) ? h($_SESSION['form_data']['name']):'';?>" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="email">Email</label>
                                        <input type="email" name="email" class="form-control" id="email" placeholder="Email" value="<?=isset($_SESSION['form_data']['email']) ? h($_SESSION['form_data']['email']):'';?>" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="address">Адрес</label>
                                        <input type="text" name="address" class="form-control" id="address" placeholder="Адрес" value="<?=isset($_SESSION['form_data']['address']) ? h($_SESSION['form_data']['address']):'';?>" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                <?php endif;?>
                                <div class="form-group">
                                    <label for="address">Комментарий к заказу</label>
                                    <textarea name="note" class="form-control"></textarea>
                                </div>
                                <button type="submit" class="btn btn-default">Оформить заказ</button>
                            </form>
                            <?php if (isset($_SESSION['form_data'])) unset($_SESSION['form_data']);?>
                        </div>
                    <?php else: ?>
                        <h3>Корзина пока еще пуста..</h3>
                    <?php endif;?>
                </div>
            </div>
        </div>
    </div>
</div>