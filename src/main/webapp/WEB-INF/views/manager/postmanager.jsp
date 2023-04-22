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
				<button>게시글관리</button>
				<button>여행기록 관리</button>
				<button>인기게시글 관리</button>
			</div>	
		</div>
		
		<div class="section2" style="width:90%;">
			<div style="background:olive; height:20%;margin-bottom:20px "> 여행목록을 관리할수 있습니다. </div>	
			<span style="font-weight:bold; font-size:20px;margin-left:20px">| 여행목록 검색</span>
				<div style="display:flex; background:orange;height:10%;width:90%;margin:20px;">
					<div style="width:10%; background: aliceblue;">검색어</div>
					<div style="width:100%; margin-top:10px;">
						<select style="height:90%; margin:0px 35px 0 35px;">
						    <option value="">장소</option>
						    <option value="">별점</option>
						    <option value="">활성화</option>
						    <option value="" selected>아이디</option>
						</select>
						<input style="height:90%; width:40%;"placeholder="검색...."/>
					</div>
				
				</div>
					<div style="height:45%;margin-top:40px;">
						<table class="tsearch" style="margin-left:22px">
							<thead>
								<tr>
									<td>선택</td>
									<td>no</td>
									<td>여행기록 이름</td>
									<td>장소</td>
									<td>별점</td>
									<td>등록일시</td>
									<td>저장횟수</td>
									<td>활성화</td>
									<td>등록회원</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								
							</thead>
						</table>		
					</div>
				<div style="display:flex">
					<div style="width:85%;">
						<p style="text-align:center;font-size:20px;">&lt; 1 2 3 4 &gt;</p>
					</div>
					<div>
						<button>활성화/비활성화</button>
					</div>
				</div>
		</div>
		
	</div>

</div>
<footer style="width:100%; height:74px; background:antiquewhite; text-align:center; position:absolute; bottom:0; left:0"><h1>footer</h1></footer>