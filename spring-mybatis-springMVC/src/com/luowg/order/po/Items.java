package com.luowg.order.po;

import java.io.Serializable;
import java.util.Date;

public class Items implements Serializable {
	private static final long serialVersionUID = 1L;

	private String id;

    private String name;//订单名称

    private String price;//价格

    private String pic;

    private Date createtime;//创建时间

    private String detail;//细节

   

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

	@Override
	public String toString() {
		return "Items [id=" + id + ", name=" + name + ", price=" + price
				+ ", pic=" + pic + ", createtime=" + createtime + ", detail="
				+ detail + "]";
	}
    
}