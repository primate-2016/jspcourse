<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies Personalise Response</title>
</head>
<body>
<%

	//read form data - match parameter name from cookies-personalise-form.html
	String favLang = request.getParameter("favouriteLanguage");

	// create the cookie
	Cookie theCookie = new Cookie("myApp.favouriteLanguage", favLang);
	
	// set the cookie lifespan
	theCookie.setMaxAge(60*60*24*365);
	
	// send the cookie to the browser
	response.addCookie(theCookie);

%>

	Thanks! Set favourite language to: ${param.favouriteLanguage}
	<br><br>
	<a href="cookies-homepage.jsp">Return to homepage</a>

</body>
</html>