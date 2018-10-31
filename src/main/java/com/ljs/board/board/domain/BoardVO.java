package com.ljs.board.board.domain;

import java.util.Date;

public class BoardVO {

	private int idx;
	private String title;
	private String contents;
	private int hit_cnt;
	private Date crea_dtm;
	private String crea_id;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit_cnt() {
		return hit_cnt;
	}
	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}
	public Date getCrea_dtm() {
		return crea_dtm;
	}
	public void setCrea_dtm(Date crea_dtm) {
		this.crea_dtm = crea_dtm;
	}
	public String getCrea_id() {
		return crea_id;
	}
	public void setCrea_id(String crea_id) {
		this.crea_id = crea_id;
	}
	
	
}
