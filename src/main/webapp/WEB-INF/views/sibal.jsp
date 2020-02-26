<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>Object Detecting on CCTV &mdash;</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="assets/img/favicon.png" />
<title>Material Bootstrap Wizard by Creative Tim | Free Boostrap
	Wizard</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- Canonical SEO -->
<link rel="canonical"
	href="https://www.creative-tim.com/product/paper-bootstrap-wizard" />

<meta name="keywords"
	content="wizard, bootstrap wizard, creative tim, long forms, 3 step wizard, sign up wizard, beautiful wizard, long forms wizard, wizard with validation, paper design, paper wizard bootstrap, bootstrap paper wizard">
<meta name="description"
	content="Paper Bootstrap Wizard is a fully responsive wizard that is inspired by our famous Paper Kit  and comes with 3 useful examples and 5 colors.">

<!-- Schema.org markup for Google+ -->
<meta itemprop="name" content="Paper Bootstrap Wizard by Creative Tim">
<meta itemprop="description"
	content="Paper Bootstrap Wizard is a fully responsive wizard that is inspired by our famous Paper Kit  and comes with 3 useful examples and 5 colors.">
<meta itemprop="image"
	content="https://s3.amazonaws.com/creativetim_bucket/products/49/opt_pbw_thumbnail.jpg">

<!-- Twitter Card data -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@creativetim">
<meta name="twitter:title"
	content="Paper Bootstrap Wizard by Creative Tim">
<meta name="twitter:description"
	content="Paper Bootstrap Wizard is a fully responsive wizard that is inspired by our famous Paper Kit  and comes with 3 useful examples and 5 colors.">
<meta name="twitter:creator" content="@creativetim">
<meta name="twitter:image"
	content="https://s3.amazonaws.com/creativetim_bucket/products/49/opt_pbw_thumbnail.jpg">

<!-- Open Graph data -->
<meta property="og:title"
	content="Paper Bootstrap Wizard by Creative Tim | Free Boostrap Wizard" />
<meta property="og:type" content="article" />
<meta property="og:url"
	content="https://demos.creative-tim.com/paper-bootstrap-wizard/wizard-list-place.html" />
<meta property="og:image"
	content="https://s3.amazonaws.com/creativetim_bucket/products/49/opt_pbw_thumbnail.jpg" />
<meta property="og:description"
	content="Paper Bootstrap Wizard is a fully responsive wizard that is inspired by our famous Paper Kit  and comes with 3 useful examples and 5 colors." />
<meta property="og:site_name" content="Creative Tim" />

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/paper-bootstrap-wizard.css"
	rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css"
	rel="stylesheet" />

<!-- Fonts and Icons -->
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css"
	rel="stylesheet">
