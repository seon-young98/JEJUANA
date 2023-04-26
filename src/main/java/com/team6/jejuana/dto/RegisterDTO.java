package com.team6.jejuana.dto;

import java.util.Arrays;

public class RegisterDTO {
	private String id;
	private String password;
	private String nickname;
	private String tel;

	private String email;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String hobby;
	private String writedate;
	@Override
	public String toString() {
		return "RegisterDTO [id=" + id + ", password=" + password + ", nickname=" + nickname + ", tel=" + tel
				+ ", email=" + email + ", zipcode=" + zipcode + ", addr=" + addr + ", addrdetail=" + addrdetail
				+ ", hobby=" + hobby + ", writedate=" + writedate + "]";
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
	
	
	
	
	
	
	

}
