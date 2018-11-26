package com.core;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

public class ConnDB {
	/**
	 * ����JDBC��ض���
	 */
	protected static Statement s = null;
	protected static ResultSet rs = null;
	protected static Connection conn = null;
	private static BasicDataSource dataSource = null;

	// ��ʼ�����ݿ����ӳ�
	public static void init() {
		if (dataSource != null) {
			try {
				dataSource.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			dataSource = null;
		}
		// ʹ��Properties���������ݿ����ӳ���Ϣ
		try {
			Properties p = new Properties();
			p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
			p.setProperty("url", "jdbc:mysql://localhost:3306/db_dataabse09");
			p.setProperty("username", "root");
			p.setProperty("password", "0823112013");
			p.setProperty("maxActive", "100");
			p.setProperty("maxIdle", "100");
			p.setProperty("maxWait", "1000");
			p.setProperty("removeAbandoned", "false");
			p.setProperty("removeAbandonedTimeout", "120");
			p.setProperty("testOnBorrow", "true");
			p.setProperty("logAbandoned", "true");
			// ��ָ����Ϣ��������Դ
			dataSource = (BasicDataSource) BasicDataSourceFactory
					.createDataSource(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �����ӳ��л�ȡ����
	public static synchronized Connection getConnection() throws SQLException {
		if (dataSource == null) {
			init();
		}
		Connection conn = null;
		if (dataSource != null) {
			conn = dataSource.getConnection();
		}
		return conn;
	}

	/**
	 * ִ��INSERT/UPDATE/DELETE SQL���
	 * 
	 * @param sql
	 *            SQL��䣬�ַ�������
	 * @return ִ�н����int����
	 */
	public static int executeUpdate(String sql) {
		int result = 0;
		try {
			s = getConnection().createStatement();
			result = s.executeUpdate(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	/**
	 * ִ��SELECT SQL���
	 * 
	 * @param sql
	 *            SQL��䣬�ַ�������
	 * @return ResultSet�����
	 */
	public static ResultSet executeQuery(String sql) {

		try {
			s = getConnection().createStatement();
			rs = s.executeQuery(sql);
			System.out.println(111111);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * ִ�ж�̬SQL���
	 * 
	 * @param sql
	 *            ���в����Ķ�̬SQL��䡣
	 * @return ����PreparedStatement����
	 */
	public static PreparedStatement executePreparedStatement(String sql)
	{
		PreparedStatement ps = null;
		try{
			ps = getConnection().prepareStatement(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return ps;
	}

	/**
	 * ����ع�
	 */
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	/**
	 * �ر����ݿ����Ӷ���
	 */
	public static void close() {
		try {
			if (rs != null)
				rs.close();
			if (s != null)
				s.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public static int Result1(String sql,String username,String password,String usertype,String gender,String email,String birthdate,String introduction,String hobby)
	{
	    int result = 0;
	    try{
	    	PreparedStatement ps = ConnDB.executePreparedStatement(sql);
	    	ps.setString(1, password);
	    	ps.setString(2, usertype);
	    	ps.setString(3, gender);
	    	ps.setString(4, email);
	    	ps.setString(5, birthdate);
	    	ps.setString(6, introduction);
	    	ps.setString(7, hobby);
	    	ps.setString(8, username);
	    	//ִ��SQL���
	    	result =ps.executeUpdate();
	    	ps.close();
	    	}catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
		return result;
	}

	public static StringBuffer sqlsb(String sql) {
		
		ResultSet rs = null;
		rs = ConnDB.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			// ������ѯ�����ƴ��ΪStringBuffer����
			while (rs.next()) {
				String username=rs.getString("fd_username");
				sb.append("<tr><td>");
				sb.append(rs.getString("fd_username"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_usertype"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_gender"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_hobby"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_birthdate"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_email"));
				sb.append("</td><td>");
				sb.append(rs.getString("fd_introduction"));
				sb.append("</td><td>");
				sb.append("<a href='/Test7.2/U?stype=delete&name=" + username +"'>ɾ��</a>");
				sb.append("&nbsp;");
				sb.append("<a href='userUpdate.jsp?name=" + username +"'>�޸�</a>");
				sb.append("</td></tr>");
			}
			ConnDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
//	public static int Result(String sql,String username,String password,String usertype,String gender,String email,String birthdate,String introduction,String hobby)
//	{
//	    int result = 0;
//		try{
//			PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
//			ps.setString(1, username);
//			ps.setString(2, password);
//			ps.setString(3, usertype);
//			ps.setString(4, gender);
//			ps.setString(5, email);
//			ps.setString(6, birthdate);
//			ps.setString(7, introduction);
//			ps.setString(8, hobby);
//			//ִ��SQL���
//			result = ps.executeUpdate();
//			ps.close();
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//		return result;
//	}
//	public static StringBuffer sqlsb1(List<User> list){
//		StringBuffer sb=new StringBuffer();
//		for(User user:list)
//		{   
//			String username=user.getFd_username();
//				sb.append("<tr><td>");
//				sb.append(user.getFd_username());
//				sb.append("</td><td>");
//				sb.append(user.getFd_usertype());
//				sb.append("</td><td>");
//				sb.append(user.getFd_gender());
//				sb.append("</td><td>");
//				sb.append(user.getFd_hobby());
//				sb.append("</td><td>");
//				sb.append( user.getFd_birthdate());
//				sb.append("</td><td>");
//				sb.append( user.getFd_email());
//				sb.append("</td><td>");
//				sb.append( user.getFd_introduction());
//				sb.append("</td><td>");
//				sb.append("<a href='/Test7.2/U?stype=delete&name=" + username +"'>ɾ��</a>");
//				sb.append("&nbsp;");
//				sb.append("<a href='userUpdate.jsp?name=" + username +"'>�޸�</a>");
//				sb.append("</td></tr>");
//			}
//		return sb;
//	}
//	public static void main(String[] args) {
//		 IUserDao d1=DaoFactory.getUserDaoInstance();
//		 System.out.println(d1.delete("DJ1456"));
//	}
}
