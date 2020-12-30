<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  Pull in the core tag lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC demo</title>
</head>
<body>
<table border="1">

	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>email</th>
	</tr>
	<!--  for tempStudent in student_list -->
	<c:forEach var="tempStudent" items="${student_list}">
	
		<!--  print  student name -->
		<tr>
		<!--  thi calls the getter method getFIrstName on the student class -->
			<td>${tempStudent.firstName}</td>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.email}</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>