<html>
<body>
<h3>Hello World of Java!! :)</h3>

The time on the server is <%= new java.util.Date() %>
<br><br>
<h2>Some JSP Expressions</h2>
Converting a string to uppercase: <%= new String("Hello World").toUpperCase() %>
<br><br>
25 multiplied by 4 equals <%= 25*4 %>
<br><br>
Is 75 less than 69? <%= 75 < 69 %>
<h2>Some JSP Scriptlet</h2>
<%

	for (int i=1; i<=5; i++) {
		out.println("<br>I really love to code: " + i);
	}

%>
<h2>JSP Declaration example</h2>
<%!
	String makeItLower(String data) {
	return data.toLowerCase();
}
%>

lower case "Hello World": <%= makeItLower("Hello World") %>
lower case "Hello World": <%= makeItLower("Hello World") %>
lower case "Hello World": <%= makeItLower("Hello World") %>

</body>
</html>