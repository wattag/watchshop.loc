<!DOCTYPE html>
<html>
<head>
    <base href="/">
    <?= $this->getMeta(); ?>
    <link rel="shortcut icon" href="images/main_icon.png" type="image/png"/>
    <link href="/public/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/public/megamenu/css/ionicons.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/public/megamenu/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="/public/css/flexslider.css" type="text/css" media="screen" />
    <!--theme-style-->
    <link href="/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<!--top-header-->
<div class="top-header">
    <div class="container">
        <div class="top-header-main">
            <div class="col-md-6 top-header-left">
                <div class="drop">
                    <div class="box">
                        <select id="currency" tabindex="4" class="dropdown drop">
                            <?php new App\widgets\currency\Currency();?>
                        </select>
                    </div>
                    <div class="btn-group">
                        <a class="dropdown-toggle" data-toggle="dropdown">Account <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <?php if (!empty($_SESSION['user'])):?>
                                <li><a href="#">Welcome, <?=h($_SESSION['user']['name']);?></a></li>
                                <li><a href="user/logout">Logout</a></li>
                            <?php else: ?>
                                <li><a href="user/login">Login</a></li>
                                <li><a href="user/signup">Sign up</a></li>
                            <?php endif;?>
                        </ul>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-6 top-header-left">
                <div class="cart box_1">
                    <a href="cart/show" onclick="getCart(); return false">
                        <div class="total">
                            <img src="images/cart-1.png" alt=""/>
                            <?php if (!empty($_SESSION['cart'])):?>
                                <span class="simpleCart_total"><?=$_SESSION['cart.currency']['symbol_left'] . $_SESSION['cart.sum'];?></span>
                            <?php else: ?>
                                <span class="simpleCart_total">Empty Cart</span>
                            <?php endif;?>
                        </div>
                    </a>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--top-header-->
<!--start-logo-->
<div class="logo">
    <a href="<?= PATH;?>"><h1>Luxury Watches</h1></a>
</div>
<!--start-logo-->
<!--bottom-header-->
<div class="header-bottom">
    <div class="container">
        <div class="header">
            <div class="col-md-9 header-left">
                <div class="menu-container">
                    <div class="menu">
                        <?php new \App\widgets\menu\Menu([
                            'tpl' => WWW . '/menu/menu.php'
                        ]);?>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-3 header-right">
                <div class="search-bar">
                    <form action="search" method="get" autocomplete="off">
                        <input type="text" class="typeahead" id="typeahead" name="s">
                        <input type="submit" value="">
                    </form>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--bottom-header-->
<div class="content">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
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
          </div>
      </div>
    </div>
    <?=$content; ?>
</div>


<!--information-starts-->
<div class="information">
    <div class="container">
        <div class="infor-top">
            <div class="col-md-3 infor-left">
                <h3>Follow Us</h3>
                <ul>
                    <li><a href="#"><span class="fb"></span><h6>Facebook</h6></a></li>
                    <li><a href="#"><span class="twit"></span><h6>Twitter</h6></a></li>
                    <li><a href="#"><span class="google"></span><h6>Google+</h6></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>Information</h3>
                <ul>
                    <li><a href="#"><p>Specials</p></a></li>
                    <li><a href="#"><p>New Products</p></a></li>
                    <li><a href="#"><p>Our Stores</p></a></li>
                    <li><a href="contact.html"><p>Contact Us</p></a></li>
                    <li><a href="#"><p>Top Sellers</p></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>My Account</h3>
                <ul>
                    <li><a href="account.html"><p>My Account</p></a></li>
                    <li><a href="#"><p>My Credit slips</p></a></li>
                    <li><a href="#"><p>My Merchandise returns</p></a></li>
                    <li><a href="#"><p>My Personal info</p></a></li>
                    <li><a href="#"><p>My Addresses</p></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>Store Information</h3>
                <h4></h4>
                <h5></h5>
                <p><a href="mailto:example@email.com">litvinov374@gmail.com</a></p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--information-end-->
<!--footer-starts-->
<div class="footer">
    <div class="container">
        <div class="footer-top">
            <div class="col-md-6 footer-left">
                <form>
                    <input type="text" value="Enter Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Email';}">
                    <input type="submit" value="Subscribe">
                </form>
            </div>
            <div class="col-md-6 footer-right">
                <p>© 2021 Luxury Watches. All Rights Reserved | Design by  <a href="https://vk.com/wattag" target="_blank">Litvinov Ilya</a> </p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<!-- modal-window-starts-->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Cart</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Continue shopping</button>
                <a href="cart/view" type="button" class="btn btn-primary">Place order</a>
                <button type="button" class="btn btn-danger" onclick="clearCart()">Empty cart</button>
            </div>
        </div>
    </div>
</div>
<!-- modal-window-end-->

<div class="preloader"><img src="images/ring.png" alt=""></div>

<!--footer-end-->
<?php $curr = \Core\App::$app->getProperty('currency');?>

<script>
    var path = '<?=PATH;?>'
        course = <?=$curr['value'] ;?>,
        symboleLeft = '<?=$curr['symbol_left'];?>';
</script>
<script src="/public/js/jquery-1.11.0.min.js"></script>
<script src="/public/js/bootstrap.min.js"></script>
<script src="/public/js/validator.js"></script>
<script src="/public/js/validator.min.js"></script>
<script src="/public/js/typeahead.bundle.js"></script>

<!-- FlexSlider -->
<script src="../public/js/imagezoom.js"></script>
<script defer src="../public/js/jquery.flexslider.js"></script>

<script>
    // Can also be used with $(document).ready()
    $(window).load(function() {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
</script>

<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>
<!--Slider-Starts-Here-->
<script src="js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>
<script src="/public/megamenu/js/megamenu.js"></script>
<script src="/public/js/main.js"></script>
<!--End-slider-script-->
<!--dropdown-->
<script src="../public/js/jquery.easydropdown.js"></script>
<script type="text/javascript">
    $(function() {

        var menu_ul = $('.menu_drop > li > ul'),
            menu_a  = $('.menu_drop > li > a');

        menu_ul.hide();

        menu_a.click(function(e) {
            e.preventDefault();
            if(!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true,true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true,true).slideUp('normal');
            }
        });

    });
</script>
<?php
$logs = \RedBeanPHP\R::getDatabaseAdapter()
        ->getDatabase()
        ->getLogger();
debug($logs->grep('SELECT'));
?>
</body>
</html>