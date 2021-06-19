<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li class="active"><a href="<?=PATH;?>">Главная</a></li>
                <li>Вход в систему</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->

<!--login-starts-->
<div class="prdt">
    <div class="container">
        <div class="prdt-top">
            <div class="col-md-12">
                <div class="product-one login">
                    <div class="register-top heading">
                        <h2>Вход в систему</h2>
                    </div>
                    <div class="register-main">
                        <div class="col-md-12">
                            <form method="post" action="user/login" id="login" role="form" data-toggle="validator">
                                <div class="form-group has-feedback">
                                    <label for="login">Логин</label>
                                    <input type="text" name="login" class="form-control" id="login" placeholder="Логин" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="password">Пароль</label>
                                    <input type="password" name="password" class="form-control" id="password" placeholder="Пароль" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <button type="submit" class="btn btn-default">Войти</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--login-end-->