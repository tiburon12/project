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

public class BuyBorderDAO {
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
	public List<Border> getBuyBorderList(int pages) {
		List<Border> list = new ArrayList<Border>();

		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Border b = null;

		int startNum = 1 + (pages - 1) * 15;
		int endNum = 15 + (pages - 1) * 15;
		String sql = "SELECT * FROM (SELECT ROWNUM NUM, N.* FROM (SELECT * FROM BUYBORDER ORDER BY REGDATE DESC) N ) WHERE NUM BETWEEN ? AND ?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startNum);
			ps.setInt(2, endNum);
			rs = ps.executeQuery();

			while (rs.next()) {
				b = new Border();
				b.setSeq(rs.getString("seq"));
				b.setCategory(rs.getString("category"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setHit(rs.getInt("hit"));
				b.setRegdate(rs.getString("regdate"));

				list.add(b);
			}

		} catch (SQLException e) {
			System.out.println("�Խñ� ��ȸ�߿� ������ �߻��߽��ϴ�.");
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
	public List<Border> getBuyBorderCateList(int pages, String category) {
		List<Border> list = new ArrayList<Border>();

		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Border b = null;

		int startNum = 1 + (pages - 1) * 15;
		int endNum = 15 + (pages - 1) * 15;
		String sql = "SELECT * FROM (SELECT ROWNUM NUM, N.* FROM (SELECT * FROM BUYBORDER WHERE CATEGORY = ? ORDER BY REGDATE DESC) N ) WHERE NUM BETWEEN ? AND ?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			rs = ps.executeQuery();

			while (rs.next()) {
				b = new Border();
				b.setSeq(rs.getString("seq"));
				b.setCategory(rs.getString("category"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setHit(rs.getInt("hit"));
				b.setPick(rs.getInt("pick"));
				b.setRegdate(rs.getString("regdate"));
				b.setFileSrc(rs.getString("filesrc"));

				list.add(b);
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

	public Border getBorder(String seq) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		Border b = null;

		String sql = "SELECT * FROM BUYBORDER WHERE SEQ = ?";
		String sql2 = "UPDATE BUYBORDER SET HIT = ((SELECT HIT FROM BUYBORDER WHERE SEQ=?)+1) WHERE SEQ=?";
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
				b = new Border();
				b.setSeq(rs.getString("seq"));
				b.setCategory(rs.getString("category"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setRegdate(rs.getString("regdate"));
				b.setHit(rs.getInt("hit"));
				b.setFileSrc(rs.getString("filesrc"));
			}

		} catch (SQLException e) {
			System.out.println("�Խñ���ȸ�߿� ������ �߻��߽��ϴ�.");
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
		return b;
	}

	public int insertBorder(Border b) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "INSERT INTO BUYBORDER(SEQ, TITLE, WRITER, CATEGORY, CONTENT, HIT, REGDATE,FILESRC) VALUES((NVL((SELECT MAX(TO_NUMBER(SEQ)) FROM BUYBORDER),'0')+1), ?, ?, ?, ?, 0, SYSDATE,?)";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, b.getTitle());
			ps.setString(2, b.getWriter());
			ps.setString(3, b.getCategory());
			ps.setString(4, b.getContent());
			ps.setString(5, b.getFileSrc());

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

	public int updateBorder(Border n) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "UPDATE BUYBORDER SET TITLE = ?, CATEGORY = ?, CONTENT = ? WHERE SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, n.getTitle());
			ps.setString(2, n.getCategory());
			ps.setString(3, n.getContent());
			ps.setString(4, n.getSeq());

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

		String sql = "DELETE BUYBORDER WHERE SEQ = ?";
		con = getConn();
		int af = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, seq);

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

	public int delBorderMid(String mid) {
		PreparedStatement ps = null;
		Connection con = null;

		String sql = "DELETE BUYBORDER WHERE WRITER = ?";
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
	public int getCountCate(String category) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		int count = 0;

		String sql = "SELECT COUNT(SEQ) CNT FROM BUYBORDER WHERE CATEGORY = ?";
		con = getConn();

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt("CNT");

			}

		} catch (SQLException e) {
			System.out.println("�Խñ� ���� ��ȸ�߿� ������ �߻��߽��ϴ�.");
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
		return count;
	}

	public int getCount() {

		Statement st = null;
		ResultSet rs = null;
		Connection con = null;
		int count = 0;

		String sql = "SELECT COUNT(SEQ) CNT FROM BUYBORDER";
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
