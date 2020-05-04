// checkbox 제대로 하기 위한 함수
	function isChecked(inputid) {
		var c = $('#' + inputid).attr('class');
		var icon = $('#' + inputid).children('.icon');
		var id = "";
		if (c == "choice") {
			if (inputid.includes("OnePiece")) {
				if (inputid.includes("Top")) {
					$("#" + inputid + "C").prop("checked", true);

					id = inputid.includes("short") ? "longTopOnePiece"
							: "shortTopOnePiece";
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

					if (inputid.includes("short")) {
						id = "longBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "skirtBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}
					if (inputid.includes("long")) {
						id = "shortBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "skirtBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}
					if (inputid.includes("skirt")) {
						id = "longBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "shortBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}

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

					//id = inputid.includes("short") ? "longBottom"
					//      : "shortBottom";
					if (inputid.includes("short")) {
						id = "longBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "skirtBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}
					if (inputid.includes("long")) {
						id = "shortBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "skirtBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}
					if (inputid.includes("skirt")) {
						id = "longBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
						id = "shortBottom";
						$("#" + id).attr("class", "choice");
						$("#" + id + "C").prop("checked", false);
					}

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

	var page = 0;
	//페이지 이동 함수
	function pageCtrl(vvalue) {
		if (vvalue == "Finish")
			page = 1;
		if (vvalue == "Previous")
			page--;
		if (vvalue == "Next")
			page++;
	}
	function pageMove(vvalue) {
		console.log(page + "페이지");
		pageCtrl(vvalue);
		if (page == 1) {
			console.log("1페이지");
			var v = $('input:radio[name=kind]').is(":checked"); // check == true
			if (v) {
				value = $('input:radio[name=kind]:checked').val();
				console.log(value);
				$("#detailLink").attr("href", "#" + value);
			}
		}
		if (page == 2) {
		}
	}
	// 색깔 정한것에 따라서 top icon 색 변경
	function topChangeColor() {
		var lticon = $('#longtopIcon');
		var sticon = $('#shorttopIcon');
		var olicon = $('#longdressIcon');
		var osicon = $('#shortdressIcon');
		var lc = $('#longTopC').is(":checked");
		var sc = $('#shortTopC').is(":checked");
		if (lc) {
			console.log("longtop checked");
			lticon.css('border-color', $('#topColor').val());
			sticon.css('border-color', '#cccccc');
			olicon.css('border-color', '#cccccc');
			osicon.css('border-color', '#cccccc');
		}
		if (sc) {
			console.log("shorttop checked");
			sticon.css('border-color', $('#topColor').val());
			lticon.css('border-color', '#cccccc');
			olicon.css('border-color', '#cccccc');
			osicon.css('border-color', '#cccccc');
		}
	}
	// 색깔 정한것에 따라서 bottom icon 색 변경
	function bottomChangeColor() {
		var lbicon = $('#longbottomIcon');
		var sbicon = $('#shortbottomIcon');
		var kbicon = $('#skirtbottomIcon');
		var olicon = $('#longdressIcon');
		var osicon = $('#shortdressIcon');
		var lc = $('#longBottomC').is(":checked");
		var sc = $('#shortBottomC').is(":checked");
		var kc = $('#skirtBottomC').is(":checked");
		if (lc) {
			console.log("longbottom checked");
			lbicon.css('border-color', $('#bottomColor').val());
			kbicon.css('border-color', '#cccccc');
			sbicon.css('border-color', '#cccccc');
			olicon.css('border-color', '#cccccc');
			osicon.css('border-color', '#cccccc');
		}
		if (sc) {
			console.log("shortbottom checked");
			sbicon.css('border-color', $('#bottomColor').val());
			lbicon.css('border-color', '#cccccc');
			kbicon.css('border-color', '#cccccc');
			olicon.css('border-color', '#cccccc');
			osicon.css('border-color', '#cccccc');
		}
		if (kc) {
			console.log("skirtbottom checked");
			kbicon.css('border-color', $('#bottomColor').val());
			lbicon.css('border-color', '#cccccc');
			sbicon.css('border-color', '#cccccc');
			olicon.css('border-color', '#cccccc');
			osicon.css('border-color', '#cccccc');
		}
	}
	// 색깔 정한것에 따라서 onepiece icon 색 변경
	function onepieceChangeColor() {
		var lticon = $('#longtopIcon');
		var sticon = $('#shorttopIcon');
		var lbicon = $('#longbottomIcon');
		var sbicon = $('#shortbottomIcon');
		var kbicon = $('#skirtbottomIcon');
		var olicon = $('#longdressIcon');
		var osicon = $('#shortdressIcon');

		var lc = $('#longTopOnePieceC').is(":checked");
		var sc = $('#shortTopOnePieceC').is(":checked");
		if (lc) {
			console.log("longtop checked");
			olicon.css('border-color', $('#onepieceColor').val());
			osicon.css('border-color', '#cccccc');
			lticon.css('border-color', '#cccccc');
			sticon.css('border-color', '#cccccc');
			lbicon.css('border-color', '#cccccc');
			sbicon.css('border-color', '#cccccc');
			kbicon.css('border-color', '#cccccc');
		}
		if (sc) {
			console.log("shorttop checked");
			osicon.css('border-color', $('#onepieceColor').val());
			olicon.css('border-color', '#cccccc');
			lticon.css('border-color', '#cccccc');
			sticon.css('border-color', '#cccccc');
			lbicon.css('border-color', '#cccccc');
			sbicon.css('border-color', '#cccccc');
			kbicon.css('border-color', '#cccccc');
		}
	}
	function zoomin() {

	}
	function deletemarker() {

	}