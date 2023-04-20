package com.team6.jejuana.service;

import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;

import java.util.List;

public interface PlanService {
    public int planSave(PlanDTO dto);
    public List<PlaceDTO> placeAllList();
    public List<PlaceDTO> placeSelectList(String searchWord);
    public PlaceDTO selectedPlace(int place_no);
}
