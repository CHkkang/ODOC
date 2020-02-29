<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>Object Detecting on CCTV &mdash;</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Canonical SEO -->
<link rel="canonical"
	href="https://www.creative-tim.com/product/paper-bootstrap-wizard" />
<!-- CSS -->
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/wizard-op.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css.jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
<link href="${pageContext.request.contextPath}/resources/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- CSS 끝 -->
<!-- script function -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('finishBtn').onclick = function() {
			document.getElementById('find').submit();
			console.log("submit");
			return false;
		};
	};
	function isChecked(inputid) {
		var c = $('#' + inputid).attr('class')
		console.log(inputid + "   " + c);
		if (c == "choice") {
			if (inputid == "shortTop") {
				console.log(inputid);
				$("#longTop").attr("class", "choice");
			}
			if (inputid == "longTop") {
				console.log(inputid);
				$("#shortTop").attr("class", "choice");
			}
			if (inputid == "shortBottom") {
				console.log(inputid);
				$("#longBottom").attr("class", "choice");
			}
			if (inputid == "longBottom") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
			}
			if (inputid == "longTopOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#shortShortOne").attr("class", "choice");
			}
			if (inputid == "shortTopOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#longShortOne").attr("class", "choice");
			}
			if (inputid == "longBottomOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#shortBottomOne").attr("class", "choice");
			}
			if (inputid == "shortBottomOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#longBottomOne").attr("class", "choice");
			}
		} else {
			if (inputid == "shortTop") {
				console.log(inputid);
				$("#longTop").attr("class", "choice");
			}
			if (inputid == "longTop") {
				console.log(inputid);
				$("#shortTop").attr("class", "choice");
			}
			if (inputid == "shortBottom") {
				console.log(inputid);
				$("#longBottom").attr("class", "choice");
			}
			if (inputid == "longBottom") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
			}
			if (inputid == "longTopOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#shortShortOne").attr("class", "choice");
			}
			if (inputid == "shortTopOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#longShortOne").attr("class", "choice");
			}
			if (inputid == "longBottomOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#shortBottomOne").attr("class", "choice");
			}
			if (inputid == "shortBottomOne") {
				console.log(inputid);
				$("#shortBottom").attr("class", "choice");
				$("#longBottom").attr("class", "choice");
				$("#shortTop").attr("class", "choice");
				$("#longTop").attr("class", "choice");
				$("#longBottomOne").attr("class", "choice");
			}
		}
	}
	var page = 0;
	function pageCtrl(vvalue) {
		console.log("뭐냐  : " + vvalue);
		if (vvalue == "Finish")
			page = 1;
		if (vvalue == "Previous")
			page--;
		if (vvalue == "Next")
			page++;
	}
	function pageMove(vvalue) {
		console.log(page + "페이지");
		pageCtrl(vvalue);
		if (page == 1) {
			console.log("1페이지");
			var v = $('input:radio[name=kind]').is(":checked"); // check == true
			if (v) {
				value = $('input:radio[name=kind]:checked').val();
				console.log(value);
				$("#detailLink").attr("href", "#" + value);
			}
		}
		if (page == 2) {
		}
	}
	$('[data-toggle="tooltip"]').tooltip();
