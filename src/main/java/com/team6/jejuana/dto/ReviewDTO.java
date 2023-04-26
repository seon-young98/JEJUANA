package com.team6.jejuana.dto;

import java.util.List;

public class ReviewDTO {
	private int plan_no;
	private String review_subject;
	private String review_content;
	private int review_hit;
	private String id;
	private String writedate;
	private int activated;
	private String ip;
	private String tag;
	private String thumbnail;
	private int number;
	
	private List<Integer> noList;
	
	@Override
	public String toString() {
		return "ManagerDTO [plan_no=" + plan_no + ", review_subject=" + review_subject + ", review_content="
				+ review_content + ", review_hit=" + review_hit + ", id=" + id + ", writedate=" + writedate
				+ ", activated=" + activated + ", ip=" + ip + ", tag=" + tag + ", thumbnail=" + thumbnail + ", number="
				+ number + ", noList=" + noList + "]";
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getActivated() {
		return activated;
	}
	public void setActivated(int activated) {
		this.activated = activated;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	
	
	
}
