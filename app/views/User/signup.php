<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li class="active"><a href="<?=PATH;?>">Главная</a></li>
                <li>Регистрация</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<!--register-starts-->
<div class="prdt">
    <div class="register">
        <div class="container">
            <div class="prdt-top">
                <div class="product-one signup">
                    <div class="register-top heading">
                        <h2>Регистрация</h2>
                    </div>
                </div>
                <div class="register-main">
                    <div class="col-md-12 account-left">
                        <form method="post" action="user/signup" id="signup" role="form" data-toggle="validator">
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
                            <button type="submit" class="btn btn-default">Зарегистрироваться</button>
                        </form>
                        <?php if(isset($_SESSION['form_data'])) unset($_SESSION['form_data']);?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--register-end-->