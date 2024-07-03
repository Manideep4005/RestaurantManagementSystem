package com.rms.sales;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class SalesNewBean implements Serializable{
	private int customerid;
	private Date orderDate;
	
	
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public ArrayList<SalesNewBean> getSales()	{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<SalesNewBean> sList = null;
		SalesNewBean sBean = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from sales_new");
			sList = new ArrayList<SalesNewBean>();
			
			while (rs.next()) {
				sBean = new SalesNewBean();
				
				sBean.setCustomerid(rs.getInt("customer_id"));
				sBean.setOrderDate(rs.getDate("order_date"));
				
				sList.add(sBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
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
		return sList;
	}
}
