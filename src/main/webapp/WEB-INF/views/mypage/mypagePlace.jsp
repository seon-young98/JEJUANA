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
	#bold4{
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
		
		overflow: hidden;
    	text-overflow: ellipsis;
	}
	#chooseDelC{
		margin-left:10px;
	}
	
</style>

<script>
</script>

<div class="content_s">

	<div class="courseTitle">북마크(여행지)</div>
	<form>
		<div id="acc"><input type="checkbox" id="allCheckC"/> 전체선택</div>
		<div class="container_flex">
			<div class="courseBookmark">
				<ul>
					<li><input type="checkbox" value="" id="chooseDelC" ></li>
					<li><img src="/jejuana/review_thumbnail/img01.jpg"/></li>
					<li style="font-weight:bold;">제주동문시장</li>
					<li><div><hr style="margin:0; width:240px;"/></div></li>
					<li style="font-size:14px;">
					<div>먹거리와 생활용품을 판매하는, 제주에서 가장 큰 시장</div>
					</li>
					<li style="font-size:14px;">별점: ★4.6</li>
					<li><input type="button" value="위치보기"/></li>
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