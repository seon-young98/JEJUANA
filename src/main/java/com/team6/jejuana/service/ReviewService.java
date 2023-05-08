package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.ReviewSearchVO;

public interface ReviewService {
	//������ ����
	public List<ReviewDTO> reviewBestSelect(); //�α�� ���
	public List<ReviewDTO> reviewAllSelect(ReviewSearchVO vo); //�� ���
	
	//���ۼ� â
	public ReviewDTO reviewWriteSelect(int plan_no); //�ۼ��� �÷� ����
	public List<ReviewDTO> planSelect(int plan_no); //�� ������ ����/���
	public List<ReviewDTO> tagSelect(); //�±׸��
	public int reviewInsert(ReviewDTO dto); //�۵��
		
	//����
	public ReviewDTO onePlaceSelect(int place_no); //������ 1�� ����
	public int starSelect(ReviewDTO dto); //�ߺ����� Ȯ��
	public int starInsert(ReviewDTO dto); //���� DB ���
	public int starUpdate(int place_no, int rate); //���� �ο�
	
	//�ۼ���(Ȯ��)
	public ReviewDTO reviewSelect(int plan_no);
	//��ȸ�� ����
	public void reviewHitCount(int plan_no);
	//�ٳ�� �ڽ�
	public List<ReviewDTO> reviewCourse(int plan_no);
		
	//������ �� ����
	public ReviewDTO reviewEditSelect(int plan_no);
	//�ۼ���(DB)
	public int reviewUpdate(ReviewDTO dto);
	
	//�� ����
	public int reviewDelete(ReviewDTO dto);
	
	public int complainCount(int plan_no);
}
