package com.techblog.entities;

import java.sql.Timestamp;

public class Post {
	
	private int pId;
	private String pTitle;
	private String pContent;
	private String code;
	
	private Timestamp pDate;
	private int cid;
	private int userID;
	public Post(int pId, String pTitle, String pContent, String code, Timestamp pDate, int cid, int userID) {
		
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		
		this.pDate = pDate;
		this.cid = cid;
		this.userID = userID;
	}
	public Post(String pTitle, String pContent, String code,  int cid, int userID) {
	
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		
//		this.pDate = pDate;
		this.cid = cid;
		this.userID = userID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

}
