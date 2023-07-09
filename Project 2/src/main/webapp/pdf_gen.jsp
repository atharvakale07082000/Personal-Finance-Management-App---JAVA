<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*,com.itextpdf.text.Document, com.itextpdf.text.pdf.PdfPCell, com.itextpdf.text.pdf.PdfPTable,com.itextpdf.text.pdf.PdfWriter,java.io.FileOutputStream,
com.itextpdf.text.Phrase"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pdf Report</title>
</head>
<body>
	<%
	String uname = (String) session.getAttribute("uname");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		if (conn != null) {
			// out.println("Conn not null");
		}
		PreparedStatement ps = conn.prepareStatement("select * from bill where uname=?");
		ps.setString(1, uname);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			String uname1 = rs.getString("uname");
			String bilname = rs.getString("bilname");
			String cat = rs.getString("cat");
			int amt = rs.getInt("amt");

		}

		/* Step-2: Initialize PDF documents - logical objects */
		Document my_pdf_report = new Document();
		PdfWriter.getInstance(my_pdf_report, new FileOutputStream("moneymoon.pdf"));
		my_pdf_report.open();
		my_pdf_report.newPage();

		//we have four columns in our table
		PdfPTable my_first_table = new PdfPTable(4);
		//create a cell object
		PdfPCell table_cell;

		while (rs.next()) {
			String uname1 = rs.getString("uname");
			table_cell = new PdfPCell(new Phrase(uname));
			my_first_table.addCell(table_cell);
			String bilname = rs.getString("bilname");
			table_cell = new PdfPCell(new Phrase(bilname));
			my_first_table.addCell(table_cell);
			String cat = rs.getString("cat");
			table_cell = new PdfPCell(new Phrase(cat));
			my_first_table.addCell(table_cell);
			int amt = rs.getInt("amt");
			table_cell = new PdfPCell(new Phrase(amt));
			my_first_table.addCell(table_cell);
		}
		
		my_pdf_report.add(my_first_table);
	
		
		rs.close();
		ps.close();
		my_pdf_report.close();
		
		conn.close();
    
		out.println("Sent succesfully");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	%>
</body>
</html>