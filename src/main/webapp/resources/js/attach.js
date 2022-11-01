$(document).ready(function() {
	//detail.jsp 시작되자마자(ready이벤트) bno값 가져오기
	var bno=$("input[name='bno']").val();
	$.getJSON("/attachlist",{bno:bno},function(attachlist){
		console.log(attachlist);
		var str="";
		
		$(attachlist).each(function(i,attach){
			//만약 image 결과가 true면 
			if(attach.image){	// 아래 실행
			
				var filePath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
			
				console.log(filePath)
			
				str+="<li><img src='/display?fileName="+filePath+"'></li>"
				
			}else{	// image 결과가 false면
				// 다운로드 할 수 있도록 실행
				var filePath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
				
				str+="<li><a href='/download?fileName="+filePath+"'>"+attach.fileName+"</a></li>"
			}
		})
		$("#photo ul").html(str);
	})
	
})