</script>
</head>
<body ata-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
	<div class="site-wrap">
		<header class="site-navbar py-4 js-sticky-header site-navbar-target"
			role="banner">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<div class="site-logo">
						<a href="" data-toggle="modal" data-target="#myCenterModal"
							style="margin-top: 2px; text-align: center; display: inline-block;"> What object do you want to find? <span>Click
								here</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>


	<!--팝업-->
	<div class="modal fade" id="myCenterModal" tabindex="-1" role="dialog"
		aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog"
			style="max-width: 100%; width: 70%; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<h4
						style="margin-block-start: 0em; margin-block-end: 0em; margin-inline-start: 0px; margin-inline-end: 0px;">
						Pick Features</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col">
								<!-- Wizard container -->
								<div class="wizard-container" style="padding-top: 20px">
									<div class="card wizard-card" data-color="red" id="wizard">
										<form id="find" action="cctv" method="">
											<!-- one of the next bright colors: "green", "orange", "red", "purple", "blue" -->
											<div class="wizard-header">
												<h3 class="wizard-title">무엇을 찾고 싶습니까?</h3>
												<h5>찾고 싶은 것의 특징을 체크 해주세요</h5>
											</div>
											<div class="wizard-navigation">
												<ul>
													<li><a href="#kind" data-toggle="tab"
														style="pointer-events: none;">Kind</a></li>
													<li><a id="detailLink" href="" data-toggle="tab"
														style="pointer-events: none;">Details</a></li>
												</ul>
											</div>
											<div class="tab-content">
												<div class="tab-pane" id="kind">
													<h4 class="info-text">What type of object would you
														want?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div id="nClick" class="choice"
																	data-toggle="wizard-radio" rel="tooltip" title="사람">
																	<input type="radio" name="kind" value="human">
																	<div class="icon">
																		<i class="material-icons">accessibility</i>
																	</div>
																	<h6>Human</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div id="nClick" class="choice"
																	data-toggle="wizard-radio" rel="tooltip"
																	title="핸드폰, 지갑, 가방">
																	<input type="radio" name="kind" value="thing">
																	<div class="icon">
																		<i class="material-icons">card_travel</i>
																	</div>
																	<h6>Thing</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div id="nClick" class="choice"
																	data-toggle="wizard-radio" rel="tooltip" title="유기견">
																	<input type="radio" name="kind" value="pets">
																	<div class="icon">
																		<i class="material-icons">pets</i>
																	</div>
																	<h6>Pets</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="human">
													<h4 class="info-text">What color is the person's
														clothes?</h4>
													<div class="row">
														<div class="col-xs-6 col-sm-2"
															style="text-align: center; margin-top: 28px;">
															<h2 style="font-weight: bold;">TOP</h2>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="topKind" value="longTop"
																	id="longTopC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>긴팔</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="shortTop"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="topKind" value="shortTop"
																	id="shortTopC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>반팔</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2"
															style="text-align: center; margin-top: 28px;">
															<h2 style="font-weight: bold;">BOTTOM</h2>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Bottom" id="longBottom"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="bottomKind"
																	value="longBottom">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>긴바지</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice " data-toggle="wizard-checkbox"
																rel="tooltip" title="Bottom" id="shortBotoom"
																onclick="isChecked(this.id)">
																<input class="choice" data-toggle="wizard-checkbox"
																	type="checkbox" name="bottomKind" value="shortBottom">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>반바지</h6>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-6 col-sm-2"
															style="text-align: center; margin-top: 10px;">
															<h2 style="font-weight: bold;">One Piece</h2>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTopOne"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="onepieceKind"
																	value="longTopOne" id="longTopC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>한벌 긴팔</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="shortTopOne"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="onepieceKind"
																	value="shortTopOne" id="shortTopC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>한벌 반팔</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longBottomOne"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="onepieceKind"
																	value="longBottomOne" id="longBottomC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>한벌 긴바지</h6>
															</div>
														</div>
														<div class="col-xs-6 col-sm-2">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="shortBottomOne"
																onclick="isChecked(this.id)">
																<input type="checkbox" name="onepieceKind"
																	value="shortBottomOne" id="shortBottomC">
																<div class="icon">
																	<i class="material-icons">panorama_fish_eye</i>
																</div>
																<h6>한벌 반바지</h6>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="thing">
													<h4 class="info-text">What thing?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="지갑">
																	<input type="checkbox" name="thingKind" value="wallet">
																	<div class="icon">
																		<i class="material-icons">payment</i>
																	</div>
																	<h6>Wallet</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="휴대폰">
																	<input type="checkbox" name="thingKind" value="phone">
																	<div class="icon">
																		<i class="material-icons">phone_iphone</i>
																	</div>
																	<h6>Phone</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="백팩">
																	<input type="checkbox" name="thingKind" value="bag">
																	<div class="icon">
																		<i class="material-icons">work</i>
																	</div>
																	<h6>Backpack</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="pets">
													<h4 class="info-text">What pet?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-6">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="강아지">
																	<input type="checkbox" name="petKind" value="dog">
																	<div class="icon">
																		<i class="material-icons">pets</i>
																	</div>
																	<h6>Dog</h6>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="고양이">
																	<input type="checkbox" name="petKind" value="cat">
																	<div class="icon">
																		<i class="material-icons">pets</i>
																	</div>
																	<h6>Cat</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- tab content end -->
											<div class="wizard-footer">
												<div class="pull-right">
													<input type='button'
														class='btn btn-next btn-fill btn-danger btn-wd'
														name='next' id="nextBtn" value='Next'
														onclick="pageMove(this.value)" /> <input type='button'
														class='btn btn-finish btn-fill btn-danger btn-wd'
														id='finishBtn' name='finish' value='Finish'
														onclick="pageMove(this.value)" />
												</div>
												<div class="pull-left">
													<input type='button'
														class='btn btn-previous btn-fill btn-default btn-wd'
														name='previous' value='Previous'
														onclick="pageMove(this.value)" />
												</div>
												<div class="clearfix"></div>
											</div>
										</form>
										<!-- form end -->
									</div>
									<!-- wizard card end -->
								</div>
								<!-- wizard container end -->
							</div>
							<!-- col end -->
						</div>
						<!-- row end -->
					</div>
					<!-- container end  -->
				</div>
				<!--  modal body end -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 영상 나오는 부분 -->
	<!-- Page Heading -->
	<div class="row">
		<video id="humanVideo" class="player" controls autoplay loop muted
			preload="none" width="50%" height="50%" data-setup="{}">
			<source src="${pageContext.request.contextPath}/resources/11.mp4"
				type='video/mp4' />
			<track kind="captions" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
			<track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
		</video>
		<video id="humanVideo" class="video-js vjs-default-skin" controls
			autoplay loop muted preload="none" width="50%" height="50%"
			data-setup="{}">
			<source src="${pageContext.request.contextPath}/resources/11.mp4"
				type='video/mp4' />
			<track kind="captions" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
			<track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
		</video>
	</div>
	<div class="row">
		<video id="humanVideo" class="video-js vjs-default-skin" controls
			autoplay loop muted preload="none" width="50%" height="50%"
			data-setup="{}">
			<source src="${pageContext.request.contextPath}/resources/11.mp4"
				type='video/mp4' />
			<track kind="captions" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
			<track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
		</video>
		<video id="humanVideo" class="video-js vjs-default-skin" controls
			autoplay loop muted preload="none" width="50%" height="50%"
			data-setup="{}">
			<source src="${pageContext.request.contextPath}/resources/11.mp4"
				type='video/mp4' />
			<track kind="captions" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
			<track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
				srclang="en" label="English"></track>
			<!-- Tracks need an ending tag thanks to IE9 -->
		</video>
	</div>
	<!-- 영상 나오는 부분 끝-->
	<!--   Big container   -->
	<script>
		function setTextColor(picker) {
			document.getElementsByTagName('checkbox')[0].style.color = '#'
					+ picker.toString()
		}
	</script>
	<!-- js 파일들 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.mb.YTPlayer.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wizard-op.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
	<!-- js 파일 끝 -->
</body>
</html>