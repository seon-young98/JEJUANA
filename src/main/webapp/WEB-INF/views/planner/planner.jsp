<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e918783759197bca10fffa91fc3e5"></script>
<link href="<%=request.getContextPath()%>/css/planner.css" rel="stylesheet">
<script>
    $(function () {
        // 저장 눌렀을 때 플랜 이름 있는지 확인
        $("#planner_Saver").submit(function () {
            if ($("#plan_name").val() === "") {
                alert("플랜 이름을 작성해주세요");
                return false;
            }

        });


        let start = {}; // 시작날짜를 연/월/일로 나눠서 담을 배열
        let startdate;  // 시작날짜를 담을 Date 객체
        let end = {};   // 종료날짜를 연/월/일로 나눠서 담을 배열
        let enddate;    // 종료 날짜를 담을 Date 객체
        let days = 0;   // 두 날짜의 차이를 담을 변수
        $("#start_date").change(function () { // 시작날짜의 변화가 생기면
            $("#schedule").empty(); // 먼저 초기화하고
            start = $("#start_date").val().split('-');  // 선택한 날짜를 '-' 를 기준으로 나눠서 배열에 넣고
            startdate = new Date(start[0], start[1], start[2]);// 그걸 다시 Data 객체로 만듬
            if (enddate != null) {// 만약 종료일이 선택되어있으면
                days = (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24);// 두 날짜의 차이를 구해서
                $("#days").val(days);
                showSchedule(days);// 일정을 선택할수있는 함수에 넣는다.
            }
        });
        $("#end_date").change(function () { // 시작일과 동일한 방식
            $("#schedule").empty();

            end = $("#end_date").val().split('-');
            enddate = new Date(end[0], end[1], end[2]);
            if (startdate != null) {
                days = (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24);
                $("#days").val(days);
                showSchedule(days);
            }

        });

        // 일정을 작성했는데 날짜를 변경할 경우 예) 6월 3일부터 6월 9일(6박7일)까지 일정에서
        // 5월 3일에서 5월 5일로(2박3일) 변경 시 day1, day2, day3은 작성된 채로 남겨두고
        // day4~day7까지만 삭제되게끔 변경해야함!!!!!!!!!!!!!!!!!!!!

        function showSchedule(days) {  // 시작일과 종료일의 차이로 여행 날짜수 구해준값을 파라미터로 넣고
            for (let i = 1; i <= days + 1; i++) {// 날수+1 번 반복해서 코스를 짤 수 있는 블럭을 넣어줌
                let tag = "<div class='schedule_detail'>";
                tag += "<input type='hidden' class='day' value='" + i + "'/>";
                tag += "<div class='schedule_header'><div class='badge bg-secondary day'>Day" + i + "</div></div>";
                tag += "<div class='schedule_body'></div>";
                tag += "<div class='schedule_footer'>";
                tag += "<div class='placeAdd'>";
                tag += "<img src='<%=request.getContextPath()%>/img/placeselect.png' width='50'/></div>";
                tag += "</div></div>";
                $("#schedule").append(tag);
            }
        }


        $(document).on("click", ".closeModal", function () { //모달 닫는 버튼
            $("#myModal").css("display", "none");
        });
        $(document).on("click", ".placeAdd", function () { // 장소 추가 버튼을 누르면
            $("#cursor").remove();                         // cursor 블럭 초기화해주고
            $("#selectedPlace").html("");                           // selectedPlace 박스 초기화
            let tag = "<div id='cursor'></div>";
            $(this).parent().siblings(".schedule_body").append(tag);//장소를 추가할 박스에 cursor 박스를 만들어준다.
            $("#myModal").css("display", "block");                  // 그리고 모달을 보이게 한다.
            let searchWord = $(this).serialize();
            showPlace(searchWord);                                  //목록 띄워주기
        });

        // 모달 내 여행지 목록에서 여행지 선택 버튼을 눌렀을 때
        $(document).on("click", ".btn-primary", function () { //선택을 누르면
            let selected = $(this).parent().parent();
            $("#selectedPlace").append(selected[0].firstChild); //선택된 여행지를 selectedPlace 박스에 사진으로 올린다.
            selected.css("display", "none"); //선택된 여행지를 목록에서 안보이게 한다.

        });
        function showPlace(searchWord){  //장소를 DB에서 불러와서 보여주는 함수

            $("#placeBox").html("");
            let url = "placeSelectList";
            $.ajax({
                url: url,
                type: "POST",
                data:searchWord,
                success(result) {
                    $(result).each(function (idx, dto) {
                        let tag = "<div class='place_container'>";
                        tag += "<div class='place_item'>";
                        tag += "    <input type='hidden' value='" + dto.place_no + "'/> ";
                        tag += "    <img src='<%=request.getContextPath()%>/img/" + dto.thumbnail + "' width='70' height='70'/></div>";
                        tag += "<div class='place_item'>";
                        tag += "    <span style='font-size: 1.2em'>" + dto.place_name + "</span></div>";
                        tag += "<div class='place_item'>" + dto.content + "</div>";
                        tag += "<div class='place_item'>";
                        tag += "    <button type='button' class='btn btn-primary'>선택</button></div>";

                        $("#placeBox").append(tag);
                    });

                }, error(e) {
                    console.log(e.responseText);
                }

            })
        }


        $(document).on("keypress", "#searchWord", function(){ // 검색어를 입력하고 enter를 치면 검색되도록하는 이벤트
           if(event.keyCode==13){
               let searchWord = $("#searchWord").serialize();
               showPlace(searchWord);
           }
        });
        let lat1= null, lat2 = null, lon1=null, lon2=null;

        $("#saveBtn").click(function(){  //장소를 다 고르고 저장 버튼을 누르면 선택된 여행지가 해당 날짜로 들어감
            // 저장을 누르면
            // 1. selectedPlace에 옮겨진 장소를 plannerbody의 일정부분에 옮기기
            let day = 1;
            let selectedNo = "";
            let selectedPlace = $("#selectedPlace input");
            for (let i = 0; i < selectedPlace.length; i++) {
                selectedNo += "&places="+selectedPlace[i].value
            }

            $.ajax({
                url:'selectedPlace',
                data:selectedNo,
                traditional:true,
                type: 'POST',
                success(result) {

                    let a = 0;
                    if($("#cursor").siblings(".place").last().first().value!=null){
                        a=parseInt($("#cursor").siblings(".place").last().first().value);
                    }

                    $(result).each(function(i, dto){
                        let places = {lat:dto.latitude, lon: dto.longitude}
                        displayMarker(places)

                       let tag = "";
                        tag += "<div class='place day1'>";
                        tag += "<div class='order'>" + (i + 1 + a) + "</div>";
                        tag += "<div class='place_dis'>";
                        if((i+1+a)==1){
                            lat1 = dto.latitude;
                            lon1 = dto.longitude;
                        }else{
                            lat2 =dto.latitude;
                            lon2 = dto.longitude;

                            tag+=parseInt(distance(lat1, lon1, lat2, lon2))+ "KM";
                            lat1 =lat2;
                            lon1 = lon2;
                        }
                        tag += "</div>";
                        tag += "<div class='place_name'>" + dto.place_name + "</div>";
                        tag += "<div class='place_del'>삭제</div>";
                        tag += "<input type='hidden' value='" + dto.place_no + "'/>";
                        tag += "<input class='lat' type='hidden' value='" + dto.latitude + "'/>";
                        tag += "<input class='lon'  type='hidden' value='" + dto.longitude + "'/></div>";

                        $("#cursor").parent(".schedule_body").append(tag);




                        //---------------------------------------
                        // 각 여행지 사이의 거리를 프론트단에서 계산하는 방법 생각해야함
                        // 여행지를 중간에 삭제하거나 위치를 바꿨을 때 거리가 다시 계산 되도록

                        //---------------------------------------
                    });


                },error(e) {

                }
            })

            // 2. modalbody에 내용 초기화
            $("#searchWord").val(); //검색창 초기화
            $("#placeBox").empty();
            $("#selectedPlace").empty();
            // 3. modal을 닫는다.
            $("#myModal").css("display", "none");








        });

        $("#selectedPlace").sortable();

    });


