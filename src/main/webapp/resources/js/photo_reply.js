$(document).ready(function() {
	// var total = $("#total").val();
	// var arr=[];
	// var i=0;
	// while(total){
	// arr[i]+=$(".bno").val();
	// alert(arr);
	// }
	//	
	// var bnoValue = $(".bno").val();
	// alert($(".bno").val());
	// list(31);
	// list(32);

	$("#coment").on("click", ".update", function() {
		// 댓글번호와 댓글내용을 수집해서
		var rno = $(this).data("rno");
		var reply = $('#replycontent' + rno).val();
		// 댓글 수정 함수 호출(댓글번호,댓글내용)
		modify({
			rno : rno,
			reply : reply
		})
	})

	// 댓글 삭제 버튼을 클릭하면
	$(".remove").on("click",function() {
		// 댓글 번호를 수집해서
		var rno = $(this).data("rno");
		// 댓글 삭제 함수 호출(댓글번호)
		remove(rno);
	})

})

function remove(rno) {
	console.log(rno);
	$.ajax({
		type : "delete", // method방식(get,post,put,delete)
		url : "/photoreplies/remove/" + rno,
		success : function(result) {
			if (result == "success") {
				alert("댓글삭제성공");
			}
		}
	})
}

function modify(reply) {
	$.ajax({
		type : "put",
		url : "/photoreplies/modify",
		data : JSON.stringify(reply),
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			if (result == "success") {
				alert("댓글수정성공");
			}
		}
	})
}

function list(bno) {
	$.getJSON("/photoreplies/" + bno + ".json", function(data) {
		var str = "";
		for (var i = 0; i < data.length; i++) {

			str += "<li id='replycontent" + data[i].rno + "'>" + data[i].id
					+ " : " + data[i].reply
			str += "<input type='hidden' value='" + data[i].rno + "'>"
			str += "<c:if test=${sessionScope.login.id==data[i].id}>"
			str += "<input class='remove' type='button' value='삭제' data-rno="
					+ data[i].rno + " data-reply=" + data[i].reply + ">"
			str += "</c:if> " + "</li>"
		}
		$("#replyUL" + bno).html(str);
	})
}

function reply_write(bno) {
	var replyValue = $("#reply" + bno).val();
	var idValue = $("#idValue").val();
	if (idValue = null) {
		alert("로그인 후 시도해주세요.");
		return false;
	}

	$.ajax({
		type : "post",
		url : "/photoreplies/new",
		data : JSON.stringify({
			bno : bno,
			reply : replyValue,
			id : idValue
		}),
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			if (result == "success") {
				alert("댓글쓰기성공");
			}
		}
	})
}