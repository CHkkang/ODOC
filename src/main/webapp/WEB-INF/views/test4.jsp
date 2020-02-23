<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>Object Detecting on CCTV &mdash;</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css.jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.mb.YTPlayer.min.css"
	media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/paper-bootstrap-wizard.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css"
	rel="stylesheet" />
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modal.css"
	rel="stylesheet">

<!-- CSS 끝 -->
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" style="background-color: #66666;">
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



	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="myCenterModal" tabindex="-1"
		role="dialog" aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content modal-lg">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Pick Features</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<!--      Wizard container        -->
						<div class="wizard-container">
							<div class="card wizard-card" data-color="orange" id="wizard">
								<form action="" method="get">
									<!--        You can switch " data-color="azure" "  with one of the next bright colors: "blue", "green", "orange", "red"           -->
									<div class="wizard-header">
										<h3 class="wizard-title">무엇을 찾고 싶습니까?</h3>
										<p class="category">사람, 분실물, 유기견 중에서 찾고 싶은 것으르 고르세요.</p>
									</div>

									<div class="wizard-navigation">
										<div class="progress-with-circle">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="0" aria-valuemin="1" aria-valuemax="3"
												style="width: 21%;"></div>
										</div>
										<ul>
											<li><a href="#kind" data-toggle="tab">
													<div class="icon-circle">
														<i class="ti-list"></i>
													</div> Kind
											</a></li>
											<li><a href="#colorbyhuman" data-toggle="tab">
													<div class="icon-circle">
														<i class="ti-briefcase"></i>
													</div> Human
											</a></li>
											<li><a href="#colorbything" data-toggle="tab">
													<div class="icon-circle">
														<i class="ti-briefcase"></i>
													</div> Thing
											</a></li>
											<li><a href="#colorbydog" data-toggle="tab">
													<div class="icon-circle">
														<i class="ti-briefcase"></i>
													</div> Dog
											</a></li>
										</ul>
									</div>
									<div class="tab-content">
										<div class="tab-pane" id="kind">
											<h5 class="info-text">한 가지만 선택 해주세요.</h5>
											<div class="row">
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="radio" name="kind" value="human"
															onclick="actionHuman()">
														<div class="card card-radios card-hover-effect">
															<i class="ti-user"></i>
															<p>사람</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="radio" name="kind" value="thing"
															onclick="actionThing()">
														<div class="card card-radios card-hover-effect">
															<i class="ti-briefcase"></i>
															<p>분실물</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="radio" name="kind" value="dog"
															onclick="actionDog()">
														<div class="card card-radios card-hover-effect">
															<i class="ti-pinterest-alt"></i>
															<p>유기견</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="colorbyhuman">
											<h5 class="info-text">찾고 싶은 사람의 인상착의</h5>
											<div class="row">
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="humanColor" value="top">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>top</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="humanColor" value="bottom">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>bottom</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="humanColor" value="onepiece">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>one-piece</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="colorbything">
											<h5 class="info-text">찾고 싶은 물건의 종류</h5>
											<div class="row">
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="thingColor" value="wallet">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>wallet</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="thingColor" value="backpack">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>backpack</p>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="thingColor" value="phone">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>phone</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="colorbydog">
											<h5 class="info-text">찾고 싶은 유기견의 색상</h5>
											<div class="row">
												<div class="col">
													<div class="choice" data-toggle="wizard-checkbox">
														<input type="checkbox" name="dogColor" value="dog">
														<div class="card card-checkboxes card-hover-effect">
															<i class="ti-control-record"></i>
															<p>color</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="wizard-footer">
											<div class="pull-right">
												<input type='button'
													class='btn btn-next btn-fill btn-primary btn-wd'
													name='next' value='Next' /> <input type='button'
													class='btn btn-finish btn-fill btn-primary btn-wd'
													name='finish' value='Finish' />
											</div>
											<div class="pull-left">
												<input type='button'
													class='btn btn-previous btn-default btn-wd' name='previous'
													value='Previous' />
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- wizard container -->
					</div>
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
		src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.mb.YTPlayer.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap.wizard.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/demo.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/paper-bootstrap-wizard.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"
		type="text/javascript"></script>
	<!-- js 파일 끝 -->
</body>
</html>
