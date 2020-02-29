var selector = '.color-list .color';
$(".color").css('background', function () { 
    return $(this).data('color')
});

$(selector).on('click', function(){
  var colorHEX = $(this).data('color');
  $(selector).removeClass('active');
  $(this).addClass('active');
  $('#setColor').val(colorHEX);
});