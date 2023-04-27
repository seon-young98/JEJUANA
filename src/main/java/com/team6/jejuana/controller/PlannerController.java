package com.team6.jejuana.controller;

import com.team6.jejuana.dto.CourseDTO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.service.PlanService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class PlannerController {
    @Autowired
    PlanService service;

    @GetMapping("/planner")
    public ModelAndView planner(HttpSession session) {
        session.setAttribute("logId", "ggamangso");
        return new ModelAndView("planner/planner");
    }

    @GetMapping("plannerchoose")
    public String plannerchoose() {

        return "planner/plannerchoose";
    }

    @GetMapping("test")
    public String test() {

        return "planner/test";
    }

    @GetMapping("plannerKakaoMap")
    public String plannerKakaoMap() {

        return "planner/plannerKakaoMap";
    }

    @PostMapping(value = "/planSave",  produces = "application/text; charset=utf-8")
    @ResponseBody
    public String planSave(String plan_name, String start_date, String end_date, int days, String schedule,
                           HttpSession session) throws ParseException {

        PlanDTO planDTO = new PlanDTO();
        planDTO.setPlan_name(plan_name);
        planDTO.setStart_date(start_date);
        planDTO.setEnd_date(end_date);
        planDTO.setDays(days);
//        planDTO.setId((String) session.getAttribute("logId"));
        planDTO.setId("ggamangso");
        service.planSave(planDTO);




        List<CourseDTO> list = new ArrayList<CourseDTO>();

        JSONArray jArray = new JSONArray(schedule);
        for(Object course:jArray){
            System.out.println(course.toString());
            CourseDTO dto = new CourseDTO();
            JSONObject jsonCourse = new JSONObject(course);
            dto.setPlace_no(jsonCourse.getInt("place_no"));
            dto.setDay(jsonCourse.getInt("day"));
            dto.setOrder(jsonCourse.getInt("order"));
        }
        
//        ModelAndView mav = new ModelAndView();
//        dto.setId((String) session.getAttribute("logId"));   //session.getAttribute("logId")
//        dto.setParticipants(dto.getParticipants() + 1);
//        int result = service.planSave(dto);
//        System.out.println(result);
//
//        mav.setViewName("redirect:/");


        return "11";
    }

    @PostMapping("placeAllList")
    @ResponseBody
    public List<PlaceDTO> placeAllList() {
        return service.placeAllList();
    }

    @PostMapping("placeSelectList")
    @ResponseBody
    public List<PlaceDTO> placeSelectList(String searchWord, int pageNo) {
//        System.out.println(searchWord+ " - "+ pageNo);

        return service.placeSelectList(searchWord, pageNo);
    }
    @PostMapping("bookmarkList")
    @ResponseBody
    public List<PlaceDTO> bookmarkList(String searchWord, int pageNo, HttpSession session) {
        System.out.println(searchWord+ " - "+ pageNo);
        String userid = (String) session.getAttribute("logId");
        userid = "ggamangso";
        return service.bookmarkList(searchWord, userid);
    }

    @PostMapping("selectedPlace")
    @ResponseBody
    public List<PlaceDTO> selectedPlace(String[] places) {
        List<PlaceDTO> list = new ArrayList<PlaceDTO>();
        int distance = 0;
        for (int i = 0; i < places.length; i++) {
            String num = places[i];
            int place_no = Integer.parseInt(num);
            PlaceDTO dto = service.selectedPlace(place_no);
            list.add(dto);
        }
        return list;
    }

    @PostMapping(value = "/searchPlace", produces = "application/text; charset=utf-8")
    @ResponseBody
    public String searchPlace(@RequestParam("content") String keyword) throws Exception {
        System.out.println(keyword);
        String searchWord = URLEncoder.encode(keyword, "UTF-8");
        System.out.println(searchWord);
        int size = 45;
        int page = 1;

        String url = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + keyword+ "&size=15";
        System.out.println(url);
        String placeList = "";
        try {
            placeList = getDocument(getJSONData(url));
            System.out.println(placeList);
        } catch (Exception e) {
            System.out.println("주소 api 요청 에러");
            e.printStackTrace();
        }

        return placeList;
    }


    /**
     * REST API로 통신하여 받은 JSON형태의 데이터를 String으로 받아오는 메소드
     */
    private static String getJSONData(String apiUrl) throws Exception {
        HttpURLConnection conn = null;
        StringBuffer response = new StringBuffer();

        //인증키 - KakaoAK하고 한 칸 띄워주셔야해요!
        String auth = "KakaoAK " + "c1aec10b875abd1dc9b8fc836550090a";

        //URL 설정
        URL url = new URL(apiUrl);

        conn = (HttpURLConnection) url.openConnection();

        //Request 형식 설정
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", auth);

        //request에 JSON data 준비
        conn.setDoOutput(true);

        //보내고 결과값 받기
        int responseCode = conn.getResponseCode();
        if (responseCode == 400) {
            System.out.println("400:: 해당 명령을 실행할 수 없음");
        } else if (responseCode == 401) {
            System.out.println("401:: Authorization가 잘못됨");
        } else if (responseCode == 500) {
            System.out.println("500:: 서버 에러, 문의 필요");
        } else { // 성공 후 응답 JSON 데이터받기

            Charset charset = Charset.forName("UTF-8");
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));

            String inputLine;
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
        }
        System.out.println(response.toString());

        return response.toString();
    }

    /**
     * JSON형태의 String 데이터에서 주소값(address_name)만 받아오기
     */
    private static String getDocument(String jsonString) {
        String value = "";
        JSONObject jObj = new JSONObject(jsonString);
        System.out.println(jObj.toString());
        JSONObject meta = jObj.getJSONObject("meta");
        System.out.println(meta.toString());
        long total_count = (long) meta.getInt("total_count");

        if (total_count > 0) {
            JSONArray jArray = (JSONArray) jObj.get("documents");
            value = jArray.toString();
            System.out.println(total_count);
        }else{
            System.out.println("no result");
        }
        return value;
    }
}
