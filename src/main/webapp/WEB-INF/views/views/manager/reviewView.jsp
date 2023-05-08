<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/jejuana/css/reviewView.css">

<div class="screen">
	<div class="category1">
		관리자 페이지
	</div>
	<div class="section">
		<div class="section1">
			<div class="section1_1"><img src="/jejuana/img/post.png" class="section1_1_2"> <p class="section1_1_1">여행목록 관리</p> </div>
			<div class="category2">
				<button class="category2_1" onclick="location.href='commonmanager1'">회원관리</button>
				<button class="category2_1" onclick="location.href='reviewmanager'">게시글 관리</button>
			</div>	
		</div>
		
		<div class="section2">
			<div class="section2_1"> <p class="section2_1_2">여행목록을 관리 할 수 있습니다. </p></div>	
				
				<form method="post" action="/jejuana/manager/reviewUpdateOne" id="upList">
					<div class="container">
					<div class="titleView">문의게시판</div>
					<input type="hidden" value="${vo.nowPage }"/>
					<c:if test="${vo.searchWord!=null }">
						<input type="hidden" value="${vo.searchWord }"/>
						<input type="hidden" value="${vo.searchKey }"/>
					</c:if>
					<ul id="view">
						<li>번호: ${dto.plan_no }</li>
						<li>글쓴이: ${dto.id }</li>
						<li>등록일: ${dto.writedate }</li>
						<li>조회수: ${dto.review_hit }</li>
						<li>제목</li>
						<li style="font-weight:bold;">${dto.review_subject }</li>
						<li>글내용</li>
						<li><p id="s">${dto.review_content }</p></li>
						<c:if test="${dto.complain!=null }">
							<li>신고 사유: ${dto.complain }</li>
						</c:if>
						<li>활성여부:
							<c:if test="${dto.activated == 0}">활성화</c:if>
							<c:if test="${dto.activated == 1}">비활성화</c:if>
						</li>
						<li><input type="submit" value="활성화/비활성화"></li>
					</ul>
					</div>
				</form>
				
			</div>
		</div>
	</div>
					
		