<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.section{
	display: flex;
	/* display: inline-flex; */
}

.category1 button{
	width:10%;
	height:50%;
	letter-spacing:2px;
	margin-top:50px
}

.category2 button{
	width:100%;
	height:50px;
}

.tsearch td{ border:1px solid black; }
table {border-collapse: collapse; width:90%; height:90%}

</style>
<div class="screen" style="width:100%; height:1100px; background:green;position:absolute;">
	<div class="category1" style="width:100%;height:12%; background:red;margin-top:55px">
		<button>회원관리</button>
		<button>게시글관리</button>
		<button>추천 코스 관리</button>
		<button>공지사항 관리</button>
	</div>
	<div class="section" style="width:100%;height:70%; background:white;">
		<div class="section1" style="width:10%;background:black;">
			<div style="background:white; height:20%; "> 여행목록 관리 </div>
			<div class="category2">
				<button>회원관리</button>
			</div>	
		</div>
		
		<div class="section2" style="width:90%;">
			<div style="background:olive; height:20%;margin-bottom:20px "> 현재 생성되어 있는 회원정보를 확인 할수 있습니다. </div>	
			<span style="font-weight:bold; font-size:20px;margin-left:20px">| 회원검색</span>					
				<div style="display:flex">
					<div style="width:50%;">
						<table style="width:30%;">
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
							<tr><td>아이디</td><td> hong</td></tr>
						</table>
					</div>
					<div style="width:50%;">
						<button>수정</button>
						<button>취소</button>
					</div>
				</div>
		</div>
		
	</div>

</div>
<footer style="width:100%; height:74px; background:antiquewhite; text-align:center; position:absolute; bottom:0; left:0"><h1>footer</h1></footer>