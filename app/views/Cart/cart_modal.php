<?php if (!empty($_SESSION['cart'])): ?>
    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>Изображение</th>
                <th>Наименование</th>
                <th><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></th>
                <th>Количество</th>
                <th><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></th>
                <th>Стомость</th>
                <th><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($_SESSION['cart'] as $id => $item): ?>
                <tr>
                    <td><a href="product/<?=$item['alias'];?>"><img src="images/<?=$item['img'];?>" alt=""></a></td>
                    <td><a href="product/<?=$item['alias'];?>"><?=$item['title'];?></a></td>
                    <td><span data-id="<?=$id;?>" class="glyphicon glyphicon-minus text-black minus_item" aria-hidden="true"></td>
                    <td style="text-align: center"><?=$item['qty'];?></td>
                    <td><span data-id="<?=$id;?>" class="glyphicon glyphicon-plus text-black plus_item" aria-hidden="true"></td>
                    <td style="text-align: center"><?= $_SESSION['cart.currency']['symbol_left'] . $item['price'];?></td>
                    <td><span data-id="<?=$id;?>" class="glyphicon glyphicon-remove text-danger del-item" aria-hidden="true"></td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td>Всего:</td>
                <td colspan="6" class="text-right cart-qty"><?=$_SESSION['cart.qty'];?></td>
            </tr>
            <tr>
                <td>Общая стоимость:</td>
                <td colspan="6" class="text-right cart-sum"><?=$_SESSION['cart.currency']['symbol_left'] . $_SESSION['cart.sum'];?></td>
            </tr>
            </tbody>
        </table>
    </div>
<?php else: ?>
    <h3>Корзина пока еще пуста</h3>
<?php endif;?>
