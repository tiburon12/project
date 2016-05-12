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
			System.out.println("����̹� �ε忡 �����Ͽ����ϴ�.");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			System.out.println("���ῡ �����Ͽ����ϴ�.");
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
			System.out.println("ȸ����ȸ�߿� ������ �߻��߽��ϴ�.");
			e.printStackTrace();
		} finally { // ���ܰ� �Ͼ�� ����
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("���������� �����Ͽ����ϴ�.");
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
				System.out.println("ȸ�� ���Կ� �����Ͽ����ϴ�.");
			} else {
				System.out.println("ȸ�� ���Կ� �����Ͽ����ϴ�.");
			}
		} catch (SQLException e) {
			System.out.println("ȸ�������߿� ������ �߻��߽��ϴ�.");
			e.printStackTrace();
		} finally { // ���ܰ� �Ͼ�� ����
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("���������� �����Ͽ����ϴ�.");
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
				System.out.println("���� ������ �����Ͽ����ϴ�.");
			} else {
				System.out.println("���� ������ �����Ͽ����ϴ�.");
			}
		} catch (SQLException e) {
			System.out.println("���� ���� �߿� ������ �߻��߽��ϴ�.");
			e.printStackTrace();
		} finally { // ���ܰ� �Ͼ�� ����
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("���������� �����Ͽ����ϴ�.");
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
				System.out.println("ȸ�� ������ �����Ͽ����ϴ�.");
			} else {
				System.out.println("ȸ�� ������ �����Ͽ����ϴ�.");
			}

		} catch (SQLException e) {
			System.out.println("ȸ�� ���� �߿� ������ �߻��߽��ϴ�.");
			e.printStackTrace();
		} finally { // ���ܰ� �Ͼ�� ����
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("���������� �����Ͽ����ϴ�.");
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
			System.out.println("ȸ����ȸ�߿� ������ �߻��߽��ϴ�.");
			e.printStackTrace();
		} finally { // ���ܰ� �Ͼ�� ����
			try {
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("���������� �����Ͽ����ϴ�.");
				e.printStackTrace();
			}
		}
		return list;
	}

}
