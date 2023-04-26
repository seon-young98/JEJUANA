package com.team6.jejuana.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlanDTO {
    private int plan_no; //플랜 번호
    private String plan_name; // 플랜이름
    private String start_date; //일정 시작일
    private String end_date;   // 일정 종료일
    private String transport;  // 교통수단 public/ownCar
    private int number_person;  // 모집인원수
    private int participants;  // 참가인원수
    private String temp;  // 임시저장여부
    private String id;  //작성자
    private int days;   //기간
    private int activated; // 비활성 여부



}
