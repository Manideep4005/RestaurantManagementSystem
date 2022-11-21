package com.rms.customer;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class CustomerBean implements Serializable{
	private int customerId;
	private String customerName;
	private String gender;
	private String email;
	private String address;
	private String mobileNumber;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	
	public ArrayList<CustomerBean> getCustomers() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<CustomerBean> cList = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from customer");
			CustomerBean cBean = null;
			cList = new ArrayList<CustomerBean>();
			
			while (rs.next()) {
				cBean = new CustomerBean();
				
				cBean.setCustomerId(rs.getInt("customer_id"));
				cBean.setCustomerName(rs.getString("customer_name"));
				cBean.setGender(rs.getString("gender"));
				cBean.setEmail(rs.getString("email"));
				cBean.setAddress(rs.getString("address"));
				cBean.setMobileNumber(rs.getString("mobile_number"));
				
				cList.add(cBean);
			}
		} 
		catch (Exception e) {
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
		
		return cList;
	}
}
