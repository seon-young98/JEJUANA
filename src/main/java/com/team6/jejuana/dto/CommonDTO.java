package com.team6.jejuana.dto;

import java.util.List;

public class CommonDTO {
	private int common_no;
	private String id;
	private String password;
	private String phone_num;
	
	private String phone_num1;
	private String phone_num2;
	private String phone_num3;
	
	private String member_type;
	private String email;
	private String name;
	private String sign_date;
	private String nickname;
	
	private List<Integer> noList;

	@Override
	public String toString() {
		return "CommonDTO [common_no=" + common_no + ", id=" + id + ", password=" + password + ", phone_num="
				+ phone_num + ", phone_num1=" + phone_num1 + ", phone_num2=" + phone_num2 + ", phone_num3=" + phone_num3
				+ ", member_type=" + member_type + ", email=" + email + ", name=" + name + ", sign_date=" + sign_date
				+ ", nickname=" + nickname + ", noList=" + noList + "]";
	}

	public int getCommon_no() {
		return common_no;
	}

	public void setCommon_no(int common_no) {
		this.common_no = common_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone_num() {
		phone_num = phone_num1 + "-" + phone_num2 + "-" + phone_num3; 
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
		
		String numCut[] = phone_num.split("-");
		phone_num1 =numCut[0];
		phone_num2 =numCut[1];
		phone_num3 =numCut[2];
	}

	public String getPhone_num1() {
		return phone_num1;
		
	}

	public void setPhone_num1(String phone_num1) {
		this.phone_num1 = phone_num1;
	}

	public String getPhone_num2() {
		return phone_num2;
	}

	public void setPhone_num2(String phone_num2) {
		this.phone_num2 = phone_num2;
	}

	public String getPhone_num3() {
		return phone_num3;
	}

	public void setPhone_num3(String phone_num3) {
		this.phone_num3 = phone_num3;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSign_date() {
		return sign_date;
	}

	public void setSign_date(String sign_date) {
		this.sign_date = sign_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}


}