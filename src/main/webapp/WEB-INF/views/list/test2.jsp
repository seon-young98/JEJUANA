<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet">
<!-- JavaScript -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.js"></script>

<style>
	html, body {width:100%;height:100%;padding:0;margin:0} 
	
	#screen{width:100%; height:86%}
	
	.section1{width:20%;height:107%;float:left;}
	
	.section1_1{background: #258fff;border-radius:5px; margin-top:-9px; height:6%;}
	
	.section1_1 button{float:left;width:20%;height:50px;float:left;float:left;text-decoration-line: none;margin-top:9px}
	
	.section1_2{width:100%;height:2%;background:green;text-align:center;}

	
	.section1_3{width:100%;height:6%;font-size:12px;overflow: auto;}
	
	.section2{width:80%;height:86%;background:gray; float:right;}
	
	#weather {width:100%;height:100%; text-align:center;background-color: #1890ff; color:white;
			display:inline-block;letter-spacing: 12px;box-shadow: 5px 5px 5px;}
	
	#weather li {list-style-type: none;margin-right:1px; }
	
	#weather span {float:right;}
	#bkidx {position:absolute;z-index:4;margin-top:500px;}
	#testid {position:absolute;z-index:4;margin-top:500px;}
	
	#resultData:nth-child(odd) { background-color: #e6f1ff;}
	#resultData:nth-child(even)) { background-color: #f0f7ff;}
 </style>

 <!-- 지도전환 -->
<style>
.radius_border{border:1px solid #919191;border-radius:5px;}   
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:2;font-size:10px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol button {display: inline-block;width:60px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;padding:5px; }
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:2;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:10px;height:10px;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}     
</style>

 <!-- 지도검색,마커표시 -->
 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:absolute;width:20%;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap {position:absolute;top:19%;left:0;bottom:7%;width:20%;margin:88px 0px 0px 2px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
 .section1, .section1 * {margin:0px;padding:0px;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:15px;}
#placesList li {list-style: none;width:100%}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 80px;}
#placesList .item span {display: block;margin-top:4px;font-weight:bold;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:12px 0 20px 12px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}

#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

 <!-- 커스텀 오버레이 -->
<style>

.wrap {position: absolute;left: 0;bottom: 40px;width: 276px;height: 300px;margin-left: -144px;text-align:right;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5; border: 1px solid #258fff;}
    .wrap * {padding: 0;margin: 0;}
    .wrap_button button{width:88px; height:50px;font-weight: bold; background:white;border:1px solid gray;border-radius: 2px;color:white; text-shadow : -1px 0 gray, 0 1px gray, 1px 0 gray, 0 -1px gray}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;white-space: normal;font-weight: bold;}
    
    .wrap .info {height: 28px;margin-bottom:5px;border-radius: 20px;margin-left:2px;overflow: hidden;background: #fff;padding:12px 12px;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {margin-right:30px;height: 35px;background: white;font-size: 18px;font-weight: bold;margin-top:-8px;overflow:hidden;}
    .item {display:inline-flex;}

</style>
<style>
.modal_wrap{
        display: none;
        width: 15%;
        height: 40%;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -273px 0 0 -713px;
        background:#eee;
        z-index: 3;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100px;
        height: 100%;

        top:0;
        left: 0;
        z-index: 3;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -26px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
</style>

		<!-- 맨위 -->
		<div id="screen">
			<div class="section1">
				<div style="background: #258fff; height:9%">
			        <div id="weather" style="font-size:40px; ">	
			        	<span style="font-size:25px; font-weight: bold" class="nowtime"></span>
						<span style="font-size:25px; font-weight: bold">제주도</span>
				        <h3 class="JejuIcon" style="float:left;width:10%"></h3>
				        <ul>
					        <li class="JejuNowtemp" style="float:right;font-size:20px;">현재기온 :  </li>
				        </ul>
					</div>
				</div>
				
				<div class="section1_3" style="background: #258fff; display: inline-block;" >
					<form onsubmit="searchPlaces(); return false;" style="height:100%;" >
						
							<div class="section1_3_1" style="width:80%;height:90%; display: inline-block;">
								<input type="text" class="form-control search-menu" id="keyword" placeholder="검색..."  style="height:100%;font-size:15px;width:86%;margin-left:28px ">
							</div>
							<div style="width:15%;float:right;height:100%;  display: inline-block;">
								<button type="submit" name="name1" style="height:90%;width:92%;align-items: center;border-radius:5px; border:none; margin-left:-20px; background: white" ><img src="/jejuana/img/button_search.png" style="object-fit: fill; height:55%;  "alt="검색"></button>
							</div> 
						
							 
						
					</form>
				</div>
				
				<!-- 메뉴 -->
				<div class="section1_1" style="margin-top:-9px;">

					
					
					
					
				</div>
			
		<!-- 북마크 표현을 위한 모달창 출력 ------------------------------ -->		
		<div class="black_bg" ></div>
			<div class="modal_wrap">
			    <div class="modal_close" ><a href="#">close</a></div>
			    <div>
			       <table style=" width:100%;height:470px;border:1px solid black;">
				       <thead>
							<tr style="border:1px solid black;">
								<th>장소명</th>
								<th>등록일시</th>
							
							</tr>
					   </thead>
					   <tbody id="resultData">
					   
					  
					   </tbody>							
					</table>
			    </div>
			 </div>

		<!-- 북마크 표현을 위한 모달창 출력 ------------------------------ -->	


				<!-- 검색  -->

				
				<!-- 검색하면 표시될 -->		     
		        
		        <hr>
		        <div class="map_wrap" id="menu_wrap">
		        	<ul id="placesList" ></ul>
		        	<div id="pagination"></div>
	        	</div>
	        </div>

			<div class="section2" id="map" style="position:relative;overflow:hidden;height:100%">
				
				<!-- 지도타입 컨트롤 div 입니다 -->
				<div class="custom_typecontrol radius_border">
		        	<button type="submit" id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')" style="width:50%; font-size:12px; margin-top:-5px; height:33px;">로드뷰</button>
		       		<button type="submit" id="btnSkyview" class="btn" onclick="setMapType('skyview')" style="width:50%; font-size:12px; margin-top:-5px; height:33px; " >스카이맵</button>
		    	</div>
			    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
			        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
			    </div>
			</div>
			
			
			<c:if test="${logStatus!='Y' }">
						<button type="button"  class="btn btn-link" style="color: #f9f9f9;border:5px solid gray;position:absolute;margin-top:-830px;z-index:4;text-decoration-line: none;" onclick="test1()" >북마크</button>
						<a href="loginForm"><button type="button"  class="btn btn-link" style="color:black;background:white; text-decoration:none; border:5px solid gray" >LoginTest</button></a>
					</c:if>
					<c:if test="${logStatus=='Y' }">
						<button type="button"  id="modal_btn" class="btn btn-link" style="color: #f9f9f9;border:5px solid gray;position:absolute;margin-top:-830px;z-index:4;text-decoration-line: none;" >북마크</button>
						<a href="logout"><button type="button"  class="btn btn-link" style="color: #f9f9f9; border:5px solid gray" >${logName }님 로그아웃</button></a>
			</c:if>
			
			
	</div>
			<div style="width:100%; height:74px; background:antiquewhite; text-align:center;"><h1>footer</h1></div>
			<!-- 카카오 지도 -->
	
			

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75c9e1cc14c0f4aab448e8ccbe6b84b2&libraries=services,clusterer,drawing"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- 관광지 공유 api -->

<!-- 북마크 모달창 출력 -->
<script>

$('#modal_btn').one('click',function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/blist',
		type:'GET',
		success:function(result){
			
			var tag = "";
			$(result).each(function(i, data){
					tag += "<tr '>";
					tag += "<td>" +data.book_name+"</td>";
					tag += "<td>" +data.book_date+"</td>";
					tag += "<td onclick='deltest("+data.book_no+")'><button style='background:white;'>삭제</button></td>"
					tag += "</tr>";
					
			});
			

			
			$("#resultData").append(tag);
			

		},error:function(error){
			console.log(error.responseText);
		}
	});
});


function deltest(b_no){
	if(confirm("북마크를 삭제하시겠습니까?")){
		location.href = "/jejuana/list/bookDelete?no="+b_no;
		
	}
}
</script>


