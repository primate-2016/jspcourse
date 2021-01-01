package com.love2code.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	// setup connection to db - use same name as in context.xml
	// create a datasource called dataSource (connection to the connection pool)
	// import the javax versions of Resource and DataSource
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// setup the printWriter to return data to the browser
		// import java.io PrintWriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		
		// connect to the database
		// import the classes from java.sql
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myResults = null;
		
		
		try {
			myConn = dataSource.getConnection();
			
			// create a SQL statement
			String sql = "select * from student";
			myStmt = myConn.createStatement();
			// execute a SQL statement
			myResults = myStmt.executeQuery(sql);
			// loop through the results set line by line
			// find the email address and send back to the browser
			while (myResults.next()) {
				String email = myResults.getString("email");
				out.println(email);
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		
	}

}
