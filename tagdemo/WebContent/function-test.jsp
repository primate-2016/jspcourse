<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  Pull in the tag lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  Pull in the tag lib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Function tag lib test</title>
</head>
<body>

<c:set var="data" value="love2code" />

<!--  use JSP expression language to print out data and the function tag to get length -->
Length of the string <b>${data}</b>: ${fn:length(data)}

<br><br>

Uppercase version of the string <b>${data}</b>: ${fn:toUpperCase(data)}

<br><br>

Does the string <b>${data}</b> start with <b>love</b>?: ${fn:startsWith(data, "love")}


</body>
</html>