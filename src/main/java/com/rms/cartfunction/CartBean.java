package com.rms.cartfunction;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;


public class CartBean implements Serializable {
	
	private Integer cartItemId;
	private Integer itemId;
	private String itemName;
	private Double price;
	
	
	public Integer getCartItemId() {
		return cartItemId;
	}
	
	public void setCartItemId(Integer cartItemId) {
		this.cartItemId = cartItemId;
	}
	
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
	public ArrayList<CartBean> getCartItems(Integer user_id) {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		
		ArrayList<CartBean> cList = new ArrayList<>();
		
		CartBean cBean = null;
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from cart where user_id = ?");
			pstmt.setInt(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				cBean =  new CartBean();
				
				cBean.setCartItemId(rs.getInt("cart_item_id"));
				cBean.setItemId(rs.getInt("product_id"));
				cBean.setItemName(rs.getString("product_name"));
				cBean.setPrice(rs.getDouble("price"));
				
				
				cList.add(cBean);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
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
		
		return cList;
	}
}
