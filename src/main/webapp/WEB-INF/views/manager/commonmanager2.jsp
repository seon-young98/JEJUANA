<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<script>
//변수
let ojId;
let ojPwd;
let ojPwd2;
let ojUsername;
let ojUsernickname;
let ojphone_num;
let ojEmail;
let ojEmail2;
let ojInformation;
//아이디 조건변수
let idCondition = /^[a-z0-9_]{5,20}$/
//비밀번호 조건변수
let pwdCondition = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
//닉네임 조건변수
let nickCondition = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]{2,10}$/
//이메일 @앞부분 조건변수
let emailCondition = /^[a-zA-Z0-9._%+-]+$/
//이메일 @뒷부분 조건변수
let emailCondition2 = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
//휴대폰 조건변수
let telCondition = /^01(0|1|6|7|8|9)[0-9]{7,8}/
	$(function(){
		ojId = document.getElementById("id");
		ojPwd = document.getElementById("password");
		ojPwd2 = document.getElementById("password2");
		ojUsername = document.getElementById("username");
		ojUsernickname = document.getElementById("usernickname");
		ojphone_num = document.getElementById("phone_num");
		ojEmail = document.getElementById("email");
		ojEmail2 = document.getElementById("email2");
		ojInformation = document.getElementById("information");
		
		//아이디 중복검사
		$("input[value=중복검사]").click(function(){
			//아이디 검사
			if($("#id").val()!=""){
				if( !idCondition.test($("#id").val()) ){
					alert("아이디는 5~20자의 영소문자,숫자와 특수문자(_)만 사용가능 합니다.");
					ojId.focus();
					return false;			
				}else{
					//팝업
					window.open("idCheck?id="+$("#id").val(),"chk","width=550,height=230");
				}
			}else{
				alert("아이디를 입력 후 중복검사하세요.");
				ojId.focus();
				return false;
			}	
		});
	});
function joinform_check(){
	//유효성 검사
		//아이디
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			ojId.focus();
			return false;
		};
		//휴대폰 번호 확인
		if($("#phone_num").val()==""){
			alert("휴대폰번호를 입력하세요.");
			return false;
		}
		//이름
		if($("#name").val()==""){
			alert("이름을 입력하세요.");
			ojUsername.focus();
			return false;
		}
		//닉네임
		if($("#nickname").val()==""){
			alert("닉네임을 입력하세요.");
			ojUsernickname.focus();
			return false;
		}
		//닉네임 검사
		if(!nickCondition.test($("#nickname").val())){
			alert("닉네임은 영대소문자, 특수기호 필수포함, 연속되는 숫자 사용금지, 공백문자 불가의 조건으로 생성가능합니다.");
			ojUsernickname.focus();
			return false;
		}
		//이메일
		if($("#email").val()==""){
			alert("이메일을 입력하세요.");
			ojEmail.focus();
			return false;
		}
		//이메일 검사
		if(!emailCondition.test($("#email").val())){
			alert("올바른 이메일을 입력해주세요.");
			ojEmail.focus();
			return false;
		}
		
		return true;
	
}
</script>
<div>
	<div class="category1">
		<button>회원관리</button>
		<button>게시글관리</button>
		<button>추천 코스 관리</button>
		<button>공지사항 관리</button>
	</div>
	<div class="section">
		<div class="section1">
			<div class="section1_1"> 여행목록 관리 </div>
			<div class="category2">
				<button>회원관리</button>
			</div>	
		</div>
		
		<form method="post" action="commonEditOk">
			<div class="section2">
				<div class="section2_1"> 현재 생성되어 있는 회원정보를 확인 할수 있습니다. </div>	
				<span>| 회원검색</span>					
						<div>
						 
							<table class="tsearch">
								<tr>
									<td>번호</td>
									<td><input type="hidden" name="common_no" id="common_no" value="${dto.common_no }">${dto.common_no }</td>
								</tr>
								<tr>	
									<td>아이디</td>
									<td><input type="text" name="id" id="id" value="${dto.id }"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" id="name" value="${dto.name }"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" id="email" value="${dto.email }"></td>
								</tr>
								<tr>
									<td>핸드폰</td>
									<td><input type="text" name="phone_num" id="phone_num" value="${dto.phone_num }"></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" name="nickname" id="nickname" value="${dto.nickname }"></td>
								</tr>
								<tr>
									<td>회원분류</td>
									<td>
										<c:if test="${dto.member_type == 0}">일반회원</c:if>
										<c:if test="${dto.member_type == 1}">관리자</c:if>
										<c:if test="${dto.member_type == 2}">정지회원</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div style="width:50%;">
							<input type="submit" value="정보수정"/>
						</div>
					
			</div>
		</form>
	</div>

</div>
<footer><h1>footer</h1></footer>
<link rel="stylesheet" href="/jejuana/css/commonmanager2.css"/>