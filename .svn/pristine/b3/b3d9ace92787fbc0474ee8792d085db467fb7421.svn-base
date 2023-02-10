<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(
			function() {
				var scrollSpy = new bootstrap.ScrollSpy(document.body, {
					target : '#sideBar'
				})
				scrollSpy.addEventListener('activate.bs.scrollspy', function(
						dataSpyEl) {
					bootstrap.ScrollSpy.getInstance(dataSpyEl).refresh();
				});
			});

	$(window).scroll(function() {
		var scrollTop = $(document).scrollTop() + 100;
		if (scrollTop < 100) {
			scrollTop = 100;
		}
		$("#sideBar").stop();
		$("#sideBar").animate({
			"top" : scrollTop
		});
	});
	$(window).scroll(function() {
		var scrollTop = $(document).scrollTop() + 500;
		if (scrollTop < 100) {
			scrollTop = 100;
		}
		$("#ad").stop();
		$("#ad").animate({
			"top" : scrollTop
		});
	});
</script>
 <div id="sideBar">
        <nav id="sideNav" class="navbar flex-column align-items-stretch p-3 ">
            <nav class="nav nav-pills flex-column">
                <a class="nav-link ms-3 my-1" href="#">Reservation</a>
                <a class="nav-link ms-3 my-1" href="<%=request.getContextPath()%>/reservation/wifi">Wi-fi</a>
                <a class="nav-link ms-3 my-1" href="<%=request.getContextPath()%>/reservation/usim">USIM</a>
                <a class="nav-link ms-3 my-1" href="<%=request.getContextPath()%>/reservation/hotel">Hotel</a>
            </nav>
            <a class="nav-link ms-4" href="#"><i class="far fa-caret-square-up"></i></a>
            <a class="nav-link ms-4" href="#bottom"><i class="far fa-caret-square-down"></i></a>
        </nav>
    <!--followQuick end-->
    <div id="ad">
        광고 문의
    </div>
</div>
    <!--ad end-->

