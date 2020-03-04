$(".color1").css('background',function(){
	return $(this).data('color');
});
$(".color2").css('background',function(){
	return $(this).data('color');
});
$(".color3").css('background',function(){
	return $(this).data('color');
});

$('.color-list1 .color1').on('click', function(){
  if($('.color1').hasClass("live") == false){
	  var colorHEX = $(this).data('color');
	  $('.color-list1 .color1').removeClass('live');
	  $(this).addClass('live');
	  $('#topColor').val(colorHEX);
	  console.log($(this));
	  console.log($('#topColor').val());
  }else{
	  console.log("color active");
	  $('.color1').removeClass('live');
	  $('#topColor').val('');
  }
});

$('.color-list2 .color2').on('click', function(){
	  if($('.color2').hasClass("live") == false){
		  var colorHEX = $(this).data('color');
		  $('.color-list2 .color2').removeClass('live');
		  $(this).addClass('live');
		  $('#bottomColor').val(colorHEX);
		  console.log($(this));
		  console.log($('#bottomColor').val());
	  }else{
		  console.log("color active");
		  $('.color2').removeClass('live');
		  $('#topColor').val('');
	  }
});

$('.color-list3 .color3').on('click', function(){
	  if($('.color3').hasClass("live") == false){
		  var colorHEX = $(this).data('color');
		  $('.color-list3 .color3').removeClass('live');
		  $(this).addClass('live');
		  $('#onepieceColor').val(colorHEX);
		  console.log($(this));
		  console.log($('#onepieceColor').val());
	  }else{
		  console.log("color active");
		  $('.color3').removeClass('live');
		  $('#topColor').val('');
	  }
});