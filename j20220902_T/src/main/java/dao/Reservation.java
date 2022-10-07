package dao;

import java.util.Date;

public class Reservation {
	private int res_rid;
	private Date res_date;
	private int res_lane;
	private int res_startTime;
	private int res_endTime;
	private int res_customer;
	private int res_sal;
	private int res_come;
	private int res_userNum;
	private Date pay_date;
	private int res_cancel;
	private int res_brnNum;
	
	//[이효정 추가 String name/int    sum_sal]
	private String name;
	private int    sum_sal;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSum_sal() {
		return sum_sal;
	}
	public void setSum_sal(int sum_sal) {
		this.sum_sal = sum_sal;
	}
	public int getRes_rid() {
		return res_rid;
	}
	public void setRes_rid(int res_rid) {
		this.res_rid = res_rid;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public int getRes_lane() {
		return res_lane;
	}
	public void setRes_lane(int res_lane) {
		this.res_lane = res_lane;
	}
	public int getRes_startTime() {
		return res_startTime;
	}
	public void setRes_startTime(int res_startTime) {
		this.res_startTime = res_startTime;
	}
	public int getRes_endTime() {
		return res_endTime;
	}
	public void setRes_endTime(int res_endTime) {
		this.res_endTime = res_endTime;
	}
	public int getRes_customer() {
		return res_customer;
	}
	public void setRes_customer(int res_customer) {
		this.res_customer = res_customer;
	}
	public int getRes_sal() {
		return res_sal;
	}
	public void setRes_sal(int res_sal) {
		this.res_sal = res_sal;
	}
	public int getRes_come() {
		return res_come;
	}
	public void setRes_come(int res_come) {
		this.res_come = res_come;
	}
	public int getRes_userNum() {
		return res_userNum;
	}
	public void setRes_userNum(int res_userNum) {
		this.res_userNum = res_userNum;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getRes_cancel() {
		return res_cancel;
	}
	public void setRes_cancel(int res_cancel) {
		this.res_cancel = res_cancel;
	}
	public int getRes_brnNum() {
		return res_brnNum;
	}
	public void setRes_brnNum(int res_brnNum) {
		this.res_brnNum = res_brnNum;
	}
	
	
}
