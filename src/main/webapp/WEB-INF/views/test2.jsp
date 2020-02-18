<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" language="javascript">
var video_player = document.getElementById("video_player");
video = video_player.getElementsByTagName("video")[0],
video_links = video_player.getElementsByTagName("figcaption")[0],
source = video.getElementsByTagName("source"),
link_list = [],
vidDir = "http://demosthenes.info/assets/videos/",
currentVid = 0,
allLnks = video_links.children,
lnkNum = allLnks.length;
video.removeAttribute("controls");
video.removeAttribute("poster");

(function() {
function playVid(index) {
 video_links.children[index].classList.add("currentvid");
    source[0].src = vidDir + link_list[index] + ".webm";  
  source[1].src = vidDir + link_list[index] + ".mp4";
    currentVid = index;
    video.load();
  video.play();
}

for (var i=0; i<lnkNum; i++) {
var filename = allLnks[i].href;
link_list[i] = filename.match(/([^\/]+)(?=\.\w+$)/)[0];
(function(index){
        allLnks[i].onclick = function(i){
        i.preventDefault();  
    for (var i=0; i<lnkNum; i++) {
    allLnks[i].classList.remove("currentvid");
    }
    playVid(index);
        }    
    })(i);
}
video.addEventListener('ended', function () {
    allLnks[currentVid].classList.remove("currentvid");
    if ((currentVid + 1) >= lnkNum) { nextVid = 0 } else { nextVid = currentVid+1 }
    playVid(nextVid);
})

video.addEventListener('mouseenter', function() {
    video.setAttribute("controls","true");
})

video.addEventListener('mouseleave', function() {
    video.removeAttribute("controls");
})

var indexOf = function(needle) {
    if(typeof Array.prototype.indexOf === 'function') {
        indexOf = Array.prototype.indexOf;
    } else {
        indexOf = function(needle) {
            var i = -1, index = -1;
      for(i = 0; i < this.length; i++) {
                if(this[i] === needle) {
                    index = i;
                    break;
                }}
            return index;
        };}
    return indexOf.call(this, needle);
};
  var focusedLink = document.activeElement;
  index = indexOf.call(allLnks, focusedLink);
  
document.addEventListener('keydown', function(e) {
if (index) {
  var focusedElement = document.activeElement;
    if (e.keyCode == 40 || e.keyCode == 39) { // down or right cursor
    var nextNode = focusedElement.nextElementSibling;
    if (nextNode) { nextNode.focus(); } else { video_links.firstElementChild.focus(); }
    }
   if (e.keyCode == 38 || e.keyCode == 37) { // up or left cursor
    var previousNode = focusedElement.previousElementSibling;
    if (previousNode) { previousNode.focus(); } else { video_links.lastElementChild.focus(); }
    }
 }
});

})();  
</script>

<!-- split between css and JavaScript-->

<style>
body { background: #222; }
#video_player { 
  display: table; line-height: 0;
  font-size: 0; background: #000;
  max-width: 1000px;
  margin: 0 auto;
}
#video_container { 
  position: relative;
}
#video_player div, #video_player figcaption { 
  display: table-cell;
  vertical-align: top; 
}
#video_container video { 
  position: absolute; 
  display: block;
  width: 100%;
  height: 100%;
  top: 0;
}
#video_player figcaption { width: 25%; }
#video_player figcaption a { display: block; }
#video_player figcaption a { 
  opacity: .5;
  transition: 1s opacity; 
}
#video_player figcaption a img, figure video { 
  width: 100%; height: 100%; 
}
#video_player figcaption a.currentvid, #video_player figcaption a:hover, #video_player figcaption a:focus { opacity: 1; }
@media (max-width: 700px) {
  #video_player video, #video_player figcaption { 
    display: table-row; 
  }
#video_container { padding-top: 56.25%; }
#video_player figcaption a { 
  display: inline-block; width: 33.33%; 
}
}

</style>

<figure id="video_player">
  <div id="video_container">
  <video controls poster="https://dl.dropboxusercontent.com/s/qs4iqol4io2nth7/Spice_and_Wolf_OP.png">
    <source src="${pageContext.request.contextPath}/resources/11.mp4" type="video/mp4">
    <source src="http://demosthenes.info/assets/videos/glacier.webm" type="video/webm">
</video>
</div>
<figcaption>
  <a href="${pageContext.request.contextPath}/resources/11.mp4" class="currentvid">
    <img src="${pageContext.request.contextPath}/resources/images/r2.jpg" alt="Athabasca Glacier">
  </a>
  <a href="${pageContext.request.contextPath}/resources/11.mp4">
    <img src="${pageContext.request.contextPath}/resources/images/r2.jpg" alt="Athabasca Lake">
  </a>
  <a href="${pageContext.request.contextPath}/resources/11.mp4">
    <img src="${pageContext.request.contextPath}/resources/images/r2.jpg" alt="Mountain">
  </a>
</figcaption>
</figure>
</body>
</html>