<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <base href="/">
    <?= $this->getMeta(); ?>
    <link rel="shortcut icon" href="images/main_icon.png" type="image/png"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/public/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/public/adminlte/bower_components/select2/dist/css/select2.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/public/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/public/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/public/adminlte/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/public/adminlte/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/public/adminlte/my.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="<?=PATH;?>" class="logo" target="_blank">
            <span class="logo-mini"><b>П</b>УП</span>
            <span class="logo-lg">Панель управления</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/public/adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs"><?=$_SESSION['user']['name'];?></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="/public/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    <?=$_SESSION['user']['name'];?>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="<?= ADMIN;?>/user/edit?id=<?=$_SESSION['user']['id'];?>" class="btn btn-default btn-flat">Профиль</a>
                                </div>
                                <div class="pull-right">
                                    <a href="/user/logout" class="btn btn-default btn-flat">Выйти</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/public/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><?=$_SESSION['user']['name'];?></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">Меню</li>
                <li><a href="<?=ADMIN ?>/"><i class="fa fa-home"></i> <span>Главная</span></a></li>
                <li><a href="<?=ADMIN ?>/order"><i class="fa fa-shopping-cart"></i> <span>Заказы</span></a></li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-navicon"></i> <span>Категории</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
                    <ul class="treeview-menu">
                        <li><a href="<?= ADMIN ?>/category">Список категорий</a></li>
                        <li><a href="<?= ADMIN ?>/category/add">Добавить категорию</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-cubes"></i> <span>Товары</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
                    <ul class="treeview-menu">
                        <li><a href="<?= ADMIN ?>/product">Список товаров</a></li>
                        <li><a href="<?= ADMIN ?>/product/add">Добавить товар</a></li>
                    </ul>
                </li>
                <li><a href="<?=ADMIN ?>/cache"><i class="fa fa-database"></i> <span>Кэширование</span></a></li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-users"></i> <span>Пользователи</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
                    <ul class="treeview-menu">
                        <li><a href="<?= ADMIN ?>/user">Список пользователей</a></li>
                        <li><a href="<?= ADMIN ?>/user/add">Добавить пользователя</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <?php if (isset($_SESSION['error'])): ?>
            <div class="alert alert-danger">
                <?php echo $_SESSION['error']; unset($_SESSION['error']); ?>
            </div>
        <?php endif;?>

        <?php if (isset($_SESSION['success'])): ?>
            <div class="alert alert-success">
                <?php echo $_SESSION['success']; unset($_SESSION['success']); ?>
            </div>
        <?php endif;?>
        <?=$content;?>
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2021 Luxury Watches | Design by  <a href="https://vk.com/wattag" target="_blank">Litvinov Ilya</a> .</strong> All rights
        reserved.
    </footer>
</div>
<script>
    var path = '<?=PATH;?>'
        adminpath = '<?=ADMIN;?>'
</script>

<script src="/public/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/public/js/ajaxupload.js"></script>

<script src="/public/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/public/adminlte/bower_components/select2/dist/js/select2.full.js"></script>
<script src="/public/js/validator.js"></script>

<script src="/public/adminlte/dist/js/adminlte.min.js"></script>
<script src="/public/adminlte/bower_components/ckeditor/ckeditor.js"></script>
<script src="/public/adminlte/bower_components/ckeditor/adapters/jquery.js"></script>
<script src="/public/adminlte/my.js"></script>
<?php
$logs = \RedBeanPHP\R::getDatabaseAdapter()
    ->getDatabase()
    ->getLogger();
debug($logs->grep('SELECT'));
?>
</body>
</html>
