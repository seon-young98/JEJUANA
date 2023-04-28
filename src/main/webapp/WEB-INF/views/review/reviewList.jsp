<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/803f3553c2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/jejuana/css/review.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<script>
$(function(){
	$("#searchForm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요");
			return false;
		}
		return true;
	});
});
</script>
<div class="review_header">
	<div class="page_feature">
		<p class="topic">여행기록</p><br>
		<p class="description">다양한 여행 이야기를 만나 보세요</p>
	</div>
	<div class="search">
		<form method="get" id="searchForm" action="reviewList">
			<select name="searchKey">
				<option value="review_subject">제목</option>
				<option value="nickname">닉네임</option>
				<option value="tag">태그</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="검색" style="background: transparent; border:none;"/>
		</form>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br>
 
<div class="best_list">
	<div style="font-size:20pt; text-align:center; margin-bottom:1%;">BEST</div>
 	<swiper-container  class="mySwiper"  pagination="true" pagination-clickable="true" space-between="30" slides-per-view="3">
    	<c:forEach var="bDTO" items="${best }">
			<swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">${bDTO.tag }</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">${bDTO.joayo_hit }</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub">
			  		<a href="reviewView?plan_no=${bDTO.plan_no }">${bDTO.review_subject }</a>
		  		</div>
			  	<div class="li_id">by ${bDTO.nickname }</div>
		  </swiper-slide>
		</c:forEach>
		<swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">서쪽/홀로</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">999</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">제주도 좋아</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">뚜벅이/버스여행/식도락</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">955</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">제주도 좋아</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">식도락</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">911</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">제주도 좋아</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">가족/힐링</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">779</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">제주도 좋아</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">서쪽/홀로</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa"><i class="fa-solid fa-heart" style="color: #d11a1a;"></i></dt>
		    			<dt class="dt_cnt">545</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">제주도 좋아</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
 	</swiper-container>
</div> 
<hr>	
<div class="reviewBox">
	<div class="review_list">
		<c:forEach var="rDTO" items="${list }">
			<div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="${rDTO.thumbnail }">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">${rDTO.tag }</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">${rDTO.review_subject }</a></li>
					<li class="li_id">by ${rDTO.nickname }</li>
					<li>
						<i class="fa-solid fa-heart" style="color: #d11a1a;"></i> ${rDTO.joayo_hit }
					</li>
					<li class="review_hit">
						<img src="../img/hit.png" class="hitImg">
						 ${rDTO.review_hit }
					 </li>
					<li class="review_date">${rDTO.writedate }</li>
				</ul>
		  </div>
		</c:forEach>
		<div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="${rDTO.thumbnail }">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">동쪽/식도락/힐링</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">제주도 짱</a></li>
					<li class="li_id">by 고구마</li>
					<li>
						<i class="fa-solid fa-heart" style="color: #d11a1a;"></i> 34
					</li>
					<li class="review_hit">
						<img src="../img/hit.png" class="hitImg">
						 56
					 </li>
					<li class="review_date">2023-04-21</li>
				</ul>
		  </div>
	</div>
</div>