<?php if (!empty($products)): ?>
    <?php $curr = \Core\App::$app->getProperty('currency');?>
    <?php foreach ($products as $product):?>
        <div class="col-md-4 product-left p-left">
            <div class="product-main simpleCart_shelfItem">
                <a href="product/<?=$product->alias;?>" class="mask">
                    <img class="img-responsive zoom-img" src="images/<?=$product->img;?>" alt=""/>
                </a>
                <div class="product-bottom">
                    <h3><?=$product->title;?></h3>
                    <p>Explore Now</p>
                    <h4>
                        <a data-id="<?=$product->id?>" class="add-to-cart-link" href="cart/add?id=<?=$product->id?>"><i></i></a>
                        <span class="item_price">
                            <?=$curr['symbol_left']?><?=$product->price * $curr['value'];?>
                        </span>
                        <?php if ($product->old_price): ?>
                        <small><del><?=$curr['symbol_left']?><?=$product->old_price * $curr['value'];?></del></small>
                    </h4>
                </div>
                <div class="srch">
                    <span>-<?=round((($product->old_price-$product->price)/$product->old_price)*100);?>%</span>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php endforeach;?>
    <div class="clearfix"></div>
    <div class="text-center">
        <p>(<?=count($products)?> product(s) out of <?=$total;?>)</p>
        <?php if ($pagination->countPages > 1):?>
            <?=$pagination;?>
        <?php endif;?>
    </div>
<?php else: ?>
    <h3>Товаров не найдено</h3>
<?php endif;?>