package com.internproject.web;

public class DeveloperSubmitmodel {
	private String pname;
	private String tname;
	private String WorkCompleted;
	public String getWorkCompleted() {
		return WorkCompleted;
	}
	public void setWorkCompleted(String workCompleted) {
		WorkCompleted = workCompleted;
	}
	private String wip;
	private int hourspent;
	private String remarks;
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getWip() {
		return wip;
	}
	public void setWip(String wip) {
		this.wip = wip;
	}
	public int getHourspent() {
		return hourspent;
	}
	public void setHourspent(int hourspent) {
		this.hourspent = hourspent;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
