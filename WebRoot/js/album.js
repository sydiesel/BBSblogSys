function pingjia(obj) {
	/*
	 * var recName = $("#recName")[0].value;
	 * 
	 * alert(recName);
	 */

	var kind = obj.id;
	
	var logId = $("#logId").val();

	if (kind == "btnGood") {
		marks = "1";
	} else if (kind == "btnMid") {
		marks = "2";
	} else if (kind == "btnBad") {
		marks = "3";
	}
	// alert(marks);

	$.ajax({

		type : "get",
		url : "mark.do",
		data : {
			id : logId,
			marks : marks
		},
		contentType : "application/json",
		dataType : "text",// 服务器返回的数据类型 可选XML ,Json jsonp script html text等
		error : function(request) {

			alert("Connection error");
		},
		success : function(data) {
			
			if (data == "login") {
				window.location.href = "../BBS/login.html";
			}
			else if (data == "error") {

				alert(reMarks['print']);
			}else if (kind == "btnGood") {
				
				$("#btnGoodCount").text(data);
			} else if (kind == "btnMid") {
			
				$("#btnMidCount").text(data);
			} else if (kind == "btnBad") {	
				$("#btnBadCount").text(data);
			}

		}
	});
}
