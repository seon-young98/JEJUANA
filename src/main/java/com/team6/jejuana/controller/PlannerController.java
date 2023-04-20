package com.team6.jejuana.controller;

import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
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

    @PostMapping("/planSave")
    public ModelAndView planSave(PlanDTO dto, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        dto.setId((String) session.getAttribute("logId"));   //session.getAttribute("logId")
        dto.setParticipants(dto.getParticipants() + 1);
        int result = service.planSave(dto);
        System.out.println(result);

        mav.setViewName("redirect:/");


        return mav;
    }

    @PostMapping("placeAllList")
    @ResponseBody
    public List<PlaceDTO> placeAllList() {
        return service.placeAllList();
    }

    @PostMapping("placeSelectList")
    @ResponseBody
    public List<PlaceDTO> placeSelectList(String searchWord) {
        System.out.println(searchWord);

        return service.placeSelectList(searchWord);
    }

    @PostMapping("selectedPlace")
    @ResponseBody
    public List<PlaceDTO> selectedPlace(String[] places){
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



}
