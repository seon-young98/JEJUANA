<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypageCourse.css"/>

<div class="content_s">

	<div class="courseTitle">북마크(코스)</div>
	<form>
		<div id="acc"><input type="checkbox" id="allCheckC"/> 전체선택</div>
		<div class="container_flex">
			<div class="courseBookmark">
				<ul>
					<li>
						<input type="checkbox" value="" class="chooseDelC1" >
					</li>
					<li>
						<img src="/jejuana/img/review_thumbnail/img01.jpg"/>
						</li>
					<li style="font-size:13px; color:gray; text-align:right;">goguma</li>
					<li style="font-weight:bold;padding-top:5px;">제주도 뚜벅이 여행</li>
					<li>
						<div>
							<hr style="margin:0; width:240px;"/>
						</div>
					</li>
					<li style="font-size:14px;">#제주도#함덕#애월#뚜벅이</li>
					<li style="font-size:14px;">일정: 3박4일</li>
					<li id="jo">
						좋아요: 23
					</li>
					<li>
						<div>
							<div>
								<input class="CourseBtn_view" type="button" value="코스보기"/>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			
		</div>
	
		<div>
			<input type="button" value="선택삭제" class="chooseDelC2"/>
		</div>
	
	</form>
	
</div>

</div>
