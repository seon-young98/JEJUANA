package com.team6.jejuana.service;

import com.team6.jejuana.dao.PlanDAO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanServiceImpl implements PlanService{
    @Autowired
    PlanDAO dao;

    public PlanServiceImpl(PlanDAO dao){
        this.dao = dao;
    }

    @Override
    public int planSave(PlanDTO dto) {
        return dao.planSave(dto);
    }

    @Override
    public List<PlaceDTO> placeAllList() {
        return dao.placeAllList();
    }

    @Override
    public List<PlaceDTO> placeSelectList(String searchWord, int pageNo) {
        return dao.placeSelectList(searchWord, pageNo);
    }

    @Override
    public PlaceDTO selectedPlace(int place_no) {
        return dao.selectedPlace(place_no);
    }

    @Override
    public List<PlaceDTO> bookmarkList(String searchWord, String userid) {
        return dao.bookmarkList(searchWord, userid);
    }
}
