package com.rms.members;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class MemberBean implements Serializable {
	private int customerId;
	private Timestamp joindate;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp timestamp) {
		this.joindate = timestamp;
	}
	
	public ArrayList<MemberBean> getMembers() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MemberBean> mList = null;
		MemberBean mBean = null;
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from members");
			mList = new ArrayList<MemberBean>();
			
			while (rs.next()) {
				mBean = new MemberBean();
				
				mBean.setCustomerId(rs.getInt("customer_id"));
				mBean.setJoindate(rs.getTimestamp("join_date"));
				
				mList.add(mBean);
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
		
		return mList;
	}
}