<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-NKDMSK6');
</script>
<!-- End Google Tag Manager -->
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/modal.css">
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

	<script type="text/javascript">
		function callFunction(newprogress) {
			console.log("불렸다.1");
			$('#theprogressbar').width(newprogress + "%").attr('aria-valuenow',
					newprogress);
			console.log("불렸다." + newprogress);
		}
	</script>

	<!--팝업-->
	<div class="modal fade" id="myCenterModal" tabindex="-1" role="dialog"
		aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog"
			style="max-width: 100%; width: 70%; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Pick Features</h4>
				</div>
				<div class="modal-body">
					<!--   Big container   -->
					<div class="container">
						<div class="row">
							<div class="col">

								<!--      Wizard container        -->
								<div class="wizard-container">

									<div class="card wizard-card" data-color="orange"
										id="wizardProfile">
										<form action="" method="">
											<!--        You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"          -->

											<div class="wizard-header text-center">
												<h3 class="wizard-title">Create your profile</h3>
												<p class="category">This information will let us know
													more about you.</p>
											</div>

											<div class="wizard-navigation">
												<div class="progress-with-circle">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="1" aria-valuemin="1" aria-valuemax="3"
														style="width: 21%;"></div>
												</div>
												<ul>
													<li><a href="#about" data-toggle="tab">
															<div class="icon-circle">
																<i class="ti-user"></i>
															</div> About
													</a></li>
													<li><a href="#account" data-toggle="tab">
															<div class="icon-circle">
																<i class="ti-settings"></i>
															</div> Work
													</a></li>
													<li><a href="#address" data-toggle="tab">
															<div class="icon-circle">
																<i class="ti-map"></i>
															</div> Address
													</a></li>
												</ul>
											</div>
											<div class="tab-content">
												<div class="tab-pane" id="about">
													<div class="row">
														<h5 class="info-text">Please tell us more about
															yourself.</h5>
														<div class="col-xs-4 col-sm-offset-1">
															<div class="picture-container">
																<div class="picture">
																	<img src="assets/img/default-avatar.jpg"
																		class="picture-src" id="wizardPicturePreview" title="" />
																	<input type="file" id="wizard-picture">
																</div>
																<h6>Choose Picture</h6>
															</div>
														</div>
														<div class="col-xs-6">
															<div class="form-group">
																<label>First Name <small>(required)</small></label> <input
																	name="firstname" type="text" class="form-control"
																	placeholder="Andrew...">
															</div>
															<div class="form-group">
																<label>Last Name <small>(required)</small></label> <input
																	name="lastname" type="text" class="form-control"
																	placeholder="Smith...">
															</div>
														</div>
														<div class="col-xs-10 col-xs-offset-1">
															<div class="form-group">
																<label>Email <small>(required)</small></label> <input
																	name="email" type="email" class="form-control"
																	placeholder="andrew@creative-tim.com">
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="account">
													<h5 class="info-text">What are you doing? (checkboxes)
													</h5>
													<div class="row">
														<div class="col-sm-8 col-sm-offset-2">
															<div class="col-xs-4">
																<div class="choice" data-toggle="wizard-checkbox">
																	<input type="checkbox" name="jobb" value="Design">
																	<div class="card card-checkboxes card-hover-effect">
																		<i class="ti-paint-roller"></i>
																		<p>Design</p>
																	</div>
																</div>
															</div>
															<div class="col-xs-4">
																<div class="choice" data-toggle="wizard-checkbox">
																	<input type="checkbox" name="jobb" value="Code">
																	<div class="card card-checkboxes card-hover-effect">
																		<i class="ti-pencil-alt"></i>
																		<p>Code</p>
																	</div>
																</div>
															</div>
															<div class="col-xs-4">
																<div class="choice" data-toggle="wizard-checkbox">
																	<input type="checkbox" name="jobb" value="Develop">
																	<div class="card card-checkboxes card-hover-effect">
																		<i class="ti-star"></i>
																		<p>Develop</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="address">
													<div class="row">
														<div class="col-xs-12">
															<h5 class="info-text">Are you living in a nice area?
															</h5>
														</div>
														<div class="col-xs-7 col-xs-offset-1">
															<div class="form-group">
																<label>Street Name</label> <input type="text"
																	class="form-control" placeholder="5h Avenue">
															</div>
														</div>
														<div class="col-xs-3">
															<div class="form-group">
																<label>Street Number</label> <input type="text"
																	class="form-control" placeholder="242">
															</div>
														</div>
														<div class="col-xs-5 col-xs-offset-1">
															<div class="form-group">
																<label>City</label> <input type="text"
																	class="form-control" placeholder="New York...">
															</div>
														</div>
														<div class="col-xs-5">
															<div class="form-group">
																<label>Country</label><br> <select name="country"
																	class="form-control">
																	<option value="Afghanistan">Afghanistan</option>
																	<option value="Albania">Albania</option>
																	<option value="Algeria">Algeria</option>
																	<option value="American Samoa">American Samoa
																	</option>
																	<option value="Andorra">Andorra</option>
																	<option value="Angola">Angola</option>
																	<option value="Anguilla">Anguilla</option>
																	<option value="Antarctica">Antarctica</option>
																	<option value="...">...</option>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="wizard-footer">
												<div class="pull-right">
													<input type='button'
														class='btn btn-next btn-fill btn-warning btn-wd'
														name='next' value='Next' /> <input type='button'
														class='btn btn-finish btn-fill btn-warning btn-wd'
														name='finish' value='Finish' />
												</div>

												<div class="pull-left">
													<input type='button'
														class='btn btn-previous btn-default btn-wd'
														name='previous' value='Previous' />
												</div>
												<div class="clearfix"></div>
											</div>
										</form>
									</div>
								</div>
								<!-- wizard container -->
							</div>
						</div>
						<!-- end row -->
					</div>
					<!--  big container -->
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
		<script
			src="${pageContext.request.contextPath}/resources/js/jscolor.js"
			type="text/javascript"></script>

		<!-- js 파일 끝 -->
</body>

<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap.wizard.js"
	type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

<!--  More information about jquery.validate here: https://jqueryvalidation.org/	 -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js" type="text/javascript"></script>
</html>