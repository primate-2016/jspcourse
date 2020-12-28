<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies Homepage</title>
</head>
<body>

<!--  read the favourite programming language cookie -->
<%

	// the default ... if there are no cookies
	String favLang = "Java";

	// get the coolies from the browser request
	Cookie[] theCookies = request.getCookies();
	
	// find out favourite lamguage cooie
	if (theCookies != null) {
		
		for (Cookie tempCookie : theCookies) {
			
			if ("myApp.favouriteLanguage".equals(tempCookie.getName())) {
				favLang = tempCookie.getValue();
				break;
			}
		}
	}

%>

<!--  now show a personalised page based on the cookie value -->

<h4>New books for <%= favLang %></h4>
<ul>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	
</ul>

<h4>New jobs for <%= favLang %></h4>
<ul>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	
</ul>
<hr>
<a href="cookies-personalise-form.html">Personalise this page with a cookie</a>
</body>
</html>