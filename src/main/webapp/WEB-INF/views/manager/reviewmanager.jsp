<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/jejuana/css/reviewmanager.css">

<div class="screen">
	<div class="category1">
		<button>회원관리</button>
		<button>게시글관리</button>
	</div>
	<div class="section">
		<div class="section1">
			<div class="section1_1"> 여행목록 관리 </div>
			<div class="category2">
				<button>게시글관리</button>
				<button>여행기록 관리</button>
			</div>	
		</div>
		
		<div class="section2">
			<div class="section2_1"> 여행목록을 관리할수 있습니다. </div>	
			<span>| 여행목록 검색</span>
				<div class="section2_2">
					<div class="section2_3">검색어</div>
					<div class="section2_4">
					<form method="get" id="searchForm" action="reviewmanager">
						<select id="searchKey" name="searchKey">
						    <option value="review_subject" selected>제목</option>
						    <option value="activated">활성화</option>
						    <option value="r.id">아이디</option>
						</select>
							<input type="text" name="searchWord" id="searchWord"placeholder="검색...."/>
							<input type="submit" style="margin-left:35px;" value="검색"/>
						</form>
					</div>
				</div>
				
				<form method="post" action="/jejuana/manager/reviewUpdate" id="upList">
					<div class="section3">
						<table id="tb" class="tsearch">
							<thead>
								<tr>
									<td><input type="checkbox" id="allCheck"></td>
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>조회수</td>
									<td>등록일시</td>
									<td>ip</td>
									<td>활성여부</td>
								</tr>
							<c:forEach var="rDTO" items="${list }">
								<tr>
									<td><input type="checkbox" name="noList" value="${rDTO.plan_no }"/></td>
									<td>${rDTO.plan_no }</td>
									<td>${rDTO.review_subject }</td>
									<td>${rDTO.id }</td>
									<td>${rDTO.review_hit }</td>
									<td>${rDTO.writedate }</td>
									<td>${rDTO.ip }</td>
									<td>
										<c:if test="${rDTO.activated == 0}">활성화</c:if>
										<c:if test="${rDTO.activated == 1}">비활성화</c:if>
									</td>
								</tr>
							</c:forEach>
							</thead>
						</table>		
					</div>
				</form>
					
			<div class="searchselect">
					<ul>
						<c:if test="${vo.nowPage==1 }">
							<li>&lt;</li>
						</c:if>
						<c:if test="${vo.nowPage>1 }">
							<li><a href="reviewmanager?nowPage=${vo.nowPage-1} <c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&lt;</a></li>
						</c:if>
				
						<c:forEach var="p" begin="${vo.startPageNum }" end="${vo.startPageNum+vo.onePageNumCount-1 }">
							<c:if test="${p<=vo.totalPage }">
								<c:if test="${p==vo.nowPage }">
									<li>
								</c:if>	
								
								<c:if test="${p!=vo.nowPage }">
									<li>
								</c:if>	
									<a href="reviewmanager?nowPage=${p}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p} </a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${vo.nowPage<vo.totalPage }">
							<li><a href="reviewmanager?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&gt;</a></li>
						</c:if>
						<c:if test="${vo.nowPage==vo.totalPage }">
							<li>&gt;</li>
						</c:if>
					</ul>
					
				</div>
					
				<div class="scection4">
						<input type="button" value="활성화/비활성화" id="aupdate"/>
				</div>
		</div>
		
	</div>

</div>
<footer style="width:100%; height:74px; background:antiquewhite; text-align:center; position:fixed; bottom:0; left:0"><h1>footer</h1></footer>


<script>
$(function(){
	$("#searchForm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요!");
			return false;
		}
		return true;
	});
	
	//---- 전체선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능구현
	$("#allCheck").click(function(){
		$(".tsearch input[name=noList]").prop("checked",$("#allCheck").prop("checked"))
	});
	
	//선택삭제 버튼 클릭하면
	$("#aupdate").click(function(){
		//최소 1개이상 삭제를 선택했을때....
		
		var checkCount = 0;
		$(".tsearch input[name=noList]").each(function(idx, obj){
			if(obj.checked){	//obj.prop('checked')
				checkCount++;
			}
			
		});
		
		if(checkCount>0){
			if(confirm(checkCount+'개의 글을 활성화/비활성화 하시겠습니까?')){
				$("#upList").submit();		
			}
		}else{
			alert("글이 선택되지 않았습니다");
		}
	});
});
</script>