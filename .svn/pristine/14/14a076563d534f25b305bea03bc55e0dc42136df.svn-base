<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container" >
<div class="row">
<div align="center" style="margin-top: 50px; margin-bottom: 160px">
<div align="center">
<div class="col" align="center">
            <label for="id_searchCategory" class=" control-label">년도</label>
            <div class="">
                <select id="id_selectYear" name="selectYear" class="form-control input-sm">
                    <option value="2019">2019년</option>
                    <option value="2020">2020년</option>
                    <option value="2021" selected="selected">2021년</option>
                </select>
            </div>
              <label for="id_searchCategory" class=" control-label">월</label>
            <div class="">
                <select id="id_selectMonth" name="selectMonth" class="form-control input-sm">
                    <option value="">-- 전체 --</option>
                   <option value="1">1월</option>
                   <option value="2">2월</option>
                   <option value="3">3월</option>
                   <option value="4">4월</option>
                   <option value="5">5월</option>
                   <option value="6">6월</option>
                   <option value="7">7월</option>
                   <option value="8">8월</option>
                   <option value="9">9월</option>
                   <option value="10">10월</option>
                   <option value="11">11월</option>
                   <option value="12">12월</option>
                </select>
            </div>
</div><br>
</div>
<!-- <div class="row"> -->
<div class="list-group" align="center">
	<a href="#" type="button" class="list-group-item list-group-item-action btn_chart_gubun" data-chart-gubun="S" >가입 현황</a>
	<a href="#" type="button" class="list-group-item list-group-item-action btn_chart_gubun" data-chart-gubun="R" >예약 현황</a>
	<a href="#" type="button" class="list-group-item list-group-item-action btn_chart_gubun" data-chart-gubun="Y-S" >최근 10년간 가입현황</a>
	<a href="#" type="button" class="list-group-item list-group-item-action btn_chart_gubun" data-chart-gubun="Y-R" >최근 10년간 예약현황</a>
	<p>총 회원수 : ${member.memCount}</p>
</div>
</div>

<figure class="highcharts-figure col-11">
    <div id="container"></div>
    <p class="highcharts-description">
        admin
    </p>
</figure>

</div>

<!-- </div> -->
</div>

</body><!-- end.container -->
<%@ include file="/WEB-INF/inc/footer.jsp"%>

<script type="text/javascript">
// --- 1 전역변수 선언 -----

 
 
// --- 2 일반함수 선언 -----

function fn_chart_redraw(c_title, c_s_title, c_caterory, c_y_title, c_series ){
	Highcharts.chart('container', {
	    chart: {
	        type: 'line'
	    },
	    title: {
	        text: c_title
	    },
	    subtitle: {
	        text: c_s_title 
	    },
	    xAxis: {
	        categories: c_caterory
	    },
	    yAxis: {
	        title: {
	            text: c_y_title
	        }
	    },
	    plotOptions: {
	        line: {
	            dataLabels: {
	                enabled: true
	            },
	            enableMouseTracking: false
	        }
	    },
	    series:c_series
	});  // chart
	
	
} // fn_chart_redraw 

function fn_chart_call(gubun){
	// 화면의 년도, 월 선택값 처리 
	//alert(gubun);
	
	// 현재선택된 년도alert
	// 현재 선택된 월 alert
	paramData = {"selectYear": $('#id_selectYear').val() , "selectMonth": $('#id_selectMonth').val() , "chartGubun": $this.data('chart-gubun')};  //  "selectYear" , "selectMonth" , "chartGubun"
	
	console.log('paramData' , paramData);
	
	//
	 // $.getJSON : AJAX 처리결과를 json으로 반환 받는 함수
	  var chartURL="<c:url value = '/admin/changeGraph.wow'/>";
    $.getJSON(chartURL, paramData, function(data){
    	if(data.result){
    		console.log(data);
    		if(data.size=="31" && paramData.chartGubun=="R"){
    			c_title="Day Reservation";
    			c_s_title=paramData.selectYear;
	    		cate=[];
	    		ser = [];
	    		ser1 = {"name":"일별 예약자", "data" : []};
	    		ser1_data = [];
    		} else if(data.size=="12" && paramData.chartGubun=="R"){
    			c_title="Month Reservation";
    			c_s_title=paramData.selectYear;
	    		cate=[];
	        	ser = [];
	        	ser1 = {"name":"월별 예약자", "data" : []};
	        	ser1_data = [];	
    		} else if(data.size=="31" && paramData.chartGubun=="S"){
    			c_title="Day Signup Member";
    			c_s_title=paramData.selectYear;
        		cate=[];
            	ser = [];
            	ser1 = {"name":"일별 가입자", "data" : []};
            	ser1_data = [];	
        	}else if(data.size=="12" && paramData.chartGubun=="S"){
        		c_title="Month Signup Member";
        		c_s_title=paramData.selectYear;
        		cate=[];
            	ser = [];
            	ser1 = {"name":"월별 가입자", "data" : []};
            	ser1_data = [];	
        	}else if(data.size=="10" && paramData.chartGubun=="Y-S"){
        		c_title="10년간 가입자";
        		c_s_title="";
        		cate=[];
            	ser = [];
            	ser1 = {"name":"년간 가입자", "data" : []};
            	ser1_data = [];	
        	}else if(data.size=="10" && paramData.chartGubun=="Y-R"){
        		c_title="10년간 예약자";
        		c_s_title="";
        		cate=[];
            	ser = [];
            	ser1 = {"name":"년간 예약자", "data" : []};
            	ser1_data = [];	
        		}
    		
    		// 차트에 맞게 데이터 변경 
    		$.each(data.data, function(i, el) {
				cate.push(el.C_SEQ );
				ser1_data.push( el.C_COUNT);
			}) // each 
			ser1.data = ser1_data;
    		ser.push(ser1);
			console.log('cate', cate);
    		console.log('ser', ser);
    		console.log('--------------------------------');
			// cate = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			// ser=[-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6];
    		// 차트함수 호출 
    		fn_chart_redraw(c_title, c_s_title ,cate, '명', ser );    		
    		
    	}// if(data.result)
    });  // $.getJSON
	
} // fn_chart_call



//--- 3 이벤트 함수 선언 -----

$('.btn_chart_gubun').click(function(e) {
	e.preventDefault();
	$this = $(this); // 자바스크립트 this랑 jquery this랑 같다 라고 해주는것 
	//alert($this.data('chart-gubun'));
	fn_chart_call($this.data('chart-gubun'));
	
});


//--- 4 초기화 함수 호출  -----

fn_chart_call('R');

</script>

</html>