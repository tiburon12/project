package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import com.project.vo.Member;

public class MemberDAO {
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

	public Member getMember(String mid) {
		// Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Member m = null;

		String sql = "SELECT * FROM MEMBERS WHERE MID = ?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setMid(rs.getString("mid"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setRegdate(rs.getString("regdate"));
			}

		} catch (SQLException e) {
			System.out.println("회원조회중에 오류가 발생했습니다.");
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
		return m;
	}

	public int addMember(Member m) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "INSERT INTO MEMBERS(MID, PWD, NAME, EMAIL, PHONE, REGDATE) " + "VALUES(?, ?, ?, ?, ?, SYSDATE)";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getMid());
			ps.setString(2, m.getPwd());
			ps.setString(3, m.getName());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getPhone());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("회원 가입에 성공하였습니다.");
			} else {
				System.out.println("회원 가입에 실패하였습니다.");
			}
		} catch (SQLException e) {
			System.out.println("회원가입중에 오류가 발생했습니다.");
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

	public int updateMember(Member m) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "UPDATE MEMBERS SET EMAIL = ?, PHONE = ? WHERE MID = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getEmail());
			ps.setString(2, m.getPhone());
			ps.setString(3, m.getMid());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("정보 수정에 성공하였습니다.");
			} else {
				System.out.println("정보 수정에 실패하였습니다.");
			}
		} catch (SQLException e) {
			System.out.println("정보 수정 중에 오류가 발생했습니다.");
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

	public int deleteMember(Member m) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE MEMBERS WHERE MID = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getMid());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("회원 삭제에 성공하였습니다.");
			} else {
				System.out.println("회원 삭제에 실패하였습니다.");
			}

		} catch (SQLException e) {
			System.out.println("회원 삭제 중에 오류가 발생했습니다.");
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

	public List<Member> getMembers(String col) {
		List<Member> list = new ArrayList<Member>();

		Statement st = null;
		ResultSet rs = null;
		Connection con = null;
		Member m;

		String sql = "SELECT * FROM MEMBERS ORDER BY " + col;
		con = getConn();

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				m = new Member();
				m.setMid(rs.getString("mid"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setRegdate(rs.getString("regdate"));

				list.add(m);
			}

		} catch (SQLException e) {
			System.out.println("회원조회중에 오류가 발생했습니다.");
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
		return list;
	}

}
