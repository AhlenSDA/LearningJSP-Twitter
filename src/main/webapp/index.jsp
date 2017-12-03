<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>


<html>
<body>

<%! Map<String, String> tweetMap = new LinkedHashMap<>(); %>

<form action="index.jsp" method="post">
    <fieldset>
        <ul>
            <li>User name: <input name="userName" type="text" style="width:300px; height:50px; margin-left:30px"/></li>
            <li>Tweet msg: <input name="tweet" type="text" style="width:300px; height:50px; margin-left:30px"/></li>
        </ul>
        <input type="submit" name="Submit" value="Submit" action="/action_page.php" method="post">
    </fieldset>
</form>

<form>
    <fieldset>
        <p>Users logs and msgs list</p>
        <p><c:out value="${param.userName}"/></p>
        <p><c:out value="${param.tweet}"/></p>
    </fieldset>
</form>

<%
    String userName = request.getParameter("userName");
    String tweet = request.getParameter("tweet");
    if (userName != null && tweet != null) {
        tweetMap.put(userName, tweet);
    }

    for (int i = 0; i < tweetMap.size(); i++) {
        System.out.println("User: " + tweetMap.keySet() + "\n");
        System.out.println("Msg: " + tweetMap.keySet() + "\n");
    }
%>

</body>
</html>