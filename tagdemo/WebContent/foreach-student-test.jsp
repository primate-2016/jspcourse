<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!--  Pull in the tag liv -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  pull in the class we created under Java Resources -->
<%@ page import="java.util.*,com.love2code.jsp.tagdemo.Student" %>

<!--  create some sample data - normally provided by MVC -->

<%
	// make a list of student objects called 'data'
	List<Student> data = new ArrayList<>();

	// create object of the student class imported above
	data.add(new Student("John", "Doe", false));
	data.add(new Student("Debbie", "Doe", false));
	data.add(new Student("Maxwell", "Johnson", true));
	
	// set a page attribute of myStudents to the value of 'data'
	pageContext.setAttribute("myStudents", data);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students</title>
</head>
<body>
	<table border="1">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Gold Customer</th>
	</tr>
	
	<!--  use trhe forEach tag to loop through myStudents page attribute above -->
	<c:forEach var="tempStudent" items="${myStudents}">
	<tr>
	<!--  use JSP expression language to output the values -->
		<td>${tempStudent.firstName}</td>
		<td>${tempStudent.lastName}</td>
		<td>
		
			<c:if test="${tempStudent.goldCustomer}">
				Special Discount
			</c:if>	
			<!--  there is no else tag, so use not -->
			<c:if test="${not tempStudent.goldCustomer}">
				No Discount
			</c:if>	
			
		</td>
	
	</tr>
	</c:forEach>
 	</table>
 	
 	<!--  handle the above better using choose tag -->

	<hr><br><br>
		<table border="1">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Gold Customer</th>
	</tr>
	
	<!--  use trhe forEach tag to loop through myStudents page attribute above -->
	<c:forEach var="tempStudent" items="${myStudents}">
	<tr>
	<!--  use JSP expression language to output the values -->
		<td>${tempStudent.firstName}</td>
		<td>${tempStudent.lastName}</td>
		<td>
		
			<c:choose>

					<c:when test="${tempStudent.goldCustomer}">
						Special Discount
					</c:when>
					<!--  can have mutiple when's here matching different things -->
					<c:otherwise>
						no soup for you!
					</c:otherwise>

			</c:choose>
			
		</td>
	
	</tr>
	</c:forEach>
 	</table>

</body>
</html>