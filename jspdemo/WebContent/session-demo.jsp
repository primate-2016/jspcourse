<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Demo</title>
</head>
<body>

<!--  this form writes back to itself in the action rather than another page -->
<form action="session-demo.jsp">

	Add new item: <input type="text" name="theItem" />
	
	<input type="submit" value="Add to list" />

</form>

<!--  Display the last entered item for troubleshooting -->
<br><br>Last Item entered: <%= request.getParameter("theItem") %><br><br>

<!--  Add the new Item to the to do list -->

<%
	// get the to do items from the session, downcast to List<String>
	List<String> items = (List<String>) session.getAttribute("myToDoList");

	// if the to do items list doesn't exist, then create o new one in the session
	if (items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	// see if there is form data to add
	// we add form data above, each entry is called "theItem"
	// so check to see if exists in the requests object and add
	// to myToDoList
	String theItem = request.getParameter("theItem");
	
	// CHeck to make sure the item is not empty
	// and check to make sure the item hasn't already been added
	// e.g. by a browser refresh
	boolean isItemNotEmpty = theItem != null && theItem.trim().length() > 0;
	boolean isItemNotDuplicate = theItem != null && !items.contains(theItem.trim());
	
	if (isItemNotEmpty && isItemNotDuplicate) {    		
		items.add(theItem.trim());    		
	}
%>

<!--  Display all to do items -->
<hr>
<b>To Do List items:</b><br />
<ol>
<%
	for (String toDoItem : items) {
		out.println("<li>" + toDoItem + "</li>");
	}
%>
</ol>

</body>
</html>