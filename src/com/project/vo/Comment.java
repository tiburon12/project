package com.project.vo;

public class Comment {
	private String c_seq;
	private String kind;
	private String writer;
	private String content;
	private String regdate;
	private String notice_seq;
	private String notice_writer;

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getC_seq() {
		return c_seq;
	}

	public void setC_seq(String c_seq) {
		this.c_seq = c_seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(String notice_seq) {
		this.notice_seq = notice_seq;
	}

}
