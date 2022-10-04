package dao;

import java.util.Date;

public class Board {
	public int brd_bid;
	public String brd_name;
	public String brd_title;
	public String brd_writer;	
	public Date brd_date;
	public int brd_view;
	public String brd_content;
	public int brd_secret;
	public int brd_deleted;
	public int usernum;
	public int brd_ref;
	public int brd_re_step;
	public int brd_re_level;
	public int getBrd_bid() {
		return brd_bid;
	}
	public void setBrd_bid(int brd_bid) {
		this.brd_bid = brd_bid;
	}
	public String getBrd_name() {
		return brd_name;
	}
	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
	public Date getBrd_date() {
		return brd_date;
	}
	public void setBrd_date(Date brd_date) {
		this.brd_date = brd_date;
	}
	public int getBrd_view() {
		return brd_view;
	}
	public void setBrd_view(int brd_view) {
		this.brd_view = brd_view;
	}
	public String getBrd_content() {
		return brd_content;
	}
	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}
	public int getBrd_secret() {
		return brd_secret;
	}
	public void setBrd_secret(int brd_secret) {
		this.brd_secret = brd_secret;
	}
	public int getBrd_deleted() {
		return brd_deleted;
	}
	public void setBrd_deleted(int brd_deleted) {
		this.brd_deleted = brd_deleted;
	}
	public int getBrd_ref() {
		return brd_ref;
	}
	public void setBrd_ref(int brd_ref) {
		this.brd_ref = brd_ref;
	}
	public int getBrd_re_step() {
		return brd_re_step;
	}
	public void setBrd_re_step(int brd_re_step) {
		this.brd_re_step = brd_re_step;
	}
	public int getBrd_re_level() {
		return brd_re_level;
	}
	public void setBrd_re_level(int brd_re_level) {
		this.brd_re_level = brd_re_level;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}

}
