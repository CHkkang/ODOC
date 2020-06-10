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
		console.log("path : " + localPath+"/resources/txtfile/" + name+"_"+num.toString() + ext);
		return localPath+"/resources/txtfile/" + name+"_"+ num.toString() + ext;
}

function videoChange(AvideojsName,BvideojsName,CvideojsName,DvideojsName, AvideoName,BvideoName,CvideoName,DvideoName, local){
	var txtArrayA = new Array();
	var txtArrayB = new Array();
	var txtArrayC = new Array();
	var txtArrayD = new Array();
	var aaCCTV;
	var bbCCTV;
	var ccCCTV;
	var ddCCTV;
	var txt = "객체인식";
	console.log("videoChange function")
	$.ajax({
		url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
		data : {
			num : 2
		}, // HTTP 요청과 함께 서버로 보낼 데이터
		type : "POST", // HTTP 요청 방식(GET, POST)
		dataType : "json" // 서버에서 보내줄 데이터의 타입
	})
	.done(function(json){ 
		console.log("changeVideo : : :" + (json.num).toString());
		console.log("videopath : " + local+"/resources/video/"+AvideoName+"_"+(json.num).toString()+".mp4");
		AvideojsName.src({
			type : 'video/mp4',
			src : local+"/resources/video/"+AvideoName+"_"+(json.num).toString()+".mp4"
		});
		BvideojsName.src({
			type : 'video/mp4',
			src : local+"/resources/video/"+BvideoName+"_"+(json.num).toString()+".mp4"
		});
		CvideojsName.src({
			type : 'video/mp4',
			src : local+"/resources/video/"+CvideoName+"_"+(json.num).toString()+".mp4"
		});
		DvideojsName.src({
			type : 'video/mp4',
			src : local+"/resources/video/"+DvideoName+"_"+(json.num).toString()+".mp4"
		});

		readTextFile(txtName("aaCCTV", ".txt", (json.num), local), function(result) {
			aaCCTV = stringProcess(result);
		});
		readTextFile(txtName("bbCCTV", ".txt",(json.num),local), function(result) {
			bbCCTV = stringProcess(result);
		});
		readTextFile(txtName("ccCCTV", ".txt",(json.num),local), function(result) {
			ccCCTV = stringProcess(result);
		});
		readTextFile(txtName("ddCCTV", ".txt",(json.num),local), function(result) {
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
		//load the marker plugin
/*		AvideojsName.markers({
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
		});*/
		
		$.ajax({
			url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
			data : {
				num : 3
			}, // HTTP 요청과 함께 서버로 보낼 데이터
			type : "POST", // HTTP 요청 방식(GET, POST)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		})
		.done(function(json){
			console.log("changeVideo : : :" + (json.num).toString());
			AvideojsName.src({
				type : 'video/mp4',
				src : local+"/resources/video/"+AvideoName+"_"+(json.num).toString()+".mp4"
			});
			BvideojsName.src({
				type : 'video/mp4',
				src : local+"/resources/video/"+BvideoName+"_"+(json.num).toString()+".mp4"
			});
			CvideojsName.src({
				type : 'video/mp4',
				src : local+"/resources/video/"+CvideoName+"_"+(json.num).toString()+".mp4"
			});
			DvideojsName.src({
				type : 'video/mp4',
				src : local+"/resources/video/"+DvideoName+"_"+(json.num).toString()+".mp4"
			});

			readTextFile(txtName("aaCCTV", ".txt",(json.num),local), function(result) {
				aaCCTV = stringProcess(result);
			});
			readTextFile(txtName("bbCCTV", ".txt",(json.num),local), function(result) {
				bbCCTV = stringProcess(result);
			});
			readTextFile(txtName("ccCCTV", ".txt",(json.num),local), function(result) {
				ccCCTV = stringProcess(result);
			});
			readTextFile(txtName("ddCCTV", ".txt",(json.num),local), function(result) {
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
			//load the marker plugin
/*			AvideojsName.markers({
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
			});*/
			$.ajax({
				url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
				data : {
					num : 4
				}, // HTTP 요청과 함께 서버로 보낼 데이터
				type : "POST", // HTTP 요청 방식(GET, POST)
				dataType : "json" // 서버에서 보내줄 데이터의 타입
			})
			.done(function(json){ 
				console.log("changeVideo : : :" + (json.num).toString());
				AvideojsName.src({
					type : 'video/mp4',
					src : local+"/resources/video/"+AvideoName+"_"+(json.num).toString()+".mp4"
				});
				BvideojsName.src({
					type : 'video/mp4',
					src : local+"/resources/video/"+BvideoName+"_"+(json.num).toString()+".mp4"
				});
				CvideojsName.src({
					type : 'video/mp4',
					src : local+"/resources/video/"+CvideoName+"_"+(json.num).toString()+".mp4"
				});
				DvideojsName.src({
					type : 'video/mp4',
					src : local+"/resources/video/"+DvideoName+"_"+(json.num).toString()+".mp4"
				});

				readTextFile(txtName("aaCCTV", ".txt",(json.num),local), function(result) {
					aaCCTV = stringProcess(result);
				});
				readTextFile(txtName("bbCCTV", ".txt",(json.num),local), function(result) {
					bbCCTV = stringProcess(result);
				});
				readTextFile(txtName("ccCCTV", ".txt",(json.num),local), function(result) {
					ccCCTV = stringProcess(result);
				});
				readTextFile(txtName("ddCCTV", ".txt",(json.num),local), function(result) {
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
				//load the marker plugin
/*				AvideojsName.markers({
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
				});*/
				$.ajax({
					url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
					data : {
						num : 5
					}, // HTTP 요청과 함께 서버로 보낼 데이터
					type : "POST", // HTTP 요청 방식(GET, POST)
					dataType : "json" // 서버에서 보내줄 데이터의 타입
				})
				.done(function(json){
					console.log("changeVideo : : :" + (json.num).toString());
					AvideojsName.src({
						type : 'video/mp4',
						src : local+"/resources/video/"+AvideoName+"_"+(json.num).toString()+".mp4"
					});
					BvideojsName.src({
						type : 'video/mp4',
						src : local+"/resources/video/"+BvideoName+"_"+(json.num).toString()+".mp4"
					});
					CvideojsName.src({
						type : 'video/mp4',
						src : local+"/resources/video/"+CvideoName+"_"+(json.num).toString()+".mp4"
					});
					DvideojsName.src({
						type : 'video/mp4',
						src : local+"/resources/video/"+DvideoName+"_"+(json.num).toString()+".mp4"
					});

					readTextFile(txtName("aaCCTV", ".txt",(json.num),local), function(result) {
						aaCCTV = stringProcess(result);
					});
					readTextFile(txtName("bbCCTV", ".txt",(json.num),local), function(result) {
						bbCCTV = stringProcess(result);
					});
					readTextFile(txtName("ccCCTV", ".txt",(json.num),local), function(result) {
						ccCCTV = stringProcess(result);
					});
					readTextFile(txtName("ddCCTV", ".txt",(json.num),local), function(result) {
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

					//load the marker plugin
/*					AvideojsName.markers({
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
					});*/
				})//number : 5 done end
			})//number : 4 done end
		})//number : 3 done end
		
	}) //number : 2 done end
}