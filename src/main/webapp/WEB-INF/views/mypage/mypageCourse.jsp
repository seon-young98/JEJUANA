<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<style>
	.container_flex{
		float:left;
		margin-top:30px;
		width:100%;
		display:flex;
		flex-wrap:wrap;
	}
	#bold3{
		font-weight:bold;
	}
	.courseBookmark{
		margin:10px 11px 10px 10px;
		width:23%;
		height:270px;
		background:#F5F5F5;
		border-radius:4px;
		display:flex;	
	}
	.courseTitle{
		width:18%;
		border:1px solid navy;
		font-size:1.5em;
		margin-top:20px;
		margin-left:20px;
		padding:10px;
		text-align:center;
	}
	#acc{
		margin-top:20px;
		margin-left:20px;
	}
	.courseBookmark li{
		margin: 5px 10px 0px;
		width:90%
	}
	.courseBookmark img{
		width:100%;
		height:120px;
		margin:5px 0px 1px;
	}
	.courseBookmark li:nth-child(4n){
		white-space:nowrap;
		overflow: hidden;
    	text-overflow: ellipsis;
	}
	.courseBookmark li:nth-child(5n){
		white-space:nowrap;
		overflow: hidden;
    	text-overflow: ellipsis;
	}
	#chooseDelC{
		margin-left:10px;
	}
	#jo{
		float:right;
		font-size:14px;
		padding-top:5px;
	}
</style>

<script>
</script>

<div class="content_s">

	<div class="courseTitle">북마크(코스)</div>
	<form>
		<div id="acc"><input type="checkbox" id="allCheckC"/> 전체선택</div>
		<div class="container_flex">
			<div class="courseBookmark">
				<ul>
					<li><input type="checkbox" value="" id="chooseDelC" ></li>
					<li><img src="/jejuana/review_thumbnail/img01.jpg"/></li>
					<li style="font-size:13px; color:gray; text-align:right;">goguma</li>
					<li style="font-weight:bold;">제주도 뚜벅이 여행</li>
					<li><div><hr style="margin:0; width:240px;"/></div></li>
					<li style="font-size:14px;">#제주도#함덕#애월#뚜벅이</li>
					<li style="font-size:14px;">일정: 3박4일</li>
					<li><div>
						<div style="float:left">
							<input type="button" value="코스보기"/>
						</div>
						<div id="jo">
							좋아요: 23
						</div>
					</div></li>
				</ul>
			</div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			<div class="courseBookmark"></div>
			

		</div>
	
	<div>
			<input type="button" value="선택삭제" id="chooseDelC"/>
	</div>
	
	</form>
	
</div>

</div>

</body>
</html>