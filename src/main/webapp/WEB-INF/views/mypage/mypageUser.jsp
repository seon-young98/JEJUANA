<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<style>
	.userTitle{
		width:18%;
		border:1px solid navy;
		font-size:1.5em;
		margin-top:20px;
		margin-left:20px;
		padding:10px;
		text-align:center;
	}
	#bold5{
		font-weight:bold;
	}
	.join_inputBox{ 
	 	display:inline-block;
	 	width:42%;
	 	float:left;
	 	margin:50px 20px;
	 	padding-left:50px;
	}
	.join_inputBox>div{
	 	width:100%;
	 	float:left;
	 	margin-left:14px;
	 	margin-bottom:20px;
	 }
	 .join_inputBox p{
	 	display:inline-block;
	 	width:50%;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	padding:6px;	
	 }
	 .join_inputBox input{
	 	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
	 }
	 .userButton{
	 	float:left;
	 	margin:20px -153px;
	 }
	 .userButton input{
	 	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
	 }
	 
	#modalC {
  	   width: 100%;
       height: 100%;
       position: absolute;
       left: 0;
       top: 0;
       display: none;
       flex-direction: column;
       align-items: center;
       justify-content: center;
	}
	.modal-window {
    	background: gray;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 450px;
        height: 450px;
        position: relative;
        top: -85px;
        left:85px;
        padding: 10px;
    }
    #p1{
    	margin-top:115px;
    	text-align:center;
    	font-size:21px;
    	font-weight:bold;
    }
    #p2{
    	text-align:center;	
    }
    #pwdC{
    	margin-top:20px;
    	width:250px;
    }
    .btnC{
    	text-align:center;
    	margin-top:20px;
    }
    .btnC input{
    	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
    }
    .close-area{
    	padding-top:10px;
    	padding-left:400px;
    	font-weight:bold;
    }
</style>

<div class="content_s">
	<div class="userTitle">회원정보수정</div>
	
	<form>
		<div>
			<div class="join_inputBox">
				<div>
					<p>아이디</p>
					<input type="text" name="id" id="id" readonly/>
				</div>
				<div>
					<p>비밀번호</p>
					<input type="password" name="password" id="password" minlength="12" maxlength="20" placeholder="비밀번호를 입력해주세요."/>
				</div>
				<div>
					<p>이름</p>
					<input type="text" name="name" id="username" readonly/><br>
				</div>
				<div style="width:200%">
					<p style="width:25%">이메일</p>
					<input type="text" name="email" id="email"> @
					<input type="text" name="email2" id="email2" placeholder="직접입력">
					<select class="selectBox1" name="email2">
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>nate.com</option>
						<option>google.com</option>
					</select>
				</div>
			</div>
			
			<div class="join_inputBox">
				<div>
					<p>닉네임</p>
					<input type="text" name="nickname" id="usernickname" minlength="2" maxlength="10" placeholder="닉네임을 입력해주세요.">
				</div>
				<div>
					<p>휴대전화</p>
					<input type="text" name="tel" id="tel" placeholder="-를 제외하고 입력하세요.">
				</div>
				<div>
					<input type="text" name="telNum" id="telNum" placeholder="인증번호를 입력해주세요.">
					<input type="button" name="telNumGet" id="telNumGet" value="인증번호 받기">
				</div>
			</div>
		</div>	
		<div class="userButton">
			<input type="button" value="수정하기" id="userChange"/>
			<input type="button" value="탈퇴하기" id="userDelete"/>
		</div>
	</form>
</div>	
	
	<div id="modalC" class="modal-overlay">
		<div class="modal-window">
			<form>
				<div class="close-area">X</div>
				<div class="content-modal"> 
					<p id="p1">정말 탈퇴하시겠습니까?</p><br/>
					<p id="p2">탈퇴하시려면 비밀번호를 입력해주세요.</p>
				</div>
				<div style="text-align:center">
					<input type="password" name="password" id="pwdC"/>
				</div>
				<div class="btnC">
					<input type="submit" value="탈퇴하기"/>
				</div>
			</form>
		</div>
	</div>
	



</div>

<script>
	const modal = document.getElementById("modalC")
	const btnModal = document.getElementById("userDelete")
	btnModal.addEventListener("click", e => {
	    modal.style.display = "flex"
	})
	
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	})
</script>

</body>
</html>