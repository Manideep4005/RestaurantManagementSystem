package com.rms.members;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminAddToMemeberCustomer
 */
@WebServlet("/AdminAddToMemeberCustomer")
public class AdminAddToMemeberCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String cid = request.getParameter("cid");
		
		Timestamp stamp = Timestamp.from(Instant.now());
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("insert into members values(?, ?)");
			pstmt.setString(1, cid);
			pstmt.setTimestamp(2, stamp);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				System.out.println("Inserted into members");
			}
			
			response.sendRedirect("/RMS/displaymember");
		}	catch (SQLIntegrityConstraintViolationException e2) {
			session.setAttribute("adminCustomerAddMemeberError", "Customer already a memeber.");
			response.sendRedirect("/RMS/displaycustomer");
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
