<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Confirmation</title>
</head>
<body>

The student is confirmed: ${param.firstName} ${param.lastName}
<br><br>
The student lives in: ${param.country}
<br><br>
Their favourite programming language is: ${param.favouriteLanguage}
<br><br>
Their favourite Ice Cream flavours are:
<!--  display list of favouriteIceCream -->
	<% 
		String[] flavours = request.getParameterValues("favouriteIceCream");
		
		// check for null in case no value was entered or get null pointer exception
		if (flavours != null) {
			for (String tempFlavour : flavours) {
				out.println("<li>" + tempFlavour + "</li>");
			}
		}
	%>

</body>
</html>