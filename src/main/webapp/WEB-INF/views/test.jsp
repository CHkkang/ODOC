<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<!-- CSS -->
</head>
<body>
	<div data-component="navbar">
		<nav class="navbar p-0 fixed-top">
			<button class="navbar-toggler navbar-toggler-left rounded-0 border-0"
				type="button" data-toggle="collapse"
				data-target="#megamenu-dropdown" aria-controls="megamenu-dropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fa fa-bars"></i><span class="ml-3">특징 선택</span>
			</button>

			<div>
				<a class="navbar-brand px-1" href="#"><img
					src="http://kris.agentfire2.com/wp-content/mu-plugins/agentfire-shared-library/img/agentfire.svg"
					class="d-inline-block mt-1" alt="AgentFire Logo" height="40"></a>

			</div>

			<div class="megamenu">
				<div class="collapse navbar-collapse" id="megamenu-dropdown">
					<div class="megamenu-links">
					    <!--  ROW   -->
						<div class="row">
							<div class="col-md-4 px-0">
								<a
									class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3 pl-5"
									data-toggle="collapse" href="#menuOne" aria-expanded="false"
									aria-controls="collapseExample" id="more">사람 찾기
									<i class="fa fa-minus float-right" aria-hidden="true"></i> <i
									class="fa fa-plus float-right" aria-hidden="true"></i>
								</a>
								<!-- button close -->
								<div class="collapse" id="menuOne">
									<div class="list-group border-0">
										<ul class="list-group-item list-group-item-action border-0 pl-4 py-3">상의
											<li>색상 고르기</li>
										</ul>
										<ul class="list-group-item list-group-item-action border-0 pl-4 py-3">하의
											<li>색상 고르기</li>
										</ul>
									</div>
									<!-- /.list-group -->
								</div>
								<!-- /.collapse -->
							</div>
							<!-- /.col-md-3 -->

							<div class="col-md-4 px-0">
								<a
									class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3"
									data-toggle="collapse" href="#menuTwo" aria-expanded="false"
									aria-controls="collapseExample" id="more">분실물 찾기 <i
									class="fa fa-minus float-right" aria-hidden="true"></i> <i
									class="fa fa-plus float-right" aria-hidden="true"></i>
								</a>
								<!-- button close -->
								<div class="collapse" id="menuTwo">
									<div class="list-group border-0">
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">AllFlyouts</a> 
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">AllFlyouts</a>
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">AllFlyouts</a>
									</div>
									<!-- /.list-group -->
								</div>
								<!-- /.collapse -->
							</div>
							<!-- /.col-md-3 -->
							<div class="col-md-4 px-0">
								<a
									class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3"
									data-toggle="collapse" href="#menuThree" aria-expanded="false"
									aria-controls="collapseExample" id="more">유기견 찾기 <i
									class="fa fa-minus float-right" aria-hidden="true"></i> <i
									class="fa fa-plus float-right" aria-hidden="true"></i>
								</a>
								<!-- button close -->
								<div class="collapse" id="menuThree">
									<div class="list-group border-0">
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
										<a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
									</div>
									<!-- /.list-group -->
								</div>
								<!-- /.collapse -->
							</div>
						</div>
						</div>
					</div>
					<!-- /.megamenu-links -->
				</div>
		</nav>
	</div>
	<!-- END TOP NAVBAR -->


	<div class="wp-content">
		<div class="container-fluid">
	 <!-- 영상 나오는 부분 -->
     <!-- Page Heading -->
      <div class="row">
      <video id="humanVideo" class="player" controls autoplay loop muted
         preload="none" width="50%" height="50%"
         data-setup="{}">
         <source src="${pageContext.request.contextPath}/resources/11.mp4" type='video/mp4' />
         <track kind="captions" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
         <track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
      </video>
      <video id="humanVideo" class="video-js vjs-default-skin" controls autoplay loop muted
         preload="none" width="50%" height="50%"
         data-setup="{}">
         <source src="${pageContext.request.contextPath}/resources/11.mp4" type='video/mp4' />
         <track kind="captions" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
         <track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
      </video>
      </div>
      <div class="row">
      <video id="humanVideo" class="video-js vjs-default-skin" controls autoplay loop muted
         preload="none" width="50%" height="50%"
         data-setup="{}">
         <source src="${pageContext.request.contextPath}/resources/11.mp4" type='video/mp4' />
         <track kind="captions" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
         <track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
      </video>
      <video id="humanVideo" class="video-js vjs-default-skin" controls autoplay loop muted
         preload="none" width="50%" height="50%"
         data-setup="{}">
         <source src="${pageContext.request.contextPath}/resources/11.mp4" type='video/mp4' />
         <track kind="captions" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
         <track kind="subtitles" src="video-/resources/js/demo.captions.vtt"
            srclang="en" label="English"></track>
         <!-- Tracks need an ending tag thanks to IE9 -->
      </video>
      </div>
   <!-- 영상 나오는 부분 끝-->
		</div>
		
	</div>

	<!-- JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.wheelcolorpicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.wheelcolorpicker.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/js/jquery.mb.YTPlayer.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!-- JS -->
</body>
</html>