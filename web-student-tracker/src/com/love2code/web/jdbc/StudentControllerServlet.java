package com.love2code.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// make a reference tot he StudenDbUtil DAO class we created
	private StudentDbUtil studentDbUtil;
	
	// inject the database connection from context.xml
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	
	
	
	// override the default init method - stuff you would normallu do in a 
	// constructor, you do in a init() in a servlet
	@Override
	public void init() throws ServletException {

		super.init();
		
		// create instance of our student db util and pass in the datasource connection pool object
		
		try {
			// pass in the connection defined in context.xml to our DAO StudentDbUtil class
			studentDbUtil = new StudentDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}




	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// this method will respond to the browser's GET request
		// we read the "command" parameter - see the add-student-form.jsp where we have
		// a hidden field which sets the command type which we can use conditionally here
		
		try {
			//read the command parameter
			String theCommand = request.getParameter("command");
			
			// if the command param is missing, default to listing students
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				// list the students in MVC fashion
				listStudents(request, response);
				break;
				
			case "ADD":
				addStudent(request, response);
				break;
				
			default:
				listStudents(request, response);
			}
			
			
			
	

		} catch (Exception e) {
			// throw exception so it appears in browser
			throw new ServletException(e);
		}
		
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// get Students from db util
		List<Student> students = studentDbUtil.getStudents();
		
		// add students to the request
		request.setAttribute("STUDENT_LIST", students);
		
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// read student info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		// create a new student object
		Student theStudent = new Student(firstName, lastName, email);
		
		// add the student to the database
		studentDbUtil.addStudent(theStudent);
		
		// send back to main page (the student list)
		listStudents(request, response);
		
	}

}



