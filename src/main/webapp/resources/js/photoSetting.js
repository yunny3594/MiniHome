$(document).ready(function() {
	$("input[type=submit]").on("click", function() {
		if(confirm("수정/삭제/추가")==true){
			return true;
		}else{
			return false;
		}
	})

})