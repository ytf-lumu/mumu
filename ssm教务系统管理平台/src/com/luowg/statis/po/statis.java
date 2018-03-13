package com.luowg.statis.po;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class statis {
private String id;
private String name;
private String level;
private String time;
private String sex;
private String school;
private String domin;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLevel() {
	return level;
}
public void setLevel(String level) {
	this.level = level;
}
//@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getSchool() {
	return school;
}
public void setSchool(String school) {
	this.school = school;
}
public String getDomin() {
	return domin;
}
public void setDomin(String domin) {
	this.domin = domin;
}

}
