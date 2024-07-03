package com.rms.menuadmin;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class AdminMenuBean implements Serializable {
	private int productId;
	private String productName;
	private double price;
	private String category;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	public ArrayList<AdminMenuBean> getMenu() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<AdminMenuBean> aList = null;
		AdminMenuBean aBean = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from menu");
			aList = new ArrayList<>();
			
			while (rs.next()) {
				aBean = new AdminMenuBean();
				
				aBean.setProductId(rs.getInt("product_id"));
				aBean.setProductName(rs.getString("product_name"));
				aBean.setPrice(rs.getDouble("price"));
				aBean.setCategory(rs.getString("category"));
				
				aList.add(aBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return aList;
	}
	
	
	public ArrayList<AdminMenuBean> getMenuByCategory(String category) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<AdminMenuBean> aList = null;
		AdminMenuBean aBean = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.prepareStatement("select * from menu where category = ?");
			stmt.setString(1, category);

			rs = stmt.executeQuery();
			
			aList = new ArrayList<>();
			
			while (rs.next()) {
				aBean = new AdminMenuBean();
				
				aBean.setProductId(rs.getInt("product_id"));
				aBean.setProductName(rs.getString("product_name"));
				aBean.setPrice(rs.getDouble("price"));
				aBean.setCategory(rs.getString("category"));
				
				aList.add(aBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return aList;
	}
	
	
	public ArrayList<AdminMenuBean> getMenuById(Integer id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<AdminMenuBean> aList = null;
		AdminMenuBean aBean = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.prepareStatement("select * from menu where product_id = ?");
			stmt.setInt(1, id);

			rs = stmt.executeQuery();
			
			aList = new ArrayList<>();
			
			while (rs.next()) {
				aBean = new AdminMenuBean();
				
				aBean.setProductId(rs.getInt("product_id"));
				aBean.setProductName(rs.getString("product_name"));
				aBean.setPrice(rs.getDouble("price"));
				aBean.setCategory(rs.getString("category"));
				
				aList.add(aBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return aList;
	}
}
