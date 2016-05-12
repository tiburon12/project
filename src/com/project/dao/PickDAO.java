package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.project.vo.Pick;

public class PickDAO {
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

	public List<Pick> getPickList(String mid) {
		List<Pick> list = new ArrayList<Pick>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Pick p = null;

		String sql = "SELECT * FROM PICKS WHERE OWNER=? ORDER BY REGDATE DESC";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();

			while (rs.next()) {
				p = new Pick();
				p.setP_num(rs.getString("p_num"));
				p.setOwner(rs.getString("owner"));
				p.setRegdate(rs.getString("regdate"));
				p.setNotice_seq(rs.getString("notice_seq"));
				p.setCategory(rs.getString("category"));
				p.setTitle(rs.getString("title"));
				p.setWriter(rs.getString("writer"));

				list.add(p);
			}

		} catch (SQLException e) {
			System.out.println("게시글 조회중에 오류가 발생했습니다.");
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

	public int insertPick(Pick p) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "INSERT INTO PICKS(P_NUM, OWNER, NOTICE_SEQ, REGDATE,CATEGORY, TITLE, WRITER) VALUES((NVL((SELECT MAX(TO_NUMBER(P_NUM)) FROM PICKS),'0')+1), ?, ?, SYSDATE,?,?,?)";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, p.getOwner());
			ps.setString(2, p.getNotice_seq());
			ps.setString(3, p.getCategory());
			ps.setString(4, p.getTitle());
			ps.setString(5, p.getWriter());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("글 등록에 성공하였습니다.");
			} else {
				System.out.println("글 등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			System.out.println("글 등록중에 오류가 발생했습니다.");
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

	public int getCount() {

		Statement st = null;
		ResultSet rs = null;
		Connection con = null;
		int count = 0;

		String sql = "SELECT COUNT(SEQ) CNT FROM PICKS";
		con = getConn();

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);

			if (rs.next()) {
				count = rs.getInt("CNT");

			}

		} catch (SQLException e) {
			System.out.println("게시글 갯수 조회중에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally { // 예외가 일어나도 실행
			try {
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("접속해제에 실패하였습니다.");
				e.printStackTrace();
			}
		}
		return count;
	}

	public int delPick(String seq) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE PICKS WHERE NOTICE_SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, seq);

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("찜목록 삭제에 성공하였습니다.");
			} else {
				System.out.println("찜목록 삭제에 실패하였습니다.");
			}

		} catch (SQLException e) {
			System.out.println("찜목록 삭제 중에 오류가 발생했습니다.");
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

	public int delPickMid(String mid) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE PICKS WHERE WRITER = ?";
		String sql2 = "DELETE PICKS WHERE OWNER = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			ps.executeUpdate();

			ps = con.prepareStatement(sql2);
			ps.setString(1, mid);
			ps.executeUpdate();

			// if (af == 1) {
			// System.out.println("찜목록 삭제에 성공하였습니다.");
			// } else {
			// System.out.println("찜목록 삭제에 실패하였습니다.");
			// }

		} catch (SQLException e) {
			System.out.println("찜목록 삭제 중에 오류가 발생했습니다.");
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

	public int delPickP_num(String p_num) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE PICKS WHERE P_NUM = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, p_num);

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("찜목록 삭제에 성공하였습니다.");
			} else {
				System.out.println("찜목록 삭제에 실패하였습니다.");
			}

		} catch (SQLException e) {
			System.out.println("찜목록 삭제 중에 오류가 발생했습니다.");
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
