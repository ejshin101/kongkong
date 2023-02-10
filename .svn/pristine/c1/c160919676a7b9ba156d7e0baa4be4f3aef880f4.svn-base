
function fn_favority_get (cate, boNo) {
	paramData={"faCategory": cate ,"faBoNo": boNo};
	console.log('params',paramData);
		$.ajax({			
		url : "/favorite/get",	// 요청 페이지 URL정보
		dataType : 'json', // 서버로부터 전달받을 데이터 유형 (html, xml, json, script)
		data : paramData,	// 서버에 전송할 파라미터 정보
		success : function (data) {
			if(data.result){
				$('.cls-favorite-change i').removeClass('fa-star').addClass('fa-check');				
			}
		}, // 요청에 성공한 경우 호출되는 함수 (data, status, xhr )
		error : function(xhr, status, error) {
			console.log('xhr',xhr);
			console.log('status',status);
			console.log('error',error);
		}	// 요청에 실패한 경우 호출되는 함수 (xhr, status, error)
	}); // ajax
}



$(document).ready(function(){
		
	
	
	$(".cls-favorite-change").click(function() {
		$this=$(this);//jquery객체로 바꾸기
		gubun = "";
		paramData={"faCategory": $this.data('fa-category') ,"faBoNo":$this.data('fa-bo-no'),"faMemId":$this.data('fa-mem-id')};
		if($this.children().first().hasClass('fa-star')){
			sendUrl = "/favorite/regist";
			gubun = "regist";
		}else{
			sendUrl = "/favorite/remove";
			gubun = "remove";
		}
		console.log('params',paramData);
			$.ajax({			
			url : sendUrl,	// 요청 페이지 URL정보
			dataType : 'json', // 서버로부터 전달받을 데이터 유형 (html, xml, json, script)
			data : paramData,	// 서버에 전송할 파라미터 정보
			success : function (data) {
				// 등록했을때 별을
				console.log(data);
				if(data.result){
					if(gubun == "regist"){
						$this.find('i').removeClass('fa-star').addClass('fa-check');
					}else{
						$this.find('i').removeClass('fa-check').addClass('fa-star');
					}
				}
			}, // 요청에 성공한 경우 호출되는 함수 (data, status, xhr )
			error : function(xhr, status, error) {
				console.log('xhr',xhr);
				console.log('status',status);
				console.log('error',error);
			}	// 요청에 실패한 경우 호출되는 함수 (xhr, status, error)
		}); // ajax
	});//$(".cls-favorite-change").click end
	
});//$(document).ready end
