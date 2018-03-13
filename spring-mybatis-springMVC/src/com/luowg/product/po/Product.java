package com.luowg.product.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 *用户po 
 */
public class Product implements Serializable {
	//unit单位  weight重量  keyword关键词 content内容  texture材质
	//属性名和数据库表的字段对应
	private String id;
	private String productname;// 物品名
	private String costprice;// 原价
	private String nowprice;//现价
	private String region;//地区
	private String startTime;// 生日
	private String endTime;// 生日
	private Date joinTime;// 生日
	private String audit;//审核
	private String status;//状态
	private String image;//图片
	private String brandname;//图片标题
	private String brief;	//简略标题
	private String texture;//材质
	private String weight;//重量
	private String unit;//单位
	private String keyword;//关键词
	private String content_z;//内容摘要
	private String content_x;//内容详情
	private String cateid;
	public String getCateid() {
		return cateid;
	}
	public void setCateid(String cateid) {
		this.cateid = cateid;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getTexture() {
		return texture;
	}
	public void setTexture(String texture) {
		this.texture = texture;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getContent_z() {
		return content_z;
	}
	public void setContent_z(String content_z) {
		this.content_z = content_z;
	}
	public String getContent_x() {
		return content_x;
	}
	public void setContent_x(String content_x) {
		this.content_x = content_x;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCostprice() {
		return costprice;
	}
	public void setCostprice(String costprice) {
		this.costprice = costprice;
	}
	public String getNowprice() {
		return nowprice;
	}
	public void setNowprice(String nowprice) {
		this.nowprice = nowprice;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	public String getAudit() {
		return audit;
	}
	public void setAudit(String audit) {
		this.audit = audit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	//@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	
	

}
