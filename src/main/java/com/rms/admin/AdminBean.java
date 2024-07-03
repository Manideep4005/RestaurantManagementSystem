package com.rms.admin;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

@SuppressWarnings("serial")
public class AdminBean implements Serializable {
	
	private Integer adminId;
	private String adminName;
	private String password;
	private String email;
	private Long contact;
	private String address;
	
	
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getContact() {
		return contact;
	}
	public void setContact(Long contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public ArrayList<AdminBean> getAdminList() {
		
		Statement stmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		ArrayList<AdminBean> aList = new ArrayList<>();
		
		AdminBean aBean = null;
		
		try {
			
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("select * from admin");
			
			while (rs.next()) {
				aBean = new AdminBean();
				
				
				aBean.setAdminId(rs.getInt("user_id"));
				aBean.setAdminName(rs.getString("username"));
				aBean.setPassword(rs.getString("password"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setAddress(rs.getString("address"));
				
				
				aList.add(aBean);
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				
				
				if (con != null) {
					con.close();
				}
				
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		
		}
		
		return aList;
	}
	
	
	
public ArrayList<AdminBean> getAdminById(String adminId) {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		ArrayList<AdminBean> aList = new ArrayList<>();
		
		AdminBean aBean = null;
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from admin where user_id = ?");
			pstmt.setString(1, adminId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aBean = new AdminBean();
				
				
				aBean.setAdminId(rs.getInt("user_id"));
				aBean.setAdminName(rs.getString("username"));
				aBean.setPassword(rs.getString("password"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setAddress(rs.getString("address"));
				
				
				aList.add(aBean);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				
				if (con != null) {
					con.close();
				}
				
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		
		}
		
		return aList;
	}
}
