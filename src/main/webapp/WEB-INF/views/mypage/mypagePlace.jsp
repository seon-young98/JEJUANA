<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypagePlace.css">

<div class="content_s">

	<div class="courseTitle">북마크(여행지)</div>
	<form>
		<div id="acc">
			<input type="checkbox" id="allCheckC"/> 전체선택
		 </div>
		<div class="container_flex">
			<div class="courseBookmark">
				<ul>
					<li>
						<input type="checkbox" value="" class="chooseDelC1" >
						<div class="chooseDel1_txt">선택</div>
					</li>
					<li>
						<img src="/jejuana/img/review_thumbnail/img01.jpg"/>
					</li>
					<li style="font-weight:bold;">제주동문시장</li>
					<li>
						<div>
							<hr style="margin:0; width:240px;"/>
						</div>
					</li>
					<li class="place_explanation">
						<div>먹거리와 생활용품을 판매하는, 제주에서 가장 큰 시장</div>
					</li>
						<li style="font-size:14px;">
							별점 :  
							<i class="fa-solid fa-star" style="color: #f37321;"></i>
							4.6
						</li>
					<li>
						<input class="CourseBtn_view" type="button" value="위치보기"/>
					</li>
				</ul>
			</div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			
		</div>
		
		<!-- 삭제버튼 -->
		<div>
			<input type="button" value="선택삭제" class="chooseDelC2"/>
		</div>
	
	</form>
	
</div>

</div>
