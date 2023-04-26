<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.container{
		margin:0 auto;
		width:60%;
	}
	.title{
		font-size:35px;
		padding-top:50px;
	}
	.searchDiv{
		padding:10px;
		text-align:right;
	}
	.noticeList li{
		float:left;
		width:11%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
	}
	.noticeList li:nth-child(5n+2){
		width:50%;
		/*밑줄임 표시하기*/
		white-space:nowrap; /*줄바꾸지 않음*/
		overflow:hidden; /*넘치는 문자 숨기기*/
		text-overflow:ellipsis;/*넘치는 데이터가 있을 때 밑줄임 표시하기*/
	}
	.pagingDivP{
		width:30%;
		margin:0 auto;
	}
	.pagingDivP li{
		float:left;
		padding:10px 20px;
	}
	a{
		text-decoration:none;
		color:black;
	}
	.noticeList img{
		width:21px;
		height:21px;
		margin-top:9px;
		float:left;
	}
</style>

<div class="container">
	<div class="title">문의게시판</div>
	
	<!-- 검색 -->
	<div class="searchDiv">
		<form method="get" id="searchForm" action="boardList">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="username">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="Search"/>
		</form>
	</div>
	
	<form>
		<!-- 페이지번호, 검색키, 검색어 -->
		<input type="hidden" name="nowPage" value=""/>
		<c:if test="${vo.searchWord!=null}">
			<input type="hidden" name="searchKey" value=""/>
			<input type="hidden" name="searchWord" value=""/>
		</c:if>
		<ul class="noticeList">
			<li>no</li>
			<li>제목</li>
			<li>작성자</li>
			<li>날짜</li>
			<li>조회수</li>
			
		<c:forEach var="gDTO" items="${gList }">
			<li style="font-weight:bold;">공지</li>
			<li style="font-weight:bold;">${gDTO.notice_subject }</li>
			<li>${gDTO.nickname }</li>
			<li>${gDTO.notice_date }</li>
			<li>${gDTO.notice_hit }</li>
		</c:forEach>
		
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord}"/>
		
		<c:forEach var="dto" items="${list }">
			<li>${recordNum }</li>
			<li><c:choose>
			<c:when test="${dto.secretKey==true}"><img alt="secret" src="/jejuana/img/secret.png"><p>${dto.notice_subject }</p></c:when>
			<c:otherwise>${dto.notice_subject }</c:otherwise>
			</c:choose></li>
			<li>${dto.id }</li>
			<li>${dto.notice_date }</li>
			<li>${dto.notice_hit }</li>
			
		<c:set var="recordNum" value="${recordNum-1 }"/>
		</c:forEach>
			
		</ul>
	</form>
	
	<!-- 페이징 -->
		<div class="pagingDivP">
			<ul>
				<c:if test="${vo.nowPage==1 }">
					<li><</li>
				</c:if>
				<c:if test="${vo.nowPage>1 }">
					<li><a href="noticeList?nowPage=${vo.nowPage-1 }"><</a></li>
				</c:if>
				
				<!-- 페이지 번호 -->
				<c:forEach var="p" begin="${vo.startPageNum }" end="${vo.startPageNum+vo.onePageNumCount-1}">
				<c:if test="${p <= vo.totalPage }">	
					<c:if test="${p==vo.nowPage }">
						<li style="font-weight:bold;">
					</c:if>
					<c:if test="${p!=vo.nowPage }">
						<li>
					</c:if>
					<a href="noticeList?nowPage=${p }">${p }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지 -->
			<c:if test="${vo.nowPage<vo.totalPage }"> <!-- 다음 페이지가 있을 때 -->
				<li><a href="noticeList?nowPage=${vo.nowPage+1 }">></a></li>	
			</c:if>	
			<c:if test="${vo.nowPage==vo.totalPage }"> <!-- 현재 페이지가 마지막 페이지일 때 -->
				<li>></li>
			</c:if>
			</ul>
		</div>
</div>


</body>
</html>