<!-- 검색기능 -->
<script>
// 마커를 담을 배열입니다
var markers = [];
var overlays = [];
var imgs = ['https://a.cdn-hotels.com/gdcs/production85/d946/73f139d8-4c1d-4ef6-97b0-9b2ccf29878a.jpg?impolicy=fcrop&w=1600&h=1066&q=medium'];
imgs.push('data:image/jpeg;base64,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') ;
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_9sE0agwrXaCLtjQw6CporpP1kU3qHKz-Q&usqp=CAU');
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNnkBDHDv68zL0GyNm7jctzlIAyTB8b4grig&usqp=CAU');
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGofmtfiXZ01OXpzL8kshBqzj5KwB6aJZDyw&usqp=CAU');
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvIj511J8qELgn2ZZhhFFIDUJZAWK8iv1nzCtVNWNPF1nMIK72toge4ZxmUv070f0JVoI&usqp=CAU');
imgs.push('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQWFRUWFhQWGBgaHBwcHRoaGBwdHhweHhoaHB4cHBwcJi4lHB4rHxocJjgmKy8xNjU1HCU7QDs0Py40NTEBDAwMEA8QHhISHjQlJCsxNDQ0NDExNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIAIsBaQMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAgMEBQYBBwj/xABCEAABAwIEAwYDBQUHAwUAAAABAAIRAyEEEjFBBVFhBiJxgZGhMsHwBxOx0eEUQlJy8RUWI1OSotIkQ2IXNIKTsv/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAIhEBAQEAAgICAwADAAAAAAAAAAERAiESMQNRE0FhIjJx/9oADAMBAAIRAxEAPwDbt7Z4YVXMc4ZLFtRpzNcIl2YQC0g2iDKvcHjqVYONN7X5TBymY/QxY6FeEfsx0zNtyB2JIkaKdhMXXomaT6jHQGy3cSTlGo2C5z5ftjZXuJakwsHw77QS2nlr0nOqjezA6Z1iQDoLBaHhXamhVABzNeTAbDnF2sEZR008F1nySpi7hEKDh+MUXyQ7uhwbmIgZiAYO7Te4IEbqWzEMMQ5pmCBImCJFvC635QwuEQlwuQrphMIhKhEJoTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaYTCISoRCaY+fMUXMJLTIG1t9p+tlzD8TgRcaAweXQqHiadVpzZi5tzIjzka7KK3FgyV4OPHZ32sX7OJB0BxsIBzDXl3gpFMMsYIBOrXaetzZZ01MwAm34cpKKdfK4DMfE/V08PpcahtM9/7quQ43IdM35EagnXTRKotqtvmY4k84kzOh3WfOJOuf3Nj48vVP08S4biY3vty5q/5xMr0PgXbh7Bkr0XuDYGYCCPGdfZbXCcYw9SMtVsnaYI3uCvGGceJaGvA5af/AK/NLwmLYC4Pb3SPiEzsYN7xHJany8p7g9yhELzXhHattA5cxc0gfEXFsbZeR0C1eF7VUHQHd2byLiDz3XTj80vvoX8IhJo1WuAc1wcDuDPVOQuurhMIhKhEKmEwiEqEQhhMIhKhEIYTCISoRCGEwiEqEQhhMIhKhEIYTCISoRCGEwiEqEQhhMIhKhEIYTCISoRCGEwiEqEQhhMIhKhEIYTCISoRCGEwiEqEQhhMIhKhEIYTCISoRCGEwiEqEQhj52oAfC52Ug6nrpfpKpOI0wx5IAg6OBkGSZ8FpDVZJDxF4E/DyF50vKgYjBMLMhIkGRFxcaDzXg4csu4SfSip1XDQmPNSagJgkzsJTTqTmGDsnmdIPntzXo39qYYxp17p9R+icewzLQSOf11lSyy0kDS3OPr8UkUxJykwp5JqP+0v07x949VLpYt1rn0/GE0IBII9dZ6JTjFtPDRXZVSs5dcHn58/kp2Gxb7AnKBtrY+ipg/p9clJZXgafgs2JW34D2gq0HAtOZtswGjhqbc432nyXqvD8cysxr2Olp9QeRGxXgGCxZBmSR5eI1XoPZfi/wB09t4Y4w8bCdHAbEH2lc+PyeHLL6pHpCF3XRdhevVwlCVCIQJQlQiEUlCVCIQJQlQiECUJUIhAlCVCIQJQlQiECUJUIhAlCVCIQJQlQiECUJUIhAlCVCIQJQlQiECUJUIhAlCVCIQJQlQiEHzHSxrnNLXNDj1v6KM+o4GTawiBsOfNPPYA4lzhfcEROgPJdqDO3bMBIiL8p6rz5l6ipzGNexpkSJBtAnxUCszI7YEXH0bGykYGo/IIEuGoGpH8uykVmNe2S05h581zl8eXfpmztWuLZJ05axPK31ouFzhz2OnJJbYxb8tbFdLnbx0K6YHS4ECZJFuu++3LyndNOYdvRI+81/CE+wjPTBbq4efegzOoWp0I7nkWJhO4d+Y905ujRJ9BdXvGOMvbXrsoUsPRAqPbLKFMuOV5bJc8EyYm0Roq53EsQTJxFSTye5u3IEBNGh4d2XxtRgcMK5rXAEOcWNkRIPecDcFSAKlNzqZs9vxMBDpsDAcCRoZBHMLLYXFVmOzsqPa6C3NqS0mT8Ug3Gqm0agzF73EucZJkl0m0lcfk4yxPT1zsRxk1Gmk8nM0S2f4QAC3qQfx6LXLx3gPF8lVjwLtPP4mnUeJBML1vCYltRrXtMtcJH1sVv4OezxvuNH0LqF6BxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxC6hBxCCV1BxC6hBxC6hBxC6uSg+WqLQWGNRGUc769CuZ84P8AEBNuhAPmo9B9whpEwfUX9ljO1SsMx4LXCZF7EyLfhqrdlRsZptqdfSLc/ZUrXwQPP1trtujQkkmDIHKbTeOq58+Os30mY5rcwc27TvBH1+ihuYZMxINonXkVKZmLXNiY09h5phr7TPtZTj6xIRkadjO4nnqnsNT7zBmnK9mv8/5n2SS3cBPYeMzO7JDm6RzVtyLOkrjGD/6rE3F69U66/wCI61tNxzUHEPAIGYy69xBm+vW3Uclb9oWf9ViS3atUEEga1DNjEhROcgTpNiek5tRyjmfKeWe0lQKWIIvnM9Li/wCqewzyXEDKTuLA+WyfxGEdqC0TzA13gnTwUTI8G0T5fMqy8b6WYs8M9wgnbUhw1mw5aStx2O7UfdvyPJyE31MToR4GRZefy7ul0y06NaCfMA3H5J2l8AyiBcCRlJFpgHfXZZvHvZ7az6fQdPi9BxgVWyL3kfinjjqX+Y3SfiGi8aZiXNNpdAbcDY3AEXJ/IpI485pPcdY+F/DZXz+T9SM69N4jxp7XHIWvbEjLqLHXNbWNDtpdKpdo+6M1Ml3dENMyTF7TA19F5kzjpJnKb6iWgDqLi6Wzj5BMMdP/AMZ36p5fL9RO3peH7Qhzakth7LhpBEtkAX/iM6c1I/vBRBdmeABEbkyLiBuDsvLv7xuF8pMcwJ9QUl/aFx/ccQdpBPjIKvl8n0bXq7eP4czFQGNSAYHsujjuHP7/APtd+S8obxd5u1r/AFaPaLJY4g90jKRvLoPr+ivlz/htetYfidF5AY8EnSxH4jopq8dw+Oc15M2+ut1dVOMvLWvLi4sEBwBzAb6X5T4J+Sz2a9IQvLqPaktktc8aTrfffxKn0u3Lx8QDh1YQfay3OW/pdehIWEw3b4Sc9K22Wx99VKqdq2VGnK7IP5gHwPqbK24a2K5mC89q8Xov1qPJ3Mk/JDOI0Tq5w0uCfmp5/wAqeT0NCxVPEiBlqvvycZPhz0U0cUqtENcHfzET76qflieTTqurcYotkSTHIfNVVXHVHtAcbbgQDMCx9z5qC6mz4Tm949Qr58VvL6X547TkWd7fmh/HKYaTBB2BEA8rrOV6bYsSBtuOXjqo76VQCxkcjHpfUJOcrPlV8eOP1ytjlr7qJV4vUJ+I/h6R9WVQwOIJEDpz8AUqm5rrGQbQRoTvc6K+UZ8qmVeIuNi467klNux79yTfmor6jYEPBJkQdPrzTBb4A+Nj8lZylRcYfjDm6OPnf8eikf27UdHeAjkNfGVmHvvex9k0Kx1/otZq+V+2wbjHnV59Z62SX1HRZ8nqSP0WcocQI3+vBSW4nMNW5t+XpqsXyiatzWqC2Z3XvH69U/8AeO5e4VA3iEQJFuYt5HZWX7d4ev6q9rteHmrhyD3HCPqSQdFCDmX70evqrE1wGlha07GI1k6GPogLtNjAyR8UEOEyYPIRZunWxXG8sdvKfsyx7AwTJdGsm3eBsPAH1U5mEA1sMoLmzuLTGxIJNuvNRX1GjMA0gGxA3A5Wtp7Ia62kwIiNPIDkTvv0Uu1JJynvtLNLI5hzTM28IE21Ez7rr6LS2GMNhJfMnxPS8f1TdIMIDnAlgtc5SYt3RPM6SdE9QxLM1gQ0G/ONx3bf02XOa38nx5JZ0hfs5AuTcnntqE/TAABHMEz0I19h5p+oM7Q5zgA3QZrkQBvInXkmalEiRMdCdNLO9vRXy32nycLxs/uLXtDRacViZ/zX+7jy3uPQqqdhGgd094HQHVvKD6x4qy7TPjG19B33HxmDceJVWWS7UDn5ibRaNUsy+3K+0uligIDgCJuTpITePwxz52y6ZJAnWTPrZNNwsDLqcwdv6Hxuu08Q9mjm2MmZG06eHy8pPewlJfWORpcHZthcjkRpr6wm6OKGheeUOGYeBm+3srNtRj9bTuerdb6aj0KrMRgbmGiNQ6CPl5LrLL1XTyjf8Crsexr2sa1zcrSWEuEtGuU/AYgwLXsnsZwh5qnJkcdZzZHOtBdD7G8AwTroo/2asoUmvFeA6c7c03NwY2daPktG7EEucWgZSTEm8EmO74bFcuUl/wBa1x4ysTxfgmIpxna0NN5eGsAPLNoT4clFZhKhjuMLdMwMx4XC9JZUDAQQ0A3OUwNtW6EWiIXX9maFdozMDRHxtGR4IAhwc2A68m4IJKeXyTrovD6rzGpTqsN8oHPIbX8/opNKo8CxbEE2bYn6MqVjWHD1Th6j2OcALtNjNwRIBBuBFryomIqOZq0xNnbHz59F14896vtz/hbi7UHzI+vdSGuP8RVW7FnQm3imxiB1HmVu8bSzWiovBib87KVhMTDyJiOR10jwOn0FlRXbuSPM/JWeBrfwEGNt/X3XPl8dPFdY2i272tBjURf13Cq31RsxruerY5qXi6xyF4m0kgjS0GOYVAcXJJytueS18W52elkzERH+G31cU+ytpmj5fUbKndihsAD0Cdw2NfMHvAiIJAHvouuLq2fUBMy0TyJ/ABAe4hthF73P9FBxLmANySZmQXB0HxaNL7p7DPyggkEayHSPDqmspjMTkBygi/l4akdVNo8ZLviJaetwfa1lU0qoPdbqdNfSyCXXzNOmzXe8nRYsl9o0LeIRHeseR09NVLo8UAIDgDO5j8VkqsBu4G8a+HTwTDca5pgQR/5a+uyfjlMj0JmJadCZ+uaQ54OhB53WRwOLH7pcDyJJ+gptPid4cIPX6+oXO/Fd6MXLwCZLbjQjokhg3J6Ag29/xUFlcm8u0te36+646u+SJafM/PW6ZyjNmJbmTIjnq0+o5fqmmVCHEOIGwaZiOh/NNDFk6D0gwfroirVdZwgkatmf6pLUw8HQMpEg7SR7a+6S/D27pkawVFGLcYN7XiI8p0lPjFtjUDktbygbq4Z0A9wDcSR56WTLXuZry5SPGVMzyDBE7Jh1TNEOAd1i/TwWpyTCRRcRLQOmunL1Tkn+Ef6kj7zYxPhf9U7mVnKrHkL33JB1ifXpzkJyniHHNpcRKhPkE6kLlFxkHyUvGV1qYK/didpUzBsa8kZo7riNbkAqmnUEafopBq3AjQCT9dZWeXHrpMWDqhgSYMEGfG5j3TheMhaBYSZiDcc/kq11Sxi99Z2lOYjMXmAPK3kp4tTnZMWWGfEaA8+egv6KwGV8l86AzP8A4gTAMk/kqfC1O9BjTqORiR1Hv6z2sJ0GvjoeWwtHRc+U7S87ln6X/aKmz9pqHulziJB1uxpIFuqqXsa03bknS4j1VjxDAVq2JfUY1mUtp94vgSKNOZiZv0VjR4K2JqPk2JDTDZ3MuEwekLNnf2nHheXpmnB/8TbAnXbQfgnGcHrvJLGaxJPdGlu7r/RbPC0GM+BjB1In0JE+p2U8Pbu487R8kmx24/DJ7rJYPsmWiKtYjo1h/E+Y0VrhOAUWjLNZ/iSOn7oHOFcPY25HuSlUWSJJGXMBEwTzjyVv9bnDj+o7guFOJy0qUc7gdLk/NXeH4CGialTL0bEjzVfU7b0SwnD0nvY3MJYGAd0wLF0gHWYNjpKxnHePVK7HF7wGAZjTZOp2c4/F5+id+pMS3I2uI7RcPoOhrfvHiLgFxEnXMbW6aKmxvbOtVMU4Y0jlmJB0voLel+S8+pVHA5nMLWxrJgx7D9U43HPa9oN22boJ7287LXhc29s21P45mJY9pBIJ1AkTeS463G8wZ5pqrULRD2ZwbETaRNu7+9EGVYY6g9glwa9sxIiNZjXUEbwmqeNYBlcxsGJ6cly5fJLlk1y5Xar38MzDNTIO5BsRMxt4KO7h9Uahv+oRHr5eavxRIl7SADJy6keHumKePYSGuBImJOk8uY+itcfn5f8AU2q5uENpy+UmE8MGAQc4A57TzEkeyk4jAkizREzFxAI3O4UYBskB7QBY5pFvS67TneU6pvJIyQQQb7iZaZHXaI1CYrYOZLIadMsAt6Qdp9kNqsktztNwLAmRzEjulO1MSzdrhA1kjn7+PVJ5bpnJFdTdo5mVw6a/V0n7kHUfJWFLFse3K5zzFh3L/iTKYxApH4Xv6T/S4/NdJeX0WU7hqgZ8OWd7uP17J3Gd/KWlvVhB15+arHWsHWiCSD9AXSGOc0yCDGpMxFpvtc78wrOPekifhsUZh1hpA2Py/RWH3hgCdNZ5clUNex7hLhrqNekx9XUumWgEmsydmlry7UWEMIn9fAuXHSxIe9zbn4elo/mHVNV8PnIcx0zq2IPLuk2Pgp/DsDXqvyU8ru6Xh8PDCAYIDnMEwToOqnYrsvjGMe8loaGlxDMxcQ1snKxou6NBuklTFHhm5TY3nxPhyCm4nKRJtpvf9VBxPD8Syo6n9w9+hD203Q7M0O1y3N4g7ytFhOwtR4DxWaJEgOY4OE6hzZlpGivjvemKdtNkggkxq2J/NSGVAO8M17GRoefTyWhZ2Iq6HENA2IYSets0BK/uM6f/AHH+wfmp4f1GWOOInTccp8UpuNJvMb667haz+4rD8VZ58gI84XWdg6G7qhO1wPknjxMZU4pj5D4J5j8CBr4pTHsix02K1rew+H3dU9R+OVOt7F4Yfx/6j8lbxn6MZBjnC7Tb60TTqzHaOId0Nlt/7nYafhf/AK3eCdo9lMI39wu6Oe8gWjn19uik4xMYV+LbuJi1x+B8uaV+1D+H3W5f2Uwh/wC1/vf+emqkf3Swf+W7/W/81fGNSPmxwmIsUogAECTv6kAR5xPmnvuxtB8/zT7MOHaNJdybJPsud5Rq3VYxpgiPK6KbS6b+S0NLg2Id8OHru8KT/wAk+3sziyQTg6tte4WE+MxPis/kWTYz7cOSJtA25/polseRHdJnbnrp9clrKPYjEu/7b2fzFp/FwU9n2e4l0guotGt3EnbUNB/FZ/JE8eX0xTSS6zTy0tvMK1wdIkDnp15j5rX4b7OqgPexDB/Kx5/EgK5wPYdjSC+s93MNY1s+uZc+XLlfR+PlWJwNR7Hc29R08D9QvR8DwbDvpteWm4/jt42U7DcBw7LhgJ5uJd7G3srAUGnV08rwFjjOUu114cbxnaqZwenNm2/mJ+amM4PRAs2/8zvzUwBo0AnxXSCdSF1dEL+zqOhZbxcPmpL+GUHMyEOLYiM79D5p6nSAufxUgPaNx6lBkcV9nmEcB9259Pw73pOiwXa/s43BZWGpn+8JLQTchpEueMoy3gCHHfqvanYkDceq8a+1TiH3mNYxrmlrKQEAg5XOc8uBPMtyH0W+N24xZjOYSqXuLXPOmmx2iD4qS/CAGA5sTPeOhHK0Ruq2jHcO95O9+m2inNxBBDmmC0hwMwQRcG24IW716Sd+0mm9zSA54MzLD+8ADItaL6lRMQ0XBJDZGg8xdMurOBLt7X5AaD66qLisUCRJjkb89YHh7KeHFmzVqzHdwA1ItFgRHX2911+LyjRjhAuHCT1IOh3hVTw0kQBBjS0kcgCk1QyCbkbkREciI1lT8fGJOls3tA4EDM6Ld3Vo25Jp/EPvdKdKZ1giemtyZ3VVVoMucxtq0X2/i0meiba7LdpW5w4z1BdNyZC92RjhPcyPm2l9IPP1TVbFNeSWANaBdoc6+gnvADXZV1fGvfq8zAb5CwUeCdPx2W5pjScL4rhmZvvKZqdCXNy+GV0Hb09a2pjZLyxwAJJgM0EmAJFrR7bqtaTciD62snKFcgiWjL4R7qpi1Zxh+RrAyi0tmXmk0vdcQXOfm007sDnK2/ZrtzhaNFxqUGNrS4Rh6Ya1zdWhxLrd6Z12MLzo4hgizvG1kzXxUkAShjc8R+0Ks/4aOGpyIMt+8nxzQD5jdQaPa1waB+y4FzxmOc4VsncGGlo7vQbCZWQbWOhAKX9+D0PgivTMN9oLyQ4YDDioGtY1+csEaZQC3utkmG5ovrur7tN2lx+FpNL6OGY8zLvvHOabEhtJpDczwBJmy8ZZiDENJuL3IkctYKeOOMRneAdRndB6kbojWUftExticRTs4ug02kOmDlcWizRoACDG52tK32n4sZXChQDS0bucC6buFwWi/wAJnSZXnuN4s+o4Oe9zyBllx2Gg666pgYozIkHx+aGPY+CfaQ2s9tP9mfLnMYXMIIaXOa0Oc06Nkyb6Ddbp9fLqD4x+i+eOE9rcXhm5aFZzGyTkhrmmejwROmitGfaTxCe9X/2U/wDgiY9txPEWU2Pe85WMaXOJabAa238tVWcI7U4fEtc6m74RLmuEOAAJJjcW1E9YNl5JxHt9XxFF1CsKbmuc0lwYQ4hpa4CWuAAls6Sm3swdNjBWwzs72h7alPFg9wxJyhrg3eAQdN4JQxuOG/alQeXF+HqMEEtLXNdm/hBBgNcQecDmtHgO1+Dq5Q2uwPdHce7I8E/umbZvAryCr2fo1O/SxDm0y5rTnZncHuiGtyBpeb6BoiDrZMY7hGHw1djMRXfUyOb97Tp0xma0GXNLi+A4iNJgOG+gx72+u0yJcD1ETyFxouCu2B8OZ2novP8AC/afg/8AEzYasyG9zvhxfcDLazT1k2BuFYcC7f4Gq5+Zj6EAOmo5ve1mDmIkfw7zYWVTK1/3oPxBo1iHWNtlOnw9QvNeIfaLhC17WOrlzXSO4W5xY5WOEFpndwvfVQv/AFWb/k1f/sZ/wQytb/Z1CT/hUdTpTZ+SlUaTWCGQ3o0Bvs1POaL+PzKgis6dd+QXhevImT1J80phnS6aFZ17+wShUJGqKkli4A1Mldo7oH2xyK6Lcl0lNueeaaFgdPQFda0HQeyaGqf5BNZLpUr6H1Tv3I5H1C6xgjROhgjRaiU2GN5n1SzTbzPsuuYLWTcX+uqohcUxtKgwvfVZTaP3n+EwALk20F18+9o+JCviq9dvwvdLbRZrQxpjacsx1W3+1bFvGIbSDjkDC7L1NiV5xifkt8JnbHKn8OTF+ilVKmVpdA0UVu3n+CXi/hPgulSdI9XEk7+e/rsopM/XX3Q/RIGnmFqMpuGfIjl5ecIfSfoBIN5vry5KJSeQ5t+S1XB2CHW/eA9Q5ZvXas6yk7oPH9Eiu1zLEgmAbGx80uowZjb94/iE5UYDSJIkjQ8rqyojteNyklwvYxz+aU2mL/mVHBuroksrRYAesLgxDiSDlv0TLhcrjFUShTcCRlEc4+aTiKJaAdj0+e6U55aZBix/A/mpPB2B5IeMwIGvRRVYXldDzyUnEHu5t7/UaLScJwNMvpSwXmev1KJbjMtLrEtIaLZoMT46SmzUm+q9oo9nsK1tNwoiXiXXcZsdiYHkqHG8KoCvUaKTABoI0s1XE15oHJRMhbjiOBptYCGNnNGk6dDbZR+GcPoubULqbCQ5oFhbvDT0TF1jC/kgvK9G4lwmh95RZ9zTyubcZRz56jXZU3GeF0aVWGU2gToe8P8AdKDJsdzv5oFTVejYDg2Hq0Q59JpOdjBHdAaXPJAa2ANdQJUPi/B8O1stpMF9ghrM9n+PVcK976U53Un0xBjKXZTn0MwWgxbTUKvq4tzi5znOc51y9xzOcZmS43J6len9m+A4YseTRaTlN78h1WY7Y8IoUXTTZkMnRzuvVBkXvmEZyLgpQC2WEwjG0WODQHQTO/xhC3GTY8mJD5OkN18E59w//Jrf6Xf8V6xwzDMLW9xuvIclpv7Pp/w/7nfmia//2Q==');
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS7UvTv7BAULMDsDDCQrZVYWgby_Mcn8heuA&usqp=CAU');
imgs.push('data:image/jpeg;base64,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');
imgs.push('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSSnd2jGOKB6eOdoYdpHIULKmaUJnjfauCtYnsHBQUyYMnH3UDKtITJE96x3ZseXWAylQ&usqp=CAU');
imgs.push('data:image/jpeg;base64,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');
imgs.push('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBcVFBUYGBcZFxwYGhoaGiMhIBoaICAaGiIdIBkiIiwjGhwoIBoaJDUkKC0vMjIyGiI4PTgxPCwxMi8BCwsLDw4PHBERHTEoIygxMTExMTExMTExMTExMS8xMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMf/AABEIAKgBLAMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAQIDBAYAB//EAEEQAAIBAwIEAwQIBQMEAQUBAAECEQADIRIxBAVBURMiYTJxgZEGUpKhscHR8BQjQlNiFeHxFoKisnJjk8LS4jP/xAAaAQADAQEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAKhEAAgIBBAICAgEEAwAAAAAAAAECESEDEjFRFEEEEyJhcYGRsdEyQlL/2gAMAwEAAhEDEQA/ANInFW2A0usmIE7yYx3HqO1TqhkzEYgj9K804PivMCHGoA+WSGwRhp6gdd/vo5wHPLiwBc1AE4cSQex6getdUPm/+kcEvidM2YSnBKEcL9ILTRrlDHw/UCrvE824dF1C5PYL5p/T410L5MGrsyfxpIuBaeFqhwvN7TadNwAnYEZ+PSiYJmacdVS/4uyfprk4LTgtdM9qVWiqsf1jlSpPDPY0gbsYqQOdpPzrNtmq00N0U4LUpuEiCZpoFRbG9Po4LTgtcKepPQ5+FJsa0xoWlC1KLzdTPwpdU9vlUWx7ERhacBT5pVNFhsGhaULUgb3VxM1Nj+sZppQtOAp0UrFsYyKWKkC0sCpsf1sjilipIFLpFKx/WyOK6KkgV2mix7GRRXRUukV2kUbg2Mi00kVMUFcVo3D2Mgikipwg91cUFPcPYyuRSFan8Om6Ke4e1kJFNip9FJ4frVbg2s8E5hlgHTUSoaJ2iJ0tHYkwZOfSn8JxaXFlDLY7biTmBkYAn3YOTUvHW9ZwVyCg05jUIkgmGz89vfmLTXbRb2hHXJQ9N+vXcfCuBJPg2o1WuRCwxnIYEbHIzjrGeves9xHE3bTtrRkUzB3PadYJHwmOlFOV81L+W5lfrCIWdgewwc/PvVjj+FuOtxPDLoUYl1Macgjy7HMZ60rp0xNEHAc5RhBAB7kCDPetXw3OGtkaG1KRq0nI9c9PnXnXBckZmg3VQxsVcT0wSACPWaPhrlkqLjEg4DLkSs4acriPvyYpvUUXUXkTp4Z6JwfPrTgayLbExDHfqPNEVd/j7f8AcWsFZdX28rR17j/j41NwfEsceJMRMbjuTviuvT+XWJ/3MpaS9G+TjLZMC4vfep1vL9dfmKw9u6DjU2O67/JTVg2j+zXoRjGWUzmlKUfRsvHT66/aFKOJT66/aH61itJ7V2k9jV/QuyPufRthxVv+4n2h+tOHGW/7ifaH61hmQ9j99cqwdj99L6P2Na76Nz/G2vrp9ofrThx1v+4n2h+tYTP1TTs9jR4y7F5Eujc/x1v+4n2h+tOHHW/7ifaH61hM9jSfCjxV2Hky6N8OPtf3E+0KX/ULf9xPtCsD8DS/A0vEXYeTLo345ha/uJ9oUv8AqFr+4n2hWBn0NL8D8qXiLsPKl0b4cwtf3E+0KX/ULX9xPtCsDJ7UoJ7Gl4i7DypdG9HMLX9xPtCnf6ha/uJ9oVgZ9DShvQ0eGuw8qXRvv9Qt/wBxPtCu/j7f9xPtCsFq9K7VS8Ndj8p9G+/j7X9xPtCu/j7X9xPtCsDqrppeGux+U+jffx1v66faFd/G2/rp9oVgZrs0eGux+U+jffxtv66faH6138bb/uJ9ofrWBk10mjxP2PyX0b3+Nt/3E+0P1pP4y3/cT7Q/WsHJpNRo8X9j8h9G9/i7f9xPtD9aT+Lt/XT7Q/WsEWNJqNHjfsf3vox3KuHvXW0W7dxVyPEuqYAiRkEE7DaaM3/ooxUkMA0+0jedgIiHYGBlpGekVS4bnl1DgsqqIAhWHQMSDJYjoT2q4nO2uICLijYHXbUkkQTqtaRp36d68FqcXaPSjs9ga5yQ2vEBUs4ZQNIUHQdZD6hpC5GZGceoq3wXB2blt7Vy4y5C4YeZokkrIZp1rgT3O9HbnMrLLFy4HM4hNOnOIKgQQAcz1NZnmF1zc/l3FdGZYV0bzRBhjkF+zGc+6m9VPD5FKUVxkkTkvghyt43FAKBBMyQCGgETGJHcRSC1beFu+I6gkyg0svTzJuy+YGBJxNRWUurq1Bbi4IAAJBHSJmRg5+7apglu6VZwyuRGpeoHQx7S4+ExNCTllNEWmVeJ5dcQt/C3Qy4Oll0mDPstkGM4MR0p9vmnW43mGOmDMETPQz2OK6+ly3BDlgoEEzA3nUZMgnvH50i8K98F1RFZNI1P7MyYi5CjXnae2OtJJt1JCcbL1p9Z1IyHUI1E7knSMSOpPfarGi7oPhksRD6pEkMBACjZSVPtSc/ChXDcLeFw2yqBhpJKnYGGkeXEAxHUlRWossGYpdVFLHowZSQFyMzmCYOYmulOUI4fBSiqplCxxdxGcXCGg9SAB8j98ZpbnH3YYi0YHTJMRnSVJ194gGuHLkAgXx4RkhVlvKemsySBM4iKGeOAYt3SckSwO5PpmMgY7b1pD5U+E2RLRh0gnw/NdRiCdPt6le2wwT7LCDsMzGegzRHhrqXE1gmJI9oH7xQw8Td8XyaWtgAlnUHUBPmkliIJ6g7dqdw1iza4oHxAouE3AgnQw7SJIydiN5A7V1afyprnJlP40JcYCvk7n5mlAHrUvFpaCoVnJgep6AzkdYPWKH8u4gXC40+y0D1UzG43wQfd8K7dP5MJuuGcep8eUFfotwPWulfWn+COwpRYX0++ug58EYcdzS6h3NSLZXp+FPFsfsUCwRBh6/Ol+dTBKXFFiIAacDU4IrgVosKIZHeuBHepvLSwKVhRDIrqsBRXBR+xRYUQaaSBVnSKXQO4pWOirApYFTlPUUmj1FFgQUhFTlPUV2n3fOlY6IaYRVgqfSmEe750FIi003TUpT3U3w6Bo86sXSwDWwciNpDAQdup/fvlRl1FbmkuSRIUgyDtv5enXbahnD8PcgsdYUqWJbEx/ioJHfPrtV7hrFxF1GGEiMD2f8onA9TiBtXz01iz2Cxw1wm6gl+oJfSQDgAAb4JnaMDqKH8HzMuQrqFM7icn3gkehx89gS4KZXVbYKHDEttq1CPMBBjymR2o4OWAP/LtWwMq5YCdUKSVuQCYBxtt1nGP4uLtBTAnBcUNKeIGVgzQy9gFI1NojdjmF2982rly2zKwkKwYHSc6gAwMwIJCsMjt76M2eSojMUJKvHsqOsg5CwDEZP8AvVe/yBUueMjM2gGTq2IkRkevvxRBxbL2MpcCVuXAltbjPDKNeEkDY3FksPLkASADkb1MtgkkXLltmRV8iglEy4YW4A1PqQYBjyCd5EvDcxXxblu5cuWnWFQ3rpdJI8rR7I1DIOYjEEVWQpdA8W3lD1GYkElGBzsDv6HfOu7byhX0F+AtkkHxAyggqGUSSfZJKgnECJMzEiVzV5tysXfDCM1sI5byprjYDSRBA9rynYzjNO/iZYWluGNkKhVjEjbBJ2zkn3g0B47knEqCwu+JuwAEEjc79QPX3Vai7uwbQT4blBtq7B5kww0hGUs2+rZTJ2Mdqr/6QwQ2yWTU5XUzKc6iPKCOu4IYH31Byvm11k8NFZxGQ2SBiIb2VHm2ztIopxfGsDb1r5StwnSPEVQdUEqdmkxk/wBRESM1XZNnDl16wylHd1I8yuV8nRgG2LECBt03pnG8QLoXWralJUGVDYaSoiRBUkYxjpEivZ58wJIZrrJ5ShUrrBKgNoMwyhW2+sSdqocw4m690Hqblx0ByYAmEImJU4BMYG3S0mJsK8c5u29PiLaUEIutohoiAVHSZggb+gocG4i1pDasEkhWiTuWlck5G87ntiKyniLd1qx2QifMrSEHlkNMNkzHl7mrvC8UALouaygUXElm1hi5twu5J9ox6AbTVJtCeSz9H+bAubbOX1SwZiSQeq6m3IkZ6xWlcwSDvvHp0PurH8ej2yl0EHw2hQd11qc4Hs+afxo5ydC4JuB7TKcI0QJzIZd0OqCPrCewrXS13F54MdXRUl+wnrrvEqHxehI+dONz1++vUs87aSa/fS+IPWoF4he4+JineOO47b0WLaWPEHr+/hS6/wB4quH60ouT1/fzosNpPq9fwri/u+RqIOP3/wA04OKBUS+J+804OelQlvf8qSfd8aAosa6QN7qgk9q7UewpDpk+rt+NdPoKhHuFISKApk2r0++uL/uahkfs0gcd/voHRMXH7NNLj9mm6v3Ndq/c0DoUkfs0hUUkinQP2KBmP4ixostpJQlWKyTLRJMiMScZI7Rmssr37Vy2zADXBCppOsGQMLMk5we1alOYsAFg+UDbrAxOdu/5zTuH5et023NsKwuAhkWDIOqTiBlR0nNeDF9nrh76McFeuIty5dPhkDSpHmZdxPYZ2/DrZvcPcthiEUkKNbuTBY7rtJxA9+Kfy3m4W2pbAU6c4yIGfj0/4oFz7naXAQ2rwiWW4UJbORJIB0we0QSexFZUpejR49i3OKZpgi2xIQDVAOTkMJIOAQCP6vhQ48Q9xU1cQxlpU2j7QMqQ0gyASJDDeZq0nC2OIWC906SsPAnoQT01d8fKouN4JrdyXu3XUmdLWkO/q3Tsa0iksJEskscuN3TbW44LoYDaNICtpuSEkBiGGxAJA6mtLxHJltWFa4/ikE+Zt5iBEGT0AA93UUJ+j9s+zbLsNTSzYjJM6dlzqj3elaDnBVUtk6mKQdKtqyYGooDnqJ2Ek0nLdLaVtqNmY5VytOKdw50m1cIZlLe1GnTnEx6dJjNXeecEeHbUbsm5cbwyQdKkKM48u0iDvLZ2Av8A0Y5ZCvcclQ925dCyPKrElSTvMBfQVQ53zO3cfw9YZQ4QgkET7TwB1QYkE+p3gUm5UuBNJIxFznMsbagG34hbKgBxnysukCD7UdIGMUQ4cWLqi3b027ikwGYiVMsV6hgWY4G0CO9Vr/InlQGUIfKCREbkCT7TAdpmKq8PwNxbmghSQoLYO2K3VWZlv6S8Klm4hCaAbZgam3WR7RyDnoe1aXguSXbqMwUaSJRnIESmkQN5ycgdd6F8Dw6sym8fEVHPhJE++TMlQf6e49876zxVsINZImdz292w6fKspaiT2rkuMbVmC4jlN6xoS8QSSWwSfYYT5hmDuPTBirHFW1Ns6FhQwMBckRIXrMk9IifSTLz7nQuXlt2T4v8AgmTqgqQHEgqQwMCRgyKGfSe3c4e1btqFVGy+gnLwBv0A3Eb+6tVkgZfvOLVsXCqo6soVW0PKyQScTARMEgbGDMi1y3iGcA3XD5KFQcpMwW0gZ0hRmSZJFUeYcIw4dHeD4lnzE+ZpHiMPN7j6xHxqp9HeXPcd1zbBOlnIHkgiBnJOfZG+aTwrYe6NXxIFsYuAkk6Qx3PToBpgHb1p3LmuaW8UKTqxoGAOxJgEzIkfrR/l30bsOoW49y4QAAWaIA2A0AQo7TUXH8pa2RpI06oKldJOTpiTJgAZ9/fGmn8h3hkz0YtU0DgFPRfio/WmMi+73D/enXNUyNIExvTC8dsdjXoxmpK0cEoOLpi+EvY/KnomMfhTZnH4kj8a7QD6fH8yKomiRP8Au+VSQ3cfKq4AncQc0rCM6vup2FE41dx9k/pTgT6dto/KqhuR1ge6PvNKl8fWj4iaLFtLmtp2FPW+e3799VlvT/Vn3fnTjxH+Rn3UWG0spe9KXxvT7qrrdmfxwadqP7GaLFtJ/FHYVwcdQKi1jqDTWK7TH60WG0m8Rf2aQ6e9RzOxP7/Gmkev3UWOiYr6j503Pb76hC+v7+VdHrSsdEPLuS2mYktDA/04UGQYxGr2ekTk+4TxfOUW94NtVZlOj+WNysyZO0R3/Gn8k4u4g8a5jVITsYMkkjePv+FX1sWVt+JbUI5MalWJA3JO3Xr6DpXz0Zv/AEe1KCJeX25t21cICGYuCpYEtJgH0E59fWp+J5OtwFnXSsaTCY67jPXrjpnaqpvXEIKaYMggmFMgARiZMjYjIGan4fmbqxRldVdcLn2WxhuoInbpWkJqqJaBPA8IpLWgjXNKDS1tSGUbqG09BtBkZqzzHl1kWzaLG29u3km4SVdjAUkxHp0I6Vc5fxbcO15m8quWvmGmDCgjG8sMbzNS8Wy8baW7ct5UBiukHUFLQhBOR5mjYieoJFJzdhWCh9GJVHJdfKqgdAWgR5RvLMflUF/i3/iHtOQwtoLpYEydsaYhTIAx3+RblJF57j3E0AsDoBiCBEzHaPv9ZDnhY4y+9u3cdPIMZ1BBsGOACR1PvMRUx/FyfsbzRrLSkcOSxVW06oOQp9qDBkmPf8eue4P6MpfVHu3F8NPYW1bW2CJ9o6RIBgECSQOsk0a4HxLlq67hUuFWkHzBSAJURg9Rg9KHct47Vcvkytu0NIGJ8slmGnBkkADB8gEUoyaWAat5CHE8lcAMHkEszBlHUyogYAE75Nedc25y63VZUUEak1Ehg0luggwG29xr0PmPNWVVIS55lLatJKqIwC22o4ry3mhbxC7MDBdgexDuokdcmZ6jVW2m21ZnOlg1XDlFIm4gcrADOFx3ncbzjJ1dBU7/AEVfiWF29ctBNIFsWySrCZ1A5gGdxmYx1OX5XyK41wXb6P4IOq456gBiVJmQSV0nqCc5r0LgWvXz4jeRAJRdoXYGO/ST32NTKahhcsqMd3PBHy/6MpwatctsHuFRGoaSdIY4kkyTA6YAxQTj+L8fwbdy2FnxLbArtKSpVgImQwkYOmRRXm/N3KXltsfEtKDpUksxlTBA9rVBEdj8ayvNHuW7r2xKXHuSNSMNS/yiig7CCH8vXVHWtIXWSHXobyTmDFEs3IZrTBhIGFV9LK3fys/wFaTlHCm4E8ykIzKzsTC6cARg3bhACkyPZ74oYn0YuC4OKZlVCGZtchj/ANgXGIkTM7E0X5fwbgDyvn2BBhZzmBjuWO5NZ6k/SyXCPtmlscpAQhbz6oJkgKBjppAMfGazvHcze0fCvQ3nVAAWM5tw41CAYcmJnHxomnFXUIGhoGoEs8DE9Cur4g9RWZ+kCq9y25MNbuWmca5MEwG82dMlhj6sVWkmlkU69EvMVZnQqGgEFmBgggRJwQwIMGdo3oYtwcPqN2Fa5cZgpkx7I0znad8YNGeZJ/KcDysNITf+ZlSBjO8j064qnf5P41oC6dKgymcpIA0SJBUHUQOsgYit4zcXZlKG5UTWLpcBlXBE49/QqYIqcE/0l/v/ADigvBcFctILdy4sDNpiDDeZgymdumMlT6Uj8xuIwt3LTAz7cymn0MfGQfh26ofIVZOeWg7wGy7YkGes9vQzFKrf4EesUH4biXuXGJIS2EIh4I1BgvtRjIYA56TGDV9bkD+k+4nHwjtWsNSMuDOWm48lkA7QY95/MfnTXJ+HuM/OYpiE4z+EfIz+VOFxoliBncE/hGK0sg57npPx/OMU/wBwPz/2qGSJK/OcfKKY1xusfkPvpWBaV47z3I/MCpFcx7R/frFVFvDqw23k4+M08P8A5gkbgET+NFgWg7ehBHcU4O31R++9UVu9z8Zx+P4U8cVBglZ+H7/5p2Oi2z+kfA/jXB+zfMe/tFRpd9Pv/SpNfeY+YosKFDn3+7H512oVHPoMZwP0rta/40rHRBzXl667VrXCBdUR7KZgCMg/fj0MGE4G2bZZJ8gjePX3bYj0FY/m/FuzaLZlm6zIFtZz6Dc/9xo/yS+iAWzcaYJ1bBjjpv1Bg5yMZr5ltrJ7OCPjOEuFWNttXmgJqOMADcDAgkn8ZonwVpBAuEO42mAoEZ9RgdenSqHOuZHLrhVPhhwMFiO3w+6glji3Aa42NisnfMyfQD99qjN1Qtquzb8QLNyVZQRGnSRjvhTIEU/i7lu2gZmAtEROqAoA3mYUCsz9HrwuS9w4z7z1+Aj7/dWo4/grN60yPqAKDKNDAAgiCOsxvS3WNqkZLmfMAtv+WUIYkmX3tzuIGd2x2j3UR5It0WyAAgUpJMZ176RPQMCJ7r0pnNrT3OD8M6SFaFj2gASQoUY3XTmB7sUrl34e3btiC10dvL4eeo2WEmR0rNYdszaphDj+KtWV0FyCSS4DbJqJJPUbgTuZEUJs8wS4mu1aC2gyyScCIIxsBmd8T7oEfSDlrqi27OraHukZlTKjeSSZkjsJ2JEF26Rbt8MwZnbiV8UkZIRbTST21kST0Q9q2jbBt2bpOYPcsA27bsrDDIFAVejeaNY/+MzFYLieAFy4dTAlHWCogsLZ0QTgRhgCJ2x0klxP0zFq4LNn+Y2oIGxpAYgADaTEHoM70GXm4uXNQDeySCRjUJPtEbHUD6aozis574tNCk7ZruIYtZt2gmi2zJCgbiW0qB71kmOnrU3MmuKU4clrashYsukx0AnoRjHXuKAcNzoIQwGVaRGZLB/iMBtsnSCN6pc54q7xZAa6YOk7QunbSYWQ25AJPXtThqZyNyRr+T8jtpeN22zXSbcO9xg2RjGAdUAgk9471J9JUUC25BFwMNK6iZJ8s6JMwW3AnG+1Urd+3Y4YBHjSohQCWKgZPdRgjue4mq3Luc2rzeEOFLEKCXgeXxF9o3dRYH2ZO/vre28hSLS8/QsbYhgpAcAzkQQg+sZMmMH50SXm1/XhGEAEsw8g8xUKFmTMTI6QeorK8By82uMDW0a4sG44CaggJldTYEiX2yZ3Oa1XG8WLRCzpdxCyYPlGSBtEnp2qlFUgtk/N7r3B5bbaiuDobTO41GJiRWQv8g4hi3i+FbS5jVoOJZjC51FpAaNiST0zpDzjIVtQOcwQDHUtjMZz8Khe+blwPc7QonCjvMbmc1W6aWEKk/Zd/wCnLbBHa47vbWAXgT3bSIUNEjbr0oFY4thce01p2ZAGgddvZJOd/ZOxBE9aHc8+kN+xJtsroCEuI0yurIwDBVhIk9SMHqKTmVoOeMFy5Fw+FdTMoWBIKtvAIYjc/Grgpf8AYiTXo0HD8cblu63CvqB1RafdWmZ7gE4I90bEHNWOY3LvmYhX8yOdABV1YtpUYyUB7yUYEdaK8Dy605N7h7jgvqB07giNRXGQSRhpz2ioeP4Q3LNxrhtrdWbhuqCoZk1aSwMaSIiD+laYJG8nmz4osL/NMuA8EE4kBsYOBDQR8iXDjbrEkcJcS4MMoEK6kySGMLKxI9CYOaucm45Xtm4pV4XScEOiwDp058QCPlMetn+NFqEtw4KgquvIWQoj/HI3yOvpSdCq8FNeYprFu4wS5IGhzpbO22DMdD1HerzAjo2fUx86yvMeL8a4NSJba20q4l26GJGIkHeY9K0a34ZWtyUBBKlR5oIPqVwCDBAIJ9K6Yas36OeelFexzt2LD3GR+PrSzJPmM/HH3fhFI/EKTKgL6dR8zSPdE5YfMDb3V0GAj213nPpAJ+dcFXbV82E/cwp2qcjVHqTHzBpCndR6HUx+4CgBAijZx6+f8tdMa2v1onGdvdE04D0ftALfn+NIbZP1x75P5nNAyLQMmUPqGH7+6pUP+Q9/l3226/8ANcz/AFh7/N+VQERkde7YPu80ffSoETjimWfMO3s/p0qROPx0+X+1UvEzh5PvGPgWpju0+1/6/rQMJ8u4AFGuXEDNdlyQ2VXOlQvWAD8Qe1XB5SiKwVmmVUY3gHfAHeoOFSJc/wBSx5m1Ak9SYB6T7+uM0OF4m3buMqnxHPmLEEx2AE7R+tfMWuT2I2WeeXBrWzuA2pQB6ZLGZnf51U+kLAW7dpVg+X1wFgCf+6p+IvB7zXrmApRBAiWIQADsS34U+1zPWt24yqUGlwTOwAZVgmCRge9qpfoeOCvyvidLCzqg4Ukd99uuf3mrvM71x7RTh3PiM4VmTBQDJYk7DIyM5ntQT6PuFuJcuyWuuFQdyTn3dp9PWrnCXVW5dVQWVrjtjyxqPlgDExGI/OiOLbCWcI0ljkKXLZRruoPuojSIiM74gdsn3UM5Hc8NDLhfDuX1RmkTqZDIk4wH6kDR6EBeH49D4iI51AC2wGy6pmHGGICtjuR7yR+kHBWrnCmQVKoxGkD6r+UCIGDGO9MiS9oBX+bIHS65cqfKlvSo/mO5YFmkmQMkbdcyAAVzjLcqGLM1zXdwdmuILmkmIwtw9D271pv+mrb2xcuM6+ENQ0gdVQTJ6qF3ODPpQfiuFXxNYRGRvE03M5IVp6ECCoHmg5GDNUpUjN7jM2UEteVYhXYEE5ZvKpImB53B+BOKK/R/kt+7b1W0GlsLqMDceYZkjOqRHsnrWj+jtjh7tlmuKdKXHadTLA0qSceYZAMScyetX+Tc0tkhLYC20WFHaMRPp1NN6n40xwg3yBb/ACAWnPii7cDsG/l4CIikAbFmMlhjuNs1V5hza5f0WxbS3aKp4QAzkAAEg4Ev09D61u+f8xCcK7aDc8hAQGCdXl949oZjFYTirq3bwQHQLNt7dtQJny+3p1AbxAEHbsDSbVBKlge1waiTIdwLReB2WFZR7MSpAnYk+6DlnKeKdWC6baXAzSzADWSDqPUqi42gkn3iW1wyG4oVmBIIgrAYBnAg5Abyz8B7qtcfwrXbd1EY+IFDKNWkMAYjMAqMnT10j41pttNJ4/Yl2HOWKnCcJb4e21suykMWYrJZodlEHW2VhcdM0G+mF5XSblxDpJFu2iMXAJUK0khQ2pW8xTsMkZBc340vxyOTKWVXTPcAaWIOzF2T5DtUNriGTiFQNrcPIbJBuRJuadyFQ+UdPExW+13bCw7yfh+Nu2/DcrbMB1e6DKiTusehMEdZ6RR21ZCMql9TeZG0kEEAk5wMZx6/GqwvXDJZ0dMEkqMgDbUOm/pkmKl48MLiOhgFoxg6t4J7ETg4rSN8sl16Obllq4GF0BSVKSCZKSrCIOcgESOvqRQ3/pEWlur5nt3E3cBQGGUIYGVgkgyv6UZCgg6jmfZHv9ofCPlgVSt8Vc86PbW5ayA06bixIw4yG9ZEffR+XoWAVyq01oC1pZSr6hJGLmkwAwA122Eg4wY7+W2eKt3P5jXAnisqgEDyOV6f5GBiaC8Xw96xcuEBntm4LitIA3BWUG06iDAAkLsMVW47k1xvF0IoFwpdChwQtzMqH9kyGbYxIAmrEEeB5M/D3j4l1Ldt7pKhcsynUAFWB3A9CMeug4pFuhbdhhcUpuVAd9MSSQslgQCR75FZrkHFm4Ta4lSbyCbRdJaIOPrE59CR1NbK1zC0gXxbetrcpLCCmDqKHSNxjBJ6E1cVkTeDM3OGVYJTrg9Dv332PoatJ4ZHslT6Yqfmj27pBTGABLHYdJJ2G1QT/iY9fvrtXByNocpWPI89IlR+sUxncf1MB7gR86Kct5clzLsFHQLHzJiAKfzPgktidenbSC8zsTuAMSNvuqFrRctt5B6Utu70BPHadtXqI/JdqQcb0dQD63PyIqW5cxvP/wASTTDeA2LD4E/cZrUixhuIcSF9NQ/AKaRHQf1j5/7U/wAQ/Wb7I/8A1pWvNET82K//AI/nTAVeIc7R9r/+ac6MZ9j3Gf0/CoxcJGQPgx/Wo2cDJDREH2vyEffQBKNQ3X/2P3707STnH/l+tU3CkeWRH/1I+GYxUfhf5N/92kMJ8ZcYKEQRAlgdyCpAIHXcfuKz/Fh0BVNXi6pcqpIY+XGrOFDA7Z3nubsr4upmOloUsS2IAkaSBvEnPWOlWLPBh7gxkRkOWgLmQIWZ1Lggbx0mvkoarUqaPVy2Zvmd0qQrsyrbeDoadV2TkqR5iIkZGPfFaHlDjSUKBrUFtDd9UQBGAmKXi+HHh6gfabSVgZJMZWdJMAnUJODkTh1m2yi48aY/lmD7BJgknruo9dXxrdaqkqSphFZtgS4huXFVUPk06AQQdIUk7wIlkOcT7qv2ke3pUn+Y7B32YadYwSNphveBiapLy5lLtaDsBDsGAwdR0qcgdT17b713HXRaclmNxgFVTsZgNk7xJJxuSKuTjhL0OLsLreRYVFGHMbZEk6ts51Ga0rcxFu2xEAkY9T09Nuh9KwnAWz4fiMTqdtKjG0y3uOV2jftRPiCzXEszqKgMdPc9PgPxrK2nbNcUaW1zI6GYecC3ERu2w/KZrG8u45LvB8RcYJbuC6LgYGArXNFvPSCGYQegrScTxXhKbVvSW1BXgtiRIUZAIB339d6BcPYvW/EBtW7QKqCiIkqysZ1OtsAppM6slScda3glWTGWWVeL4i5bsC0xDvc0uWG5BAYLjyxlZI7GrXIbttLgR2UmJ0KDtk9Pj9+Km4C0q6bl2bt14S0jsQ2kQdRO4aDq7Cfk/jOWaUZlt6F/mM2k5xrBEwNBVTKsInUxIU7pJSdsdtYO5lzDh7jgyZfRptqrkA6lIfWR5DI2I82kdqHcra0XuX2tkqUXyppLEY30mFB2n1OQMU3huXNe4gXToUWwHABkF5bSANtZZkLbQVI7ApwHLuJKC2qupcaE8x0o6tdbXnYaRbGsD13qtqqyaTyPVi3EqotlAAsySfKQxLBgYK7n/eat8v5iDcCpb1R5TI9kaJ9/XaYzREcCltSWeWukh0X2WUjSWCxIfSSNSxq09xNVhy9eHLPBgk+aetyAwLRgQsD0ipcV6EP4vl1u+PFWExLxuxVkZZ9SEyTv8MBOA5QhZz4hR0JUyQQJJMr5dwMiZ2GMGtzwVggAW2A1BDB6MM9IIyIzODQG86WybjWgNbhQVTUDcOfKFEZO8x7Xvje3SQUrJufcuuCwi8IFQhwzH2cERtBBzvI60PtXr1m0Ll9w6CPEAQAqJgY76o98nam8v+kVx1urbtM9wPEa5DydhPskgTp+RJMVWT6Spca7avqq2iwQeUmW8x82doUDbEit4JpUzOTTdmk4YowW5YuFlJgjUSpPYg+xvMj4zUNn6RcMjLbuYNxQwDY0ydmIiJzv26YkbyHmthdVuyxJE6UI8rx/TPqdj603/pyzxNw3xcJtne2N0YbqW9DusAjvVSV4EmP4zinsKzva8S0G0FlMxZDEpqkHUBOZyMbjNDeH5ja/mgyULarRWZZSAYLZg5I/KiT8v/g0uPbuMbdxGXzebwnALIQ3RcEEHG01R45V1EWyrWtKtK7AxqKqowBPTptTirdEzltjbAtiw1y6LwUppIgg58uxnv8AGtD4hadZ1E7knJPwodagTEj0BqZH3w2N+vzjPzrrjFROKWpKRYvJ3WB3JP4mmhyO/oZxVdb05BPzP4VxuN0M9Nsj51paFFeg1Z4oCzkxceWUEf05jfuOsGqbuLntyTtm4ce7/ap+F4G5fIPhnTgDUQIUY8omYEdqTgbVpLpNy0fLurgiDtkTk1zwcdNP2/f8nTJSm8YRX8JejH3agfuPSmm2w2dvgSB8c/nWh5rxVu7b1oACmCrkjDECRnyxjb6xoe/KrGjUL8sSIB7HA6gnpJjptVrXVfkqI+p+sl3lvE8N4YF0GSN2OT2gDKihF9jcdtNslZnYnB2JOlomO/eiFrgbVpwXuC4fjjv1IxijvDcTauNA1SM7tjrIGxOJiudayg3Tb/wbPTclwkYy/ZKwBHUE6TBI3iQAQMVWN1k6fFUA/KthzTkTFidbXdRJT+YVIBOyyCABkQSaylxwGKrcLx6gn1EdY29a6tLUU+DCcHEiPFTu3zVR/wCwmuLp2+S4/GlHEJ1JH/Yv5GaaPD/u/wDjH3TWpBftcxAtgrcYaYYkCDBCINOZEAiDGRRGxd1Nda4cNcNtdJy0SYX/AMTP+E0NuXEZUFsaVIInYsZAMIpMmAdxvpopwPgqLYuGWQKQZfUJAPmPlQsMiJMRtXybjFOz04v9kd+5lVUFDGJOPEuEmZM5ChgYzk02xxA8N2uAsxlmS2JOthjzNsQz2wIDRI7GCP0kbSLQt3AFKLaAY4a2Vl9THILZ6yTtJOM9xfM7dsh7TeI5YlSwkIwBOkkANAgMYOCi9sbQhtdFSeDQeKtm14lz6mu4S6qzOQCVKaQdJJUAdBEQQtYezwTXriliPNqcknZQfXYk7fAUY4rgmu+FZtr5iPEcDTJAgDzEg3BucgEQ+DuSPDFFN3xEItkaEhiCyKSIWT5QWEgnEMSQYiqFuRy20IXTEWrQfURBDsGKicA5P3AZjNXk3hKxuXCF8RjpHb6k5ELtJHf0qtx3MgxVXUWkZFdwswYCwgzBMKBvPmJ6yW8I+m+fFkahKBdkIGoQxWNh7S9Y9oGpSt5HvpBbi703LpVAbaXAEAzOkqGLZ1GVJEgEQ5icUnGPDhBpYGbrCCQFmdO+xjY48p6bwtd8EXFuE60fQjT6wSPrRpbHU6fivC3xpVkU6/M7NPtAxiSfJpYaDA6DYzVPCFGVhiyRChjcbSdUYgqg06j0G25+r7qh4ksulWWFVSQqHzBcFg4gQDDe1GSROwqnxnFqrkKwKG2s4jQjGCYDTuFErEdsUvH8ULiaR4a2kAMOLnnBbSWKq4IElmCmSB0waKoHJBG3bQEqE8qEFBpkkmAvmkiCBM5k9zEv4iyDrZZGlADnSA3m2zmBv12ih1zih4nkLkAMIJYL4YIaQSYBMqMdJIzFErvFBfK3m1R/KacAiSWHtE+0f6cnq2xSsdg3ibAa4dMupUAGQYjQcHuDcA2BlW61duWf5cSH8v8ALCmNQIONWchVx30kelU1BZlLzbIukFXBYBQpaQCSckEZBiPSS5OJANtbZDMGgEyBpy6M2T1PSDPQRmZdoEwnxesEaQqB2RQCdnZlyCcwAMwOmDmBY0KyBhChSCoeT5vaJHYxAyf0oVxHNle+pGhl0joc2w0zt0i5PrE9hcvcV4SKyAEYLEGYAJkidUAS2YxBycgXGbzkEDf9IUaUtjSUWGXIRkMEt5hIfrM575mhfOeQLdJBZpXcsnnLKgVWcrAYiATgzJHrRriebWtalCWmVaGA0gGQ+4IUzPXE9q4XgSNOpnJ/lmNzgnU0xp2IO0nvMaeQlyQ0jDfRfhHXiAXVgADDdJgkZ3zBjE1dbn9y3d/loGcgi4sRIUgKxAMBzJWdz5R0Fai3wFsOvhjKykSczqwF3VZ2GRuelVU5Vw1ss6hHLMEMwdMkue8nUAxnuIiK0Xyot5DZXBGOc+Kr+I02gSdLIAVUYKkey0nVvPbvQBrodrjp/U2okbCcbdMn5mtNzThrdxSEKhYHlECW8wYyDnIyc56dRQHIuHBCE6HXSTLeVdyWnqDpbBOOs9bh8iF1Zlq6UpqrKnK+EW5c858gk+pPQTuO81qeO5dNu0i2yLZuqCRPlXGT3nIk96pcs4DNxlaGZ2E7wckkEkiNtpwPWjK3mRmttc1KBPsk6STgArJ2yZBz0FEtZylaeB6WhGEaownH3tVxmU+QMVUCICg6QBviAOlMThdTCBp7he0e7Botznkzo3iGHDCdSgR1BLNsNt9z2BoVbfwySzaYEZ3UtI9Rtq90dK7lJOH4nNKL3Wwlc5yFBt2ybfTWDMkdj0HTP3UL4y5cZvOSxOS0ySfWD07U3gUliNOsL5vKCRA+HU4qu1uCCZ7yZBjeYxTjGMXREpSeWS2r7rICyDE9dsx39c9qvcJN24AAR3afZ9dhI9KpcNcVv/8AQiMgbyT8PTrnp7xf5Vc8PygoNTQxEE6ewA6n3ffRqSpNouCtpMOcPy4KXZdgMFj/AEqCS3bLav3FO5WH1AyMsGA2IG8mNvLB6Dpnap+DvRLLggQCTt8pn99qzfHcxdGYC7bZ2zKiARjPbJxHdSe1cUYynjs7G1E0XMuOdUbw4Y5B0lToEzq0mDjOcRvgVkLtwsTqEk5k6SfeMmobN/zakWHB1SGMz3yYn3mm3ACAdJH77hq9DS0/rVHDqScnZMA5xhh78/Ku8I/VPz/3qBEJYeVjOx1/s0soc6/mRP4VpZDTLnBXnS4QzW3FyJZHUgACLjDSZ1AAjbq23W1wPH69dxlw4Jz/AEAtuW7CXIkKMHfBrq6vndSKx/J3xw0P4u6wNy5eQsA2gIACATpBiJjBUjI9mDihtu4WuumtUCo+q4VlUXKEFSxkaiAoO+rSN5HV1VF3yXLkv8MzG5dfxAqBSSrNknAgzCmFJbI0gkkAQKEDikugBimoLD6ICtbGzqSDFxYEgSGA3ma6up1gh+h/A3Az6CgZrjyQSSAI0hRpGrVGwUSfKMzRS1YKs1p7lpddwq0DV4Z0kgTqEbspifagxsOrqn2iitzS7cuMFQ69AFsuV9liSu4BJZjjuNXeDU3D8VrsIxUh7bFCDhRqDEqcGA0KCMTnFLXUIZct3lZwS6sEIK2yYGsAgNpOLjCJG8QwgnSarpxgNoq3muMyyqCS676CdJC6QZ8uTrEkV1dUpuxPkt8q4SG1S/8ALTWBcaWLAFUIgAFQzTPXIAxhr8aXhUZ1aTpZoCvpBJYtEr1BgnBjqa6upPhDRI/FLBcEN4iKdIX2WBuBm04BM3Q/Y6z0xVazw9wsXEWkKxrZwG0kMIUeyTscwPKemB1dRHhiJ7t0oVVBcYEaVutkHIeBcVmB9necB4xgCThePvOU0wQDDIYGkkwDJGu2TqHmMgj1aaWuo9lAzn6lWRSfDhgoAfQzAwNbEQEXzHMCIPwqf6jIVW8pJ9lssunSfa6kqJn+oEyc11dVqKdf1MJcjbHHtcBiUMqLSqA2psuQDvJ079czOagTmhkhHIywYRJ1ewLgAiDnJyPKZHfq6qenFcCss8LzC60+Y+Uqmn+o+0xYARuYmBEFcTRsXbQKpcJDQdBVi+rDNIbbSB7jJBjMBK6sElvRpFvAUFpRbZEVdII1ksxyToOQRs0yu8nMwahv22U2iJ86lm9oBWySrZ1RBIBP1TPr1dVyf5G94CHBcKrQjhluoCo1QQsgNpgbKARGQR+I6/wrMwHh2yqhvEBghfM0HYk7QMTnvv1dVqTTx+yWrWSrf+jYCKylkDtON1gBtEydzPyFV7nKhckBpEkCRsZn2tOFBn7qWuq/InjIvrirBK8FpMMoJB94ORMjoNMZzsKROGdbmu2oIMQJmPLkzj4e8UldXR9kpLPRmoqwjx9m+V0gjwyAQFEswAnIJlcSY3333oVb4RWx4mkgxk9ZjBmPhneurq0hNrgUoqyLieDurLAK6zM7EH3YMUzhuIcmArEz7IOrPuIMz2rq6uuEntZjKKtBO3wty0wu3LLBARJgQD0Jgyue4HvodzKzbW64UKAGIjPTHeurqnRm5ajvouUUoY7P/9k=');
imgs.push('data:image/jpeg;base64,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');
imgs.push('data:image/jpeg;base64,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');
imgs.push('data:image/jpeg;base64,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');
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
    	center: new kakao.maps.LatLng(33.350701, 126.570667), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  



// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    $(function(){
		//검색결과 유효성 검사
			$("button[name=name1]").click(function(){
				var keyword = document.getElementById('keyword').value;
				 if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        alert('입력해주세요!');
				        return false;
				    }
			});
		});

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
    
}
var positions = []
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
       
        
		
        displayPlaces(data);
   
        
        
        
        
        // 페이지 번호를 표출합니다
      displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
    
}


//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(y,x) {
    var imageSrc = '/jejuana/img/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(45, 45),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(47, 48), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(y, x), // 마커의 위치
            image: markerImage 
        });
    
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}


// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds();
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
		positions.push({title:places[i].address_name,latlng_x:places[i].x,latlng_y:places[i].y});
	}
    
    for (var i=0; i<positions.length; i++){
		//var marker_i = positions[i];
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
    	//marker = addMarker(placePosition, i), 
        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        
        displayMarker(places,i);
	    
        

 
	    bounds.extend(placePosition);
        fragment.appendChild(itemEl);
}

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


//마커에 마커 표시
function displayMarker(places,i) { 
	marker = addMarker(places[i].y,places[i].x);
	
    var overlay = new kakao.maps.CustomOverlay({
        yAnchor: 3,
        position: marker.getPosition()
    });
   
    
    var place_firstname = places[i].address_name.substr(0,12);
    var place_lastname = places[i].address_name.substr(12);
    
    var bk_login = '';
    if ('${logStatus}'!='Y'){
    	bk_login = 'onclick="test1()"'; 	
    }

    var content = document.createElement('div');
    content.classList.add('wrap');
    content.innerHTML =  '<div class="info">' + '<div class="title" style="margin-top:-12px;">' +  places[i].place_name.split('(')[0]+ '</div>';
    
    content.innerHTML += '<div class="body">' + '<div class="img">' +'<img src="'+imgs[i]+'" width="260" height="150" style="margin-top:0px;border:1px solid gray;margin-right:6px">' +'</div>';
	content.innerHTML += '<div class="jibun ellipsis" style="letter-spacing:3px;white-space: normal; margin:6px; font-weight: bold; margin-bottom:26px;">'+ '<div>'+place_firstname+'</div>'+ '<div>'+place_lastname+'</div>'  +'</div>';
	content.innerHTML += '<div class="" style="margin:-35px 88px; padding:8px; font-weight: bold; float:left;">' + '<p style="margin-left:45px;">평점 ★★★★☆ 리뷰'+i+'</p>' + '</div>';
	content.innerHTML += '<div class="wrap_button" style="margin-right:4px;margin-top:-9px;display:-webkit-inline-box;">'+'<form method="get" action="${pageContext.request.contextPath}/bookmarkTest"><input type="hidden" name="book_name" value="'+places[i].place_name.split('(')[0]+'"><input type="hidden" name="book_type" value="'+1+'"><button type="submit" style="color:white;"'+bk_login+'>북마크</button></form>'+'<button><a id="kakao-link-btn" class="kakao"  href="javascript:sendLink(\''  +places[i].place_name.split('(')[0]+','+ place_lastname +'\')" style=" text-decoration: none; color:white;">공유</a></button>'+'<button type="button" ><a href='+places[i].place_url+' style=" text-decoration: none; color:white;">길찾기</a></button></div>';
    
	content.style.cssText = 'background:white;  ';

    
    var closeBtn = document.createElement('button');
    closeBtn.innerHTML = '닫기';
    closeBtn.style.cssText = 'position:absolute; width:35px; height:30px; border:2px solid gray; border-radius:5px;margin-top:-253px;margin-left:-34px';
    
    closeBtn.onclick = function () {
        overlay.setMap(null);
    };
    
    
 
    content.appendChild(closeBtn);
    overlay.setContent(content);

    
    kakao.maps.event.addListener(marker, 'click', function() {
    	
    	removeOverlay();
        overlay.setMap(map);

        
    });

    
    
    overlays.push(overlay);
    

   	
}


