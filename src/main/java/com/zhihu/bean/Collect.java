package com.zhihu.bean;

import lombok.Data;

/**
 * @ClassName: Collect
 * @Description:
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @return: null
 **/
@Data
public class Collect {
	private int id;
	private String stuEmail;
	private String comEmail;
	private String resumeId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStuEmail() {
		return stuEmail;
	}

	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail;
	}

	public String getComEmail() {
		return comEmail;
	}

	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}

	public String getResumeId() {
		return resumeId;
	}

	public void setResumeId(String resumeId) {
		this.resumeId = resumeId;
	}
}
