<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>

<style>
	.content_s{
		height:500px;
	}
	.userTitle{
		width:18%;
		border:1px solid navy;
		font-size:1.5em;
		margin-top:20px;
		margin-left:20px;
		padding:10px;
		text-align:center;
	}
	.content_s li{
		float:left;
		margin-top:180px;
		width:30%;
	}
	#bold5{
		font-weight:bold;
	}
	.content_s p{
		display:inline-block;
	 	width:40%;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	padding:6px;
	}
</style>
<script>
	$(function(){
		
		$("#pwdCheck").submit(function(){
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#pwdCheck").attr("action", "mypageUser")
			
		});
		
	});
</script>
<div class="content_s">
	<div class="userTitle">회원정보수정</div>
	<form method="post" id="pwdCheck">
		<ul>
			<li style="margin-left:20px;"><p>비밀번호 확인</p> <input type="password" name="password" id="password"/></li>
			<li><input type="submit" value="확인" style="padding:3.5px 15px;"/></li>
		</ul>
	</form>
</div>




</div>

</body>
</html>