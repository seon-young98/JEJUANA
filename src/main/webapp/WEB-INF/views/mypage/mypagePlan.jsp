<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<style>
	.planTitle{
		width:18%;
		border:1px solid navy;
		font-size:1.5em;
		margin-top:20px;
		margin-left:20px;
		padding:10px;
		text-align:center;
	}
	#allCheckP{
		margin-left:20px;
		margin-top:10px;
	}
	.planList{
		width:90%;
		border:1px solid navy;
		margin:25px auto;
		height:100px;
		overflow:hidden;
	}
	.planList li{
		float:left;
	}
	.planList li:nth-child(1){
		margin-top:45px;
		margin-left:20px;
	}
	.planList div{
		margin-left:20px;
		margin-top:18px;
		border:1px solid navy;
		width:180px;
		padding:15px 20px;
		text-align:center;
	}
	.planList li:nth-child(n+3){
		margin:30px 15px;
		height:40px;
		line-height:40px;
	}
	.planList li:nth-child(3){
		width:25%;
		white-space:nowrap;
		overflow: hidden;
    	text-overflow: ellipsis;
	}
	#bold1{
		font-weight:bold;
	}
	#acp{
		margin-top:20px;
		margin-left:55px;
	}
	.pagingDivP{
		width:20%;
		margin:0 auto;
	}
	.pagingDivP li{
		float:left;
		padding:10px 20px;
	}
	#chooseDelP{
		margin-left:55px;
	}
</style>

<script>
	$(function(){
		
		//전체 선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능 구현
		$("#allCheckP").click(function(){
			$(".planList input[name=noPList]").prop("checked",$("#allCheckP").prop("checked"))
		});
		
		//선택삭제 버튼을 클릭하면
		$("#chooseDelP").click(function(){
			//최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			
			$(".planList input[name=noPList]").each(function(idx, obj){
				if(obj.checked){ //$(obj).prop('checked')
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'개의 게시글을 삭제하시겠습니까?')){
					$("#delPList").submit();
				}
			}else{
				alert("삭제할 게시글이 없습니다.")
			}
		});
		
	});
	
</script>

<div class="content_s">
		<div class="planTitle">나의 일정 관리</div>
		<form method="post" action="/jejuana/mypage/mypagePlanMultiDel?nowPage=${vo.nowPage }" id="delPList">
		<div id="acp"><input type="checkbox" id="allCheckP"/> 전체선택</div>
		<c:forEach var="pDTO" items="${list }">
			<div class="planList">
				<ul>
					<li><input type="checkbox" name="noPList" value="${pDTO.plan_no }"/></li>
					<c:if test="${pDTO.d_day>0 }">
					<li><div style="font-size:2em; font-weight:bold;">D-${pDTO.d_day }</div></li>
					</c:if>
					<c:if test="${pDTO.review_date>=0 && pDTO.d_day<=0 }">
					<li><div style="font-size:2em; font-weight:bold;">D-Day</div></li>
					</c:if>
					<c:if test="${pDTO.review_date<0 }">
					<li><div style="font-size:2em; font-weight:bold;">End</div></li>
					</c:if>
					<li>${pDTO.plan_name }</li>
					<li>날짜: ${pDTO.start_date} ~ ${pDTO.end_date}</li>
					<li><input type="button" value="수정" id="planChahge"/></li>
					<c:if test="${pDTO.review_date>0 }">
					<li><input type="button" value="리뷰작성" id="planReview" disabled/></li>
					</c:if>
					<c:if test="${pDTO.review_date<=0 }">
					<li><input type="button" value="리뷰작성" id="planReview"/></li>
					</c:if>
				</ul>		
			</div>
		</c:forEach>
		<div>
			<input type="button" value="선택삭제" id="chooseDelP"/>
		</div>
		</form>
		<!-- 페이징 -->
		<div class="pagingDivP">
			<ul>
				<c:if test="${vo.nowPage==1 }">
					<li><</li>
				</c:if>
				<c:if test="${vo.nowPage>1 }">
					<li><a href="mypagePlan?nowPage=${vo.nowPage-1 }"><</a></li>
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
					<a href="mypagePlan?nowPage=${p }">${p }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지 -->
			<c:if test="${vo.nowPage<vo.totalPage }"> <!-- 다음 페이지가 있을 때 -->
				<li><a href="mypagePlan?nowPage=${vo.nowPage+1 }">></a></li>	
			</c:if>	
			<c:if test="${vo.nowPage==vo.totalPage }"> <!-- 현재 페이지가 마지막 페이지일 때 -->
				<li>></li>
			</c:if>
			</ul>
		</div>
</div>	

</div>

</body>
</html>