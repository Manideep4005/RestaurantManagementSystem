package com.dbutil;

public class CurrentDate {
	
	
	public static java.sql.Date getCurrentDate() {
		java.sql.Date sqlCurrentDate = null;
		
		try {
			java.util.Date utilDate= java.util.Calendar.getInstance().getTime();
			sqlCurrentDate = new java.sql.Date(utilDate.getTime());
//			System.out.println(sqlCurrentDate);
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlCurrentDate;
	}
	
}
