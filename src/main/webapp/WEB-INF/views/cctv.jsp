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
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css.jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.mb.YTPlayer.min.css"
	media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
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
<!-- CSS 끝 -->
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" style="background-color: #66666;">
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
				<div class="d-flex justify-content-center">
					<div class="site-logo"
						style="text-align: center; display: inline-block;">
						<a href="home" data-toggle="modal" data-target="#myCenterModal"
							style="margin-top: 2px"> What object do you want to find? <span>Click
								here</span>
						</a>
					</div>
				</div>
			</div>
		</header>
	</div>
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
					<!--   Big container   -->
					<div class="container">
						<div class="row">
							<div class="col">
								<!-- Wizard container -->
								<div class="wizard-container" style="padding-top: 20px">
									<div class="card wizard-card" data-color="red" id="wizard">
										<form action="" method="">
											<!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->

											<div class="wizard-header">
												<h3 class="wizard-title">Book a Room</h3>
												<h5>This information will let us know more about you.</h5>
											</div>
											<div class="wizard-navigation">
												<ul>
													<li><a href="#kind" data-toggle="tab">Kind</a></li>
													<li><a id="colorLink" href="#color" data-toggle="tab">Color</a></li>
													<li><a href="#description" data-toggle="tab">Extra
															Details</a></li>
												</ul>
											</div>

											<div class="tab-content">
												<div class="tab-pane" id="kind">
													<h4 class="info-text">What type of object would you
														want?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-radio"
																	rel="tooltip" title="This is good if you travel alone.">
																	<input type="radio" name="job" value="human"
																		onclick="gotoURL(this.value)">
																	<div class="icon">
																		<i class="material-icons">accessibility</i>
																	</div>
																	<h6>Human</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-radio"
																	rel="tooltip"
																	title="Select this room if you're traveling with your family.">
																	<input type="radio" name="job" value="thing"
																		onclick="gotoURL(this.value)">
																	<div class="icon">
																		<i class="material-icons">card_travel</i>
																	</div>
																	<h6>Thing</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-radio"
																	rel="tooltip"
																	title="Select this option if you are coming with your team.">
																	<input type="radio" name="job" value="dogs"
																		onclick="gotoURL(this.value)">
																	<div class="icon">
																		<i class="material-icons">pets</i>
																	</div>
																	<h6>Dog</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="human">
													<h4 class="info-text">What type of room would you
														want?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="This is good if you travel alone.">
																	<input type="radio" name="job" value="Design">
																	<div class="icon">
																		<i class="material-icons">weekend</i>
																	</div>
																	<h6>제발</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this room if you're traveling with your family.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">home</i>
																	</div>
																	<h6>나와줘</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this option if you are coming with your team.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">business</i>
																	</div>
																	<h6>흑흑</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="thing">
													<h4 class="info-text">What type of room would you
														want?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="This is good if you travel alone.">
																	<input type="radio" name="job" value="Design">
																	<div class="icon">
																		<i class="material-icons">weekend</i>
																	</div>
																	<h6>Single</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this room if you're traveling with your family.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">home</i>
																	</div>
																	<h6>Family</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this option if you are coming with your team.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">business</i>
																	</div>
																	<h6>Business</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="dog">
													<h4 class="info-text">What type of room would you
														want?</h4>
													<div class="row">
														<div class="col-sm-10 col-sm-offset-1">
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip" title="This is good if you travel alone.">
																	<input type="radio" name="job" value="Design">
																	<div class="icon">
																		<i class="material-icons">weekend</i>
																	</div>
																	<h6>Single</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this room if you're traveling with your family.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">home</i>
																	</div>
																	<h6>Family</h6>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="choice" data-toggle="wizard-checkbox"
																	rel="tooltip"
																	title="Select this option if you are coming with your team.">
																	<input type="checkbox" name="job" value="Code">
																	<div class="icon">
																		<i class="material-icons">business</i>
																	</div>
																	<h6>Business</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="description">
													<div class="row">
														<h4 class="info-text">Drop us a small description.</h4>
														<div class="col-sm-6 col-sm-offset-1">
															<div class="form-group">
																<label>Room description</label>
																<textarea class="form-control" placeholder="" rows="6"></textarea>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="control-label">Example</label>
																<p class="description">"The room really nice name is
																	recognized as being a really awesome room. We use it
																	every sunday when we go fishing and we catch a lot. It
																	has some kind of magic shield around it."</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="wizard-footer">
												<div class="pull-right">
													<input type='button'
														class='btn btn-next btn-fill btn-danger btn-wd'
														name='next' value='Next' /> <input type='button'
														class='btn btn-finish btn-fill btn-danger btn-wd'
														name='finish' value='Finish' />
												</div>
												<div class="pull-left">
													<input type='button'
														class='btn btn-previous btn-fill btn-default btn-wd'
														name='previous' value='Previous' />

													<div class="footer-checkbox">
														<div class="col-sm-12">
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label> Subscribe to our newsletter
															</div>
														</div>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
										</form>
									</div>
								</div>
								<!-- wizard container -->
							</div>
						</div>
						<!-- row -->
					</div>
					<!--  big container -->
				</div>
				<!--  modal body -->
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
		src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
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
	<!-- js 파일 끝 -->
	
	<script>
		function gotoURL(url) {
			var realUrl = '#' + url;
			$('.colorLink').attr('href', realUrl);
		}
	</script>
</body>
</html>