function likeup(bno,likecnt) {

	$.ajax({
		type : 'post',
		url : '/photo_like',
		contentType : 'application/json',
		data : JSON.stringify({
			"bno" : bno
		}),
		success : function(data) {
			likecnt=parseInt(likecnt)+1;
			$('#likecnt').attr('id','likecnt'+bno);
			$('#likecnt'+bno).html('x'+likecnt);

		}
	})
}
