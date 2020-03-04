<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>Object Detecting on CCTV &mdash;</title>
  <!-- Canonical SEO -->
    <link rel="canonical" href="https://www.creative-tim.com/product/paper-bootstrap-wizard"/>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-boot-strap-wizard.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css.jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-bootstrap-wizard.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
  <!-- CSS 끝 -->
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('finishBtn').onclick = function() {
			document.getElementById('find').submit();
			console.log("submit");
			return false;
		};
	};
	function isChecked(inputid) {
		var c = $('#' + inputid).attr('class');

		var id = "";
		// console.log($("#longBottomC").is(":checked"));
		// console.log($("#longTopC").is(":checked"));
		// .prop("checked", true);
		if (c == "choice") {
			if (inputid.includes("OnePiece")) {
				if (inputid.includes("Top")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longTopOnePiece"
							: "shortTopOnePiece";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				if (inputid.includes("Bottom")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longBottomOnePiece"
							: "shortBottomOnePiece";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}

				$("div[id$='Top']").each(function() {
					$(this).attr("class", "choice");
				});
				$("div[id$='Bottom']").each(function() {
					$(this).attr("class", "choice");
				});
				$("input[id$='TopC']").each(function() {
					$(this).prop("checked", false);
				});
				$("input[id$='BottomC']").each(function() {
					$(this).prop("checked", false);
				});
			} else {
				if (inputid.includes("Top")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longTop" : "shortTop";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				if (inputid.includes("Bottom")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longBottom"
							: "shortBottom";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				$("div[id$='OnePiece']").each(function() {
					$(this).attr("class", "choice");
				});
				$("input[id$='OnePieceC']").each(function() {
					$(this).prop("checked", false);
				});
				//$("[id$='OnePiece']").attr("class","choice");
			}
		} else {
			if (inputid.includes("OnePiece")) {
				if (inputid.includes("Top")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longTopOnePiece"
							: "shortTopOnePiece";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				if (inputid.includes("Bottom")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longBottomOnePiece"
							: "shortBottomOnePiece";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				$("div[id$='Top']").each(function() {
					$(this).attr("class", "choice");
				});
				$("div[id$='Bottom']").each(function() {
					$(this).attr("class", "choice");
				});
				$("input[id$='TopC']").each(function() {
					$(this).prop("checked", false);
				});
				$("input[id$='BottomC']").each(function() {
					$(this).prop("checked", false);
				});
			} else {
				if (inputid.includes("Top")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longTop" : "shortTop";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}
				if (inputid.includes("Bottom")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longBottom"
							: "shortBottom";
					$("#" + id).attr("class", "choice");

					$("#" + id + "C").prop("checked", false);
				}

				$("div[id$='OnePiece']").each(function() {
					$(this).attr("class", "choice");
				});
				$("input[id$='OnePieceC']").each(function() {
					$(this).prop("checked", false);
				});
			}
		}
	}
	var page = 1;
	function pageCtrl(vvalue) {
		if (vvalue == "Finish")
			page = 1;
		if (vvalue == "Previous")
			--page;
		if (vvalue == "Next")
			++page;
	}
	function pageMove(vvalue) {
		console.log($('.wari .gari').length);
		console.log($('.wari .gari:nth-child(2) a'));
		console.log($('.wari .gari:first').html());
		console.log($('.color-list .color').parent().parent().children());
		console.log(page + "페이지");
		
		if (page == 1) {
			console.log("1페이지");
			var v = $('input:radio[name=kind]').is(":checked"); // check == true
			console.log($('input:radio[name=kind]').val());
			console.log(v);
			if (v) {
				value = $('input:radio[name=kind]:checked').val();
				console.log(value);
				$("#detailLink").attr("href", "#" + value);
			}
		}
		if (page == 2) {
		}
		pageCtrl(vvalue);
	}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="background-color: rgba(0, 0, 0, 0.5)">
  <div class="site-wrap">
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
      <div class="container-fluid">
        <div class="d-flex align-items-center">
           <div class="site-logo" style="margin:0 auto;">
          		<a href="" data-toggle="modal" 
          				   data-target="#myCenterModal">
							What object do you want to find? <span>Click here</span>
				</a>
			</div>
          </div>
        </div>
      </div>
    </header>
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
											<div class="wizard-navigaton">
												<ul class="wari">
													<li class="gari"><a href="#kind" data-toggle="tab"
														style="pointer-events: none;">Kind</a></li>
													<li class="gari"><a id="detailLink" href=""
														data-toggle="tab" style="pointer-events: none;">Details</a></li>
												</ul>
											</div>
											<div class="tab-content">
												<div class="tab-pane" id="kind">
													<h4 class="info-text">What type of object would you
														want?</h4>
													<div class="row">
															<div class="col-sm-4">
																<div class="choice"
																	data-toggle="wizard-radio" rel="tooltip" title="사람">
																	<input type="radio" name="kind" value="human">
																	<div class="icon">
																		<i class="material-icons">accessibility</i>
																	</div>
																	<h6>Human</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice"
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
																<div class="choice"
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
												<div class="tab-pane" id="human">
													<div class="row">
														<div class="col">
															<div class="container2">
																<div class="color-picker block-center">
																	<ul class="color-list">
																		<li class="color" data-color="#ff0000"></li>
																		<!-- 빨 -->
																		<li class="color" data-color="#ff69b4"></li>
																		<!-- 핑 -->
																		<li class="color" data-color="#ff8400"></li>
																		<!-- 주 -->
																		<li class="color" data-color="#ffe600"></li>
																		<!-- 노 -->
																		<li class="color" data-color="#26ff00"></li>
																		<!-- 초 -->
																		<li class="color" data-color="#0022ff"></li>
																		<!-- 파 -->
																		<li class="color" data-color="#252069"></li>
																		<!-- 남 -->
																		<li class="color" data-color="#00eeff"></li>
																		<!-- 하늘  -->
																		<li class="color" data-color="#a805fa"></li>
																		<!-- 보-->
																		<li class="color" data-color="#f1b0ff"></li>
																		<!-- 연보 -->
																		<li class="color" data-color="#ffffff"></li>
																		<!-- 흰 -->
																		<li class="color" data-color="#000000"></li>
																		<!-- 검 -->
																		<li class="color" data-color="#6e4129"></li>
																		<!-- 갈 -->
																		<li class="color" data-color="#828282"></li>
																		<!-- 회 -->
																		<li class="color" data-color="#2a5c35"></li>
																		<!-- 카키  -->
																		<li class="color" data-color="#c9b56b"></li>
																		<!-- 베이지 -->
																	</ul>
																	<input type="text" class="form-control" id="topColor"
																		style="margin-bottom: 0px;" />
																</div>
															</div>
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
															</div>														
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
															</div>														
														</div>
													</div>
													<div class="row">
														<div class="col">
															<div class="container2">
																<div class="color-picker block-center">
																	<ul class="color-list">
																		<li class="color" data-color="#ff0000"></li>
																		<!-- 빨 -->
																		<li class="color" data-color="#ff69b4"></li>
																		<!-- 핑 -->
																		<li class="color" data-color="#ff8400"></li>
																		<!-- 주 -->
																		<li class="color" data-color="#ffe600"></li>
																		<!-- 노 -->
																		<li class="color" data-color="#26ff00"></li>
																		<!-- 초 -->
																		<li class="color" data-color="#0022ff"></li>
																		<!-- 파 -->
																		<li class="color" data-color="#252069"></li>
																		<!-- 남 -->
																		<li class="color" data-color="#00eeff"></li>
																		<!-- 하늘  -->
																		<li class="color" data-color="#a805fa"></li>
																		<!-- 보-->
																		<li class="color" data-color="#f1b0ff"></li>
																		<!-- 연보 -->
																		<li class="color" data-color="#ffffff"></li>
																		<!-- 흰 -->
																		<li class="color" data-color="#000000"></li>
																		<!-- 검 -->
																		<li class="color" data-color="#6e4129"></li>
																		<!-- 갈 -->
																		<li class="color" data-color="#828282"></li>
																		<!-- 회 -->
																		<li class="color" data-color="#2a5c35"></li>
																		<!-- 카키  -->
																		<li class="color" data-color="#c9b56b"></li>
																		<!-- 베이지 -->
																	</ul>
																	<input type="text" class="form-control" id="topColor"
																		style="margin-bottom: 0px;" />
																</div>
															</div>
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
															</div>												
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
															</div>														
														</div>														
													</div>
													<div class="row">
														<div class="col">
															<div class="container2">
																<div class="color-picker block-center">
																	<ul class="color-list">
																		<li class="color" data-color="#ff0000"></li>
																		<!-- 빨 -->
																		<li class="color" data-color="#ff69b4"></li>
																		<!-- 핑 -->
																		<li class="color" data-color="#ff8400"></li>
																		<!-- 주 -->
																		<li class="color" data-color="#ffe600"></li>
																		<!-- 노 -->
																		<li class="color" data-color="#26ff00"></li>
																		<!-- 초 -->
																		<li class="color" data-color="#0022ff"></li>
																		<!-- 파 -->
																		<li class="color" data-color="#252069"></li>
																		<!-- 남 -->
																		<li class="color" data-color="#00eeff"></li>
																		<!-- 하늘  -->
																		<li class="color" data-color="#a805fa"></li>
																		<!-- 보-->
																		<li class="color" data-color="#f1b0ff"></li>
																		<!-- 연보 -->
																		<li class="color" data-color="#ffffff"></li>
																		<!-- 흰 -->
																		<li class="color" data-color="#000000"></li>
																		<!-- 검 -->
																		<li class="color" data-color="#6e4129"></li>
																		<!-- 갈 -->
																		<li class="color" data-color="#828282"></li>
																		<!-- 회 -->
																		<li class="color" data-color="#2a5c35"></li>
																		<!-- 카키  -->
																		<li class="color" data-color="#c9b56b"></li>
																		<!-- 베이지 -->
																	</ul>
																	<input type="text" class="form-control" id="topColor"
																		style="margin-bottom: 0px;" />
																</div>
															</div>
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
															</div>														
														</div>
														<div class="col">
															<div class="choice" data-toggle="wizard-checkbox"
																rel="tooltip" title="Top" id="longTop"
																onclick="isChecked(this.id);">
																<input type="checkbox" name="topKind" value="longTopC"
																	id="longTopC">
																<div class="icon">
																	<img src="${pageContext.request.contextPath}/resources/icon/longtop.svg"/>
																</div>
																<h6>긴팔</h6>
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
    <!-- .site-wrap -->
    
<!-- js 파일들 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>  
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>  
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!-- modal form js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/material-bootstrap-wizard.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<!-- js 파일 끝 -->

  </body>
  </html>
    
