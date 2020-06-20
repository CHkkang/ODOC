function readTextFile(file, callback) {
      var rawFile = new XMLHttpRequest();
      
      rawFile.open("GET", file, false);
      rawFile.onreadystatechange = function() {
         if (rawFile.readyState === 4) {
            if (rawFile.status === 200 || rawFile.status == 0) {
               var allText = rawFile.responseText;
               console.log("readText : " + allText);
               callback(allText);
            }

         }
      }
      rawFile.send(null);
}
function stringProcess(txt) {
      txt = txt.replace("]", "");
      txt = txt.replace("[", "");
      txt = txt.split(",");
      
      return txt;
}
function txtName(name, ext,num,localPath) {
      console.log("path : " + localPath+"/resources/txtfile/" + name+ num.toString() + ext);
      return localPath+"/resources/txtfile/" + name+ num.toString() + ext;
}
function firstMarker(AvideojsName,BvideojsName,CvideojsName,DvideojsName, AvideoName,BvideoName,CvideoName,DvideoName, local ){
	var txtArrayA = new Array();
	var txtArrayB = new Array();
	var txtArrayC = new Array();
	var txtArrayD = new Array();
	var aaCCTV;
	var bbCCTV;
	var ccCCTV;
	var ddCCTV;
	var txt = "객체인식";

     readTextFile(txtName(AvideoName, ".txt", 1, local), function(result) {
        aaCCTV = stringProcess(result);
     });
     readTextFile(txtName(BvideoName, ".txt", 1, local), function(result) {
         bbCCTV = stringProcess(result);
      });
     readTextFile(txtName(CvideoName, ".txt", 1, local), function(result) {
         ccCCTV = stringProcess(result);
      });
     readTextFile(txtName(DvideoName, ".txt", 1, local), function(result) {
         ddCCTV = stringProcess(result);
      });

     
     for (var i = 0; i < bbCCTV.length; i++) {
         txtArrayB[i] = {
            time : bbCCTV[i],
            text : txt
         };
      }
     for (var i = 0; i < ccCCTV.length; i++) {
         txtArrayC[i] = {
            time : ccCCTV[i],
            text : txt
         };
      }
     for (var i = 0; i < ddCCTV.length; i++) {
         txtArrayD[i] = {
            time : ddCCTV[i],
            text : txt
         };
      }
     console.log("error test  : "+ AvideojsName);
     console.log(txtArrayA)
     
	    AvideojsName.markers({
	       markers : txtArrayA
	    });
	    BvideojsName.markers({
	        markers : txtArrayB
	     });
	    CvideojsName.markers({
	        markers : txtArrayC
	     });
	    DvideojsName.markers({
	        markers : txtArrayD
	     });
}
function videoChange(AvideojsName,BvideojsName,CvideojsName,DvideojsName, AvideoName,BvideoName,CvideoName,DvideoName, local, num=2, aCurrentTime = 0,bCurrentTime = 0,cCurrentTime = 0,dCurrentTime = 0){
   var txtArrayA = new Array();
   var txtArrayB = new Array();
   var txtArrayC = new Array();
   var txtArrayD = new Array();
   var aaCCTV;
   var bbCCTV;
   var ccCCTV;
   var ddCCTV;
   var txt = "객체인식";
   var mData = { 'num' : num, 
		   		'aCurrentTime' : aCurrentTime, 
		   		'bCurrentTime' : bCurrentTime,
		   		'cCurrentTime' : cCurrentTime, 
		   		'dCurrentTime' : dCurrentTime};
   
   $.ajax({
      url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
      data : mData, // HTTP 요청과 함께 서버로 보낼 데이터
      type : "POST", // HTTP 요청 방식(GET, POST)
      dataType : "json" // 서버에서 보내줄 데이터의 타입
   })
   .done(function(json){ 
      console.log("changeVideo : : :" + (json.num).toString());
      console.log("videopath : " + local+"/resources/video/"+AvideoName+".mp4");
      
      AvideojsName.src({
         type : 'video/mp4',
         src : local+"/resources/video/"+AvideoName+(json.num)+".mp4"
      });
      BvideojsName.src({
          type : 'video/mp4',
          src : local+"/resources/video/"+BvideoName+(json.num)+".mp4"
       });
      CvideojsName.src({
          type : 'video/mp4',
          src : local+"/resources/video/"+CvideoName+(json.num)+".mp4"
       });
      DvideojsName.src({
          type : 'video/mp4',
          src : local+"/resources/video/"+DvideoName+(json.num)+".mp4"
       });
      
      readTextFile(txtName("aaCCTV", ".txt", (json.num), local), function(result) {
         aaCCTV = stringProcess(result);
      });
      readTextFile(txtName("bbCCTV", ".txt", (json.num), local), function(result) {
          bbCCTV = stringProcess(result);
       });
      readTextFile(txtName("ccCCTV", ".txt", (json.num), local), function(result) {
          ccCCTV = stringProcess(result);
       });
      readTextFile(txtName("ddCCTV", ".txt", (json.num), local), function(result) {
          ddCCTV = stringProcess(result);
       });

      
      for (var i = 0; i < aaCCTV.length; i++) {
         txtArrayA[i] = {
            time : aaCCTV[i],
            text : txt
         };
      }
      for (var i = 0; i < bbCCTV.length; i++) {
          txtArrayB[i] = {
             time : bbCCTV[i],
             text : txt
          };
       }
      for (var i = 0; i < ccCCTV.length; i++) {
          txtArrayC[i] = {
             time : ccCCTV[i],
             text : txt
          };
       }
      for (var i = 0; i < ddCCTV.length; i++) {
          txtArrayD[i] = {
             time : ddCCTV[i],
             text : txt
          };
       }
      console.log("error test  : "+ AvideojsName);
      console.log(txtArrayA)
      
	 AvideojsName.markers.destroy();
	 AvideojsName.markers({
	    markers : txtArrayA
	 });
	 BvideojsName.markers.destroy();
	 BvideojsName.markers({
	    markers : txtArrayB
	 });
	 CvideojsName.markers.destroy();
	 CvideojsName.markers({
	    markers : txtArrayC
	 });
	 DvideojsName.markers.destroy();
	 DvideojsName.markers({
	    markers : txtArrayD
	 });
      
      console.log("marker update : "+num)
      AvideojsName.currentTime((json.aCurrentTime));
      BvideojsName.currentTime((json.bCurrentTime));
      CvideojsName.currentTime((json.cCurrentTime));
      DvideojsName.currentTime((json.dCurrentTime));
      console.log("AcurrentTime update : " + aCurrentTime);
      console.log("BcurrentTime update : " + bCurrentTime);
      console.log("CcurrentTime update : " + cCurrentTime);
      console.log("DcurrentTime update : " + dCurrentTime);
      aCurrentTime = AvideojsName.currentTime();
      bCurrentTime = BvideojsName.currentTime();
      cCurrentTime = CvideojsName.currentTime();
      dCurrentTime = DvideojsName.currentTime();
      num = num + 1
      if(num<6){
         videoChange(AvideojsName,BvideojsName,CvideojsName,DvideojsName, AvideoName,BvideoName,CvideoName,DvideoName, local, num, aCurrentTime,bCurrentTime,cCurrentTime,dCurrentTime )
      }
      
   })
}