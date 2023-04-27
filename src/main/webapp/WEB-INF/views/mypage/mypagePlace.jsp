<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypagePlace.css">

<div class="content_s">

	<div class="courseTitle">북마크(여행지)</div>
	<form>
		<div id="acc">
			<input type="checkbox" id="allCheckC"/> 
			 전체선택
		 </div>
		<div class="container_flex">
			<div class="courseBookmark">
				<ul>
					<li>
						<input type="checkbox" value="" id="chooseDelC" >
					</li>
					<li>
						<img src="/jejuana/review_thumbnail/img01.jpg"/>
					</li>
					<li style="font-weight:bold;">제주동문시장</li>
					<li>
						<div>
							<hr style="margin:0; width:240px;"/>
						</div>
					</li>
					<li style="font-size:14px;">
						<div>먹거리와 생활용품을 판매하는, 제주에서 가장 큰 시장</div>
					</li>
					<li style="font-size:14px;">별점: ★4.6</li>
					<li>
						<input type="button" value="위치보기"/>
					</li>
				</ul>
			</div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			
		</div>
		
		<!-- 삭제버튼 -->
		<div>
			<input type="button" value="선택삭제" id="chooseDelC"/>
		</div>
	
	</form>
	
</div>

</div>
