<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	body{
		overflow:hidden; 
		height:100%;
	}
	.container_find{
		font-family: 'GmarketSansMedium';
		width:100%;
		height:42vh;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.findBox{
		width:40%;
		border:1px solid #ddd;
		border-radius:30px;
		text-align:center;
		padding:2%;
		height:100%;
		margin-top:20%;
	}
	.findBox>h1{
		width:70%;
		border:1px solid gray;
		margin:0 auto;
		margin-bottom:25px;
		padding:20px;
		
	}
	.name_box, .phone_box{
		width:100%;
		margin:0 auto;
		padding-top:14px
	}
	.find_box_size{
		width:70%;
		margin:0 auto;
		margin-bottom:5px
	}
	.find_button{
		width:100%;
	}
	.find_button>input{
		width: 49%;
		height: 50px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
	}
</style>

<script>
$(function(){
	$("#idFindForm").submit(function(){
	 	if($("#name").val()==""){
			alert("이름을 입력해 주세요");
			return false;
		}
	 	if($("#phone_num").val()==""){
			alert("휴대폰 번호를 입력해 주세요");
			return false;
		}
		return true;
	});
});
</script>
 
 <div class="container_find">
	<div class="findBox">
			<h1>아이디 찾기</h1>
			<!-- 아이디 찾기 폼 -->
			<form id="idFindForm" action="findIdResult" method = "POST">
				<!-- 이름 -->
				<div class="name_box">
					<p class="find_box_size" align="left">이름</p>	
					<input type="text" name="name" id="name" placeholder="이름을 입력해 주세요."  class="find_box_size"/>
				</div>
				<!-- 전화번호 -->
				<div class="phone_box">
					<p class="find_box_size" align="left">전화번호</p>
					<input type="text" name="phone_num" id="phone_num" placeholder="전화번호를 입력해 주세요. ('-' 제외)" maxlength="11"  class="find_box_size"/>
				</div>
				<!-- 찾기/이전으로 버튼 -->
				<div class="find_button">
					<input type="submit" value="찾기">
					<input type="button" value="이전으로" onClick="history.back()">
				</div>
			</form>
		</div>
	</div>