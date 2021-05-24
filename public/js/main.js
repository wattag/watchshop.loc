/*Cart*/

$('body').on('click', '.add-to-cart-link', function (e){
    e.preventDefault();
    var id = $(this).data('id'),
        qty = $('.quantity input').val() ? $('.quantity input').val() : 1,
        mod = $('.available select').val();
    $.ajax({
        url: '/cart/add',
        data: {id: id, qty: qty,mod: mod},
        type: 'GET',
        success:function (res){
            showCart(res);
        },
        error: function (){
            alert('Ошибка! Попробуйте позже');
        }
    });
});

$('#cart .modal-body').on('click', '.del-item', function (){
   var id = $(this).data('id');
   $.ajax({
      url: '/cart/delete',
      data: {id: id},
      type: 'GET',
      success: function (res){
          showCart(res)
      },
       error: function (){
          alert('Ошибка! Что-то пошло не так')
       }
   });
});

function showCart(cart){
    if ($.trim(cart) === '<h3>Cart is empty</h3>'){
        $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display','none');
    }else {
        $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display','inline-block');
    }
    $('#cart .modal-body').html(cart);
    $('#cart').modal();
    if ($('.cart-sum').text()){
        $('.simpleCart_total').html($('#cart .cart-sum').text());
    }else {
        $('.simpleCart_total').text('Empty cart');
    }
}

function getCart(){
    $.ajax({
        url: '/cart/show',
        type: 'GET',
        success:function (res){
            showCart(res);
        },
        error: function (){
            alert('Ошибка! Попробуйте позже');
        }
    });
}

function clearCart(){
    $.ajax({
        url: '/cart/clear',
        type: 'GET',
        success:function (res){
            showCart(res);
        },
        error: function (){
            alert('Ошибка! Что-о пошло не так..');
        }
    });
}
/*Cart*/
$('#currency').change(function (){
    window.location = 'currency/change?curr=' + $(this).val();
});

$('.available select').on('change', function (){
    var modID = $(this).val(),
        color = $(this).find('option').filter(':selected').data('title'),
        price = $(this).find('option').filter(':selected').data('price'),
        basePrice = $('#base-price').data('base'),
        oldPrice = $('#old-price').data('base')
    if (price){
        $('#base-price').text(symboleLeft + " " + price + " "+ oldPrice) ;
    }else {
        $('#base-price').text(symboleLeft + " " + basePrice);
    }
});