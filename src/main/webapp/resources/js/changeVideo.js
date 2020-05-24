function videoChange(videojsName, videoName, local){
	var num = 2;
	$.ajax({
		url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
		data : {
			num : num,
			videoName : videoName,
		}, // HTTP 요청과 함께 서버로 보낼 데이터
		type : "POST", // HTTP 요청 방식(GET, POST)
		dataType : "json" // 서버에서 보내줄 데이터의 타입
	})
	// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
	.done(function(json) {
		console.log("2 : " + json.num);
		videojsName.src({
			type : 'video/mp4',
			src : local+"/resources/video/"+videoName+"_"+(json.num).toString()+".mp4"
		});
		$.ajax({
			url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
			data : {
				num : (json.num),
			}, // HTTP 요청과 함께 서버로 보낼 데이터
			type : "POST", // HTTP 요청 방식(GET, POST)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		})
		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(json) {
			console.log("3 : " + json.num);
			videojsName.src({
				type : 'video/mp4',
				src : local+"/resources/video/"+videoName+"_"+(json.num).toString()+".mp4"
			});
	
			console.log("ajax done");
			
			$.ajax({
				url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
				data : {
					num : (json.num),
				}, // HTTP 요청과 함께 서버로 보낼 데이터
				type : "POST", // HTTP 요청 방식(GET, POST)
				dataType : "json" // 서버에서 보내줄 데이터의 타입
			})
			// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
			.done(function(json) {
				console.log("4 : " + json.num);
				videojsName.src({
					type : 'video/mp4',
					src : local+"/resources/video/"+videoName+"_"+(json.num).toString()+".mp4"
				});
	
				console.log("ajax done");
				
				$.ajax({
					url : "changeCCTV", // 클라이언트가 요청을 보낼 서버의 URL 주소
					data : {
						num : (json.num),
					}, // HTTP 요청과 함께 서버로 보낼 데이터
					type : "POST", // HTTP 요청 방식(GET, POST)
					dataType : "json" // 서버에서 보내줄 데이터의 타입
				})
				// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
				.done(function(json) {
					console.log("5  : " + json.num);
					videojsName.src({
						type : 'video/mp4',
						src : local+"/resources/video/"+videoName+"_"+(json.num).toString()+".mp4"
					});
	
					console.log("ajax done");
					
				})
				
			})
			
			
		})
		// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function() {
			console.log("ajax fail");
		})
		console.log("ajax done");
	})
	// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
	.fail(function() {
		console.log("ajax fail");
	})
}