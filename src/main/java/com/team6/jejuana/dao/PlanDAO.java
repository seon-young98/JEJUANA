package com.team6.jejuana.dao;

import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;

import java.util.List;

public interface PlanDAO {

    public int planSave(PlanDTO dto);
    public List<PlaceDTO> placeAllList();
    public List<PlaceDTO> placeSelectList(String searchWord);
    public PlaceDTO selectedPlace(int place_no);

}