function test1(){
	alert("로그인을 해야 합니다!");
	return false
}

// 검색결과 항목을 반환
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<img src="'+imgs[index]+'" width="95px" height="95px" style="object-fit:cover;">' +
	                '<div class="info">' +
	                '   <span>' + places.place_name + '</span>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다

	
	
	// 지도 위에 표시되고 있는 마커,오버레이 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    
	    for ( var i = 0; i < overlays.length; i++ ) {
	        overlays[i].setMap(null);
	    }   
	    markers = [];
	    positions = [];
	    overlays = [];
	    
	}
	
	
	//다른 오버레이 클릭시 기존에 열려있던 오버레이 창을 닫음
	function removeOverlay() {
	    for ( var i = 0; i < overlays.length; i++ ) {
	        overlays[i].setMap(null);
	    }   
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	

	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	
</script>

<script>
//오늘 날짜출력
$(document).ready(function () {

    function convertTime() {
        var now = new Date();


        var month = now.getMonth() + 1;
        var date = now.getDate();

        return month + '월' + date + '일';
    }

    var currentTime = convertTime();
    $('.nowtime').append(currentTime);
});


//제이쿼리사용
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Jeju,kr&appid=3b76d26e08378c9932cafd2be465a64d&units=metric',
function (WeatherResult) {
    //기온출력
    $('.JejuNowtemp').append(WeatherResult.main.temp);
    $('.JejuLowtemp').append(WeatherResult.main.temp_min);
    $('.JejuHightemp').append(WeatherResult.main.temp_max);

    //날씨아이콘출력
    //WeatherResult.weater[0].icon
    var weathericonUrl =
        '<img src= "http://openweathermap.org/img/wn/'
        + WeatherResult.weather[0].icon +
        '.png" alt="' + WeatherResult.weather[0].description + '"'+' style="width:200%; margin-top:-8px;margin-left:50px;"'+'/>'

    $('.JejuIcon').html(weathericonUrl);
});

</script>  

<!-- 관광지 공유기능 -->
<script>
Kakao.init('75c9e1cc14c0f4aab448e8ccbe6b84b2')

function sendLink(title) {
  Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: title,
      description:'(으)로 놀러가자~',
      imageUrl: 'https://a.cdn-hotels.com/gdcs/production85/d946/73f139d8-4c1d-4ef6-97b0-9b2ccf29878a.jpg?impolicy=fcrop&w=1600&h=1066&q=medium',
      link: {
        mobileWebUrl: 'http://localhost:8080/jejuana/test2#',
        webUrl: 'http://localhost:8080/jejuana/test2#'
      }
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845
    }
  })
}
</script>

<script>



window.onload = function() {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
}
</script>