$(".color1").css('background',function(){
	return $(this).data('color');
});
$(".color2").css('background',function(){
	return $(this).data('color');
});
$(".color3").css('background',function(){
	return $(this).data('color');
});

$('.color1').on('click', function(){
  if($('.color1').hasClass("live") == false){
	  var colorHEX = $(this).data('color');
	  $('.color1').removeClass('live');
	  $('.color3').removeClass('live');
	  $(this).addClass('live');
	  $('#topColor').val(colorHEX);
	  $('#onepieceColor').val('');
	  console.log($(this));
	  console.log($('#topColor').val());
  }else{
	  console.log("color active");
	  $('.color1').removeClass('live');
	  $('#topColor').val('');
  }
});

$('.color2').on('click', function(){
	  if($('.color2').hasClass("live") == false){
		  var colorHEX = $(this).data('color');
		  $('.color2').removeClass('live');
		  $('.color3').removeClass('live');
		  $(this).addClass('live');
		  $('#bottomColor').val(colorHEX);
		  $('#onepieceColor').val('');
		  console.log($(this));
		  console.log($('#bottomColor').val());
	  }else{
		  console.log("color active");
		  $('.color2').removeClass('live');
		  $('#bottomColor').val('');
	  }
});

$('.color3').on('click', function(){
	  if($('.color3').hasClass("live") == false){
		  var colorHEX = $(this).data('color');
		  $('.color3').removeClass('live');
		  $('.color2').removeClass('live');
		  $('.color1').removeClass('live');
		  $(this).addClass('live');
		  $('#topColor').val('');
		  $('#bottomColor').val('');
		  $('#onepieceColor').val(colorHEX);
		  console.log($(this));
		  console.log($('#onepieceColor').val());
	  }else{
		  console.log("color active");
		  $('.color3').removeClass('live');
		  $('#onepieceColor').val('');
	  }
});