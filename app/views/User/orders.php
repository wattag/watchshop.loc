<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li><a href="<?=PATH;?>">Главная</a></li>
                <li><a href="<?=PATH;?>/user/cabinet">Личный кабинет</a></li>
                <li class="active">История заказов</li>
            </ol>
        </div>
    </div>
</div>
<div class="prdt">
    <div class="container">
        <div class="prdt-top">
            <div class="col-md-12 prdt-left">
                <?php if ($orders): ?>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped table-condensed">
                        <thead>
                        <tr>
                            <th style="width: 20%">Статус заказа</th>
                            <th style="width: 20%">Сумма</th>
                            <th style="width: 20%">Дата создания</th>
                            <th style="width: 10%">Действия</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($orders as $order): ?>
                            <?php $class = $order->status ? 'success' : '';?>
                            <tr class="<?=$class;?>">
                                <td><?=$order->status ? 'Завершен': 'Не завершен';?></td>
                                <td><?=$order->sum;?> <?=$order->currency;?></td>
                                <td><?=$order->date;?></td>
                                <td><a href="#">Подробности</a></td>
                            </tr>
                        <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
                <?php else: ?>
                    <p class="text-danger"> Вы пока ничего не заказывали...</p>
                <?php endif;?>
            </div>
        </div>
    </div>
</div>