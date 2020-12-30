<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  Pull in the tag lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC demo</title>
</head>
<body>

	<!--  for tempStudent in student_list -->
	<c:forEach var="tempStudent" items="${student_list}">
	
		<!--  print  student name -->
		${tempStudent} <br>
	
	</c:forEach>

</body>
</html>