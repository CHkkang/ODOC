<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <title>Object Detecting on CCTV &mdash;</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <scrpit tpye="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.wheelcolorpicker.js"></scrpit>
  <script type="text/javascript">
    $(function() {
      $('.snippet-output').each(function() {
        var snippetId = $(this).data('id');
        var snippet = $('#'+snippetId);
        var html = $(
          '<a href="#">Show code</a>' + 
          '<pre>' + snippet.get(0).innerHTML.replace(/</g, '&lt;').replace(/\n\t\t/g, "\n") + '</pre>'
        );
        $(this).append(html);
        $(this).children('a').on('click', function() {
          var container = $(this).closest('.snippet-output');
          if(container.hasClass('visible')) {
            container.removeClass('visible');
          }
          else {
            container.addClass('visible');
          }
          return false;
        });
      });
    });
  </script>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wheelcolorpicker.css"/>
  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css.jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
  <link href="${pageContext.request.contextPath}/resources/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">



</head>

<body style="background-color: #ccc;">

  <div class="site-wrap">
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    <!--  배너 -->
     <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <div class="site-logo"><a href="home">Object Detecting on <span>CCTV</span> </a></div>
          <div class="ml-auto">
            <nav class="site-navigation position-relative text-center" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
               <ul>
                <li><a href="#" class="human">분실물</a></li>
                <li><a href="#" class="lostThing">분실물</a></li>
                <li><a href="#" class="dog">유기견</a></li>
              </ul>
            </nav>
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3"></span></a>
          </div>

        </div>
      </div>

    </header>

    <!-- 배너 끝 -->
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
   <!-- 색상 조절 시작 
  <p>
     색상 선택
  </p>
  
  <div id="snippet-block" class="snippet">
    <p>
      <input
        id="color-block"
        type="text"
        value="#ff8800"
        data-wheelcolorpicker
        data-wcp-format="css"
        data-wcp-layout="block"
        data-wcp-sliders="wsvap"
        data-wcp-cssClass="color-block"
        data-wcp-autoResize="false"
      />
    </p>
    <p>
      Selected color:
      <span class="color-preview-box"></span>
      <span class="color-preview-text"></span>
      <span class="color-preview-alpha"></span>
    </p>

    <style type="text/css">
      .color-block {
        max-width: 340px;
        width: 100%;
        box-sizing: border-box;
      }
      .color-preview-box {
        display: inline-block;
        width: .75em;
        height: .75em;
        vertical-align: middle;
        padding: 2px;
        background-clip: content-box;
        border: solid 1px #888;
      }
    </style>
    <script type="text/javascript">
    $(function() {
      $('#color-block').on('colorchange', function(e) {
        var color = $(this).wheelColorPicker('value');
        var alpha = $(this).wheelColorPicker('color').a;
        $('.color-preview-box').css('background-color', color);
        $('.color-preview-text').text(color);
        $('.color-preview-alpha').text(Math.round(alpha * 100) + '%');
      });
    });
    </script>
  </div>
  -->
    <p>
    <input id="color-block" type="text" value="#ff8800" data-wheelcolorpicker="" data-wcp-format="css" data-wcp-layout="block" data-wcp-sliders="wsvap" data-wcp-cssclass="color-block" data-wcp-autoresize="false">
    </p>
    <p>
      Selected color:
      <span class="color-preview-box"></span>
      <span class="color-preview-text"></span>
      <span class="color-preview-alpha"></span>
    </p>

    <style type="text/css">
      .color-block {
        max-width: 340px;
        width: 100%;
        box-sizing: border-box;
      }
      .color-preview-box {
        display: inline-block;
        width: .75em;
        height: .75em;
        vertical-align: middle;
        padding: 2px;
        background-clip: content-box;
        border: solid 1px #888;
      }
    </style>
    <script type="text/javascript">
    $(function() {
      $('#color-block').on('colorchange', function(e) {
        var color = $(this).wheelColorPicker('value');
        var alpha = $(this).wheelColorPicker('color').a;
        $('.color-preview-box').css('background-color', color);
        $('.color-preview-text').text(color);
        $('.color-preview-alpha').text(Math.round(alpha * 100) + '%');
      });
    });
    </script>
  <!-- 색상 조절 끝 -->
  </body>
  </html>
    