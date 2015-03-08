package com.TO;

public class ResultTO {
	private String userId;
	private String title;
	private String partUrl;
	//hyperlink
	private String completeUrl;
	//content
	private String content;
	//image url
	private String imgUrl;
	public String getPartUrl() {
		return partUrl;
	}
	public void setPartUrl(String partUrl) {
		this.partUrl = partUrl;
	}
	public String getCompleteUrl() {
		return completeUrl;
	}
	public void setCompleteUrl(String completeUrl) {
		this.completeUrl = completeUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
