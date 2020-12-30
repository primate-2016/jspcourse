package com.love2code.servletdemo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet({ "/StudentServlet", "/anotherURL" })
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // this is the method that is called from our form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Set the content type
		response.setContentType("text/html");
		
		// get the printwriter - need to import it
		PrintWriter out = response.getWriter();
		
		// generate the HTML content
		out.println("<html><body>");
		
		out.println("The Student is confirmed: "
					+ request.getParameter("firstName") + " "
					+ request.getParameter("lastName"));
		
		
		// read in the config params from the web.xml
		
		// need to import ServletContext
		ServletContext context = getServletContext(); //inherited from httpServlet
		String maxCartSize = context.getInitParameter("max-shopping-cart-size");
		String teamName = context.getInitParameter("team-name");
		
		//generate HTML context
		
		out.println("<br><br>");
		out.println("The max cart size is: " + maxCartSize);
		out.println("<br><br>");
		out.println("The team name is: " + teamName);
		
		
		out.println("</body></html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
