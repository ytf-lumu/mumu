package com.luowg.brand.bo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Brand {
private String id;
private String brandname;
private String details;
private String region;
private String logo;
private Date joinTime;
private String status;
private String sorting;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getBrandname() {
	return brandname;
}
public void setBrandname(String brandname) {
	this.brandname = brandname;
}
public String getDetails() {
	return details;
}
public void setDetails(String details) {
	this.details = details;
}
public String getRegion() {
	return region;
}
public void setRegion(String region) {
	this.region = region;
}
public String getLogo() {
	return logo;
}
public void setLogo(String logo) {
	this.logo = logo;
}
@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
public Date getJoinTime() {
	return joinTime;
}
public void setJoinTime(Date joinTime) {
	this.joinTime = joinTime;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getSorting() {
	return sorting;
}
public void setSorting(String sorting) {
	this.sorting = sorting;
}

}
