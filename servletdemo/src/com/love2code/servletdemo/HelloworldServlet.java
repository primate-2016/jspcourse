package com.love2code.servletdemo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloworldServlet
 */

// the below is the path that the servlet can be accessed from
@WebServlet("/HelloworldServlet")
public class HelloworldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloworldServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // doGet method is what is returned when the browser GETS from the servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// modified code from here.......
		//Set the content type
		response.setContentType("text/html");
		
		//get the printWriter (import above)
		PrintWriter out = response.getWriter();
		
		//generate HTML content
		out.println("<html><body>");
		
		out.println("<h2>Hello World</h2>");
		out.println("<hr>");
		out.println("Time on the server is:" + new java.util.Date());
		
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