</script>

<div id="planner_body">
    <form id="planner_Saver" method="post" action="planSave">
        <ul>
            <li>
                <div class="label">플랜이름:</div>
                <input type="text" class="ib" id="plan_name" name="plan_name" placeholder="플랜 이름"/></li>
            <li>
                <div class="label">일정 :</div>
                <input type="date" id="start_date" name="start_date"/>
                - <input type="date" id="end_date" name="end_date"/></li>
            <li id="transport">
                <div class="label">교통수단 :</div>
                <div class="content ib" id="transport_radio">
                    <input type="radio" name="transport" value="public"/>대중교통<br>
                    <input type="radio" name="transport" value="ownCar"/>자차
                </div>
            </li>
            <li>
                <div class="label">인원수 :</div>
                <input type="number" class="ib" name="number_person" min="1" value="1" step="1"/></li>
            <li>
                <div class="label">일행 추가 :</div>
                <div class="content ib"></div>
            </li>
            <li><input type="hidden" id="days" name="days" value=""/></li>
            <li id="schedule">

            </li>
        </ul>
        <br/>

        <div id="buttons">
            <button type="submit">저장</button>
            <button type="reset">취소</button>
        </div>

    </form>
    <div class="myModal" id="myModal"> <!-- 모달로 쓸 블럭 -->
        <input type="hidden" id="day" value=""/>
        <div id="modalbody">

            <button type="button" class="closeModal" id="xbox"><img src="<%=request.getContextPath()%>/img/delete.png"
                                                                    width="20"></button>
            <%--검색--%>
            <div id="searchForm" style="background-color: bisque; height:50px;">
                <input type="text" name="searchWord" id="searchWord"/>
            </div>
            <%--선택한거 보여주는 박스--%>
            <div id="selectedPlace">

            </div>
            <div id="placeSave">
                <div id="saveBtn" class="btn button">저장</div> <%--이거 누르면 왜 --%>
                <div id="cancelBtn" class="btn button">취소</div>
            </div>
            <%--장소 목록 예시--%>
            <div id="placeBox">
            </div>

        </div>
        <div id="modalfooter">
            <button type="button" class="btn btn-danger closeModal" id="closeBtn" data-bs-dismiss="modal">Close</button>
        </div>
    </div>
</div>
<div id="map"></div>


<script>
    let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    let options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 9 //지도의 레벨(확대, 축소 정도)
    };

    let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    let mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    let zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);

    function displayMarker(places) {
        console.log(places.lat);
        console.log(places.lon);
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(places.lat, places.lon)
        });
    }

    function distance(lat1, lon1, lat2, lon2) { // 거리 구하는 함수
        const R = 6371; // 지구 반지름 (단위: km)
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
            Math.sin(dLon/2) * Math.sin(dLon/2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        return R * c;// 두 지점 간의 거리 (단위: km)
    }

    function deg2rad(deg) {
        return deg * (Math.PI/180);
    }





</script>

