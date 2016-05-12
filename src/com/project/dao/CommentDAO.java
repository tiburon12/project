package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.project.vo.Comment;

public class CommentDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String user = "projects";
	private String pwd = "111111";

	public Connection getConn() {
		Connection con = null;
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드에 실패하였습니다.");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			System.out.println("연결에 실패하였습니다.");
			e.printStackTrace();
		}
		return con;
	}

	public List<Comment> getCommentList(String border, int pages, String n_seq) {
		List<Comment> list = new ArrayList<Comment>();

		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Comment c = null;

		String sql = null;
		if (border.equals("buy")) {
			sql = "SELECT * FROM COMMENTS WHERE KIND = 'buy' AND NOTICE_SEQ=? ORDER BY REGDATE DESC";
		} else if (border.equals("sell")) {
			sql = "SELECT * FROM COMMENTS WHERE KIND = 'sell' AND NOTICE_SEQ=? ORDER BY REGDATE DESC";
		} else {
			sql = "SELECT * FROM COMMENTS WHERE KIND = 'free' AND NOTICE_SEQ=? ORDER BY REGDATE DESC";

		}
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, n_seq);
			rs = ps.executeQuery();

			while (rs.next()) {
				c = new Comment();
				c.setC_seq(rs.getString("C_SEQ"));
				c.setWriter(rs.getString("writer"));
				c.setContent(rs.getString("content"));
				c.setRegdate(rs.getString("regdate"));
				c.setNotice_seq(rs.getString("NOTICE_SEQ"));

				list.add(c);
			}

		} catch (SQLException e) {
			System.out.println("댓글조회중에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally { // 예외가 일어나도 실행
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("접속해제에 실패하였습니다.");
				e.printStackTrace();
			}
		}
		return list;

	}

	public int insertComment(Comment c) {
		PreparedStatement ps = null;
		Connection con = null;
		String sql = null;
		sql = "INSERT INTO COMMENTS(C_SEQ, KIND, WRITER, CONTENT, REGDATE, NOTICE_SEQ, NOTICE_WRITER) VALUES((NVL((SELECT MAX(TO_NUMBER(C_SEQ)) FROM COMMENTS),'0')+1), ?, ?, ?, SYSDATE, ?, ?)";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, c.getKind());
			ps.setString(2, c.getWriter());
			ps.setString(3, c.getContent());
			ps.setString(4, c.getNotice_seq());
			ps.setString(5, c.getNotice_writer());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("댓글 등록에 성공하였습니다.");
			} else {
				System.out.println("댓글 등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			System.out.println("댓글 등록중에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally { // 예외가 일어나도 실행
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("접속해제에 실패하였습니다.");
				e.printStackTrace();
			}
		}
		return af;
	}

	public int delCommentWriter(String mid) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE COMMENTS WHERE NOTICE_WRITER = ?";
		String sql2 = "DELETE COMMENTS WHERE WRITER = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			ps.executeUpdate();

			ps = con.prepareStatement(sql2);
			ps.setString(1, mid);
			ps.executeUpdate();

			// if (af > 0) {
			// System.out.println("댓글 삭제에 성공하였습니다.");
			// } else {
			// System.out.println("댓글 삭제에 실패하였습니다.");
			// }

		} catch (SQLException e) {
			System.out.println("댓글 삭제 중에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally { // 예외가 일어나도 실행
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("접속해제에 실패하였습니다.");
				e.printStackTrace();
			}
		}
		return af;
	}

	public int delComment(String c_seq) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE COMMENTS WHERE C_SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, c_seq);
			af = ps.executeUpdate();

			if (af > 0) {
				System.out.println("댓글 삭제에 성공하였습니다.");
			} else {
				System.out.println("댓글 삭제에 실패하였습니다.");
			}

		} catch (SQLException e) {
			System.out.println("댓글 삭제 중에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally { // 예외가 일어나도 실행
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("접속해제에 실패하였습니다.");
				e.printStackTrace();
			}
		}
		return af;
	}
}
