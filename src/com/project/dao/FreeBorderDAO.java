package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.project.vo.Border;
import com.project.vo.FreeBorder;

public class FreeBorderDAO {
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

	// ����¡ ��� ���
	public List<FreeBorder> getFreeBorderList(int pages) {
		List<FreeBorder> list = new ArrayList<FreeBorder>();

		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		FreeBorder fb = null;

		int startNum = 1 + (pages - 1) * 15;
		int endNum = 15 + (pages - 1) * 15;
		String sql = "SELECT * FROM (SELECT ROWNUM NUM, N.* FROM (SELECT * FROM FREEBORDER ORDER BY REGDATE DESC) N ) WHERE NUM BETWEEN ? AND ?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startNum);
			ps.setInt(2, endNum);
			rs = ps.executeQuery();

			while (rs.next()) {
				fb = new FreeBorder();
				fb.setSeq(rs.getString("seq"));
				fb.setTitle(rs.getString("title"));
				fb.setWriter(rs.getString("writer"));
				fb.setContent(rs.getString("content"));
				fb.setHit(rs.getInt("hit"));
				fb.setRegdate(rs.getString("regdate"));

				list.add(fb);
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
		return list;

	}

	public FreeBorder getBorder(String seq) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		FreeBorder fb = null;

		String sql = "SELECT * FROM FREEBORDER WHERE SEQ = ?";
		String sql2 = "UPDATE FREEBORDER SET HIT = ((SELECT HIT FROM FREEBORDER WHERE SEQ=?)+1) WHERE SEQ=?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql2);
			ps.setString(1, seq);
			ps.setString(2, seq);
			ps.executeUpdate();

			ps = con.prepareStatement(sql);
			ps.setString(1, seq);
			rs = ps.executeQuery();

			if (rs.next()) {
				fb = new FreeBorder();
				fb.setSeq(rs.getString("seq"));
				fb.setTitle(rs.getString("title"));
				fb.setWriter(rs.getString("writer"));
				fb.setContent(rs.getString("content"));
				fb.setRegdate(rs.getString("regdate"));
				fb.setHit(rs.getInt("hit"));
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
		return fb;
	}

	public int insertBorder(FreeBorder fb) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "INSERT INTO FREEBORDER(SEQ, TITLE, WRITER, CONTENT, HIT, REGDATE) VALUES((NVL((SELECT MAX(TO_NUMBER(SEQ)) FROM FREEBORDER),'0')+1), ?, ?, ?, 0, SYSDATE)";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, fb.getTitle());
			ps.setString(2, fb.getWriter());
			ps.setString(3, fb.getContent());

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("�� ��Ͽ� �����Ͽ����ϴ�.");
			} else {
				System.out.println("�� ��Ͽ� �����Ͽ����ϴ�.");
			}
		} catch (SQLException e) {
			System.out.println("�� ����߿� ������ �߻��߽��ϴ�.");
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

	public int updateBorder(FreeBorder n) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "UPDATE FREEBORDER SET TITLE = ?, CONTENT = ? WHERE SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, n.getTitle());
			ps.setString(2, n.getContent());
			ps.setString(3, n.getSeq());

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

	public int delBorder(String seq) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE FREEBORDER WHERE SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, seq);

			af = ps.executeUpdate();

			if (af == 1) {
				System.out.println("�Խñ� ������ �����Ͽ����ϴ�.");
			} else {
				System.out.println("�Խñ� ������ �����Ͽ����ϴ�.");
			}

		} catch (SQLException e) {
			System.out.println("�Խñ� ���� �߿� ������ �߻��߽��ϴ�.");
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

	public int delBorderMid(String mid) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE FREEBORDER WHERE WRITER = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);

			ps.executeUpdate();

			// if (af == 1) {
			// System.out.println("�Խñ� ������ �����Ͽ����ϴ�.");
			// } else {
			// System.out.println("�Խñ� ������ �����Ͽ����ϴ�.");
			// }

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

	public int getCount() {

		Statement st = null;
		ResultSet rs = null;
		Connection con = null;
		int count = 0;

		String sql = "SELECT COUNT(SEQ) CNT FROM FREEBORDER";
		con = getConn();

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);

			if (rs.next()) {
				count = rs.getInt("CNT");

			}

		} catch (SQLException e) {
			System.out.println("�Խñ� ���� ��ȸ�߿� ������ �߻��߽��ϴ�.");
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
		return count;
	}
}
