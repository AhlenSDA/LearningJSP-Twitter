<%@ page import="com.sda.servlets.MyTweet" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>

<html>
<body>

<%! // Map<String, String> tweetMap = new LinkedHashMap<>();
    List<MyTweet> tweetsList = new LinkedList<>();
%>

<form action="index.jsp" method="post">
    <fieldset>
        <ul>
            <li>Author: <input name="author" type="text" style="width:300px; height:50px; margin-left:30px"/></li>
            <li>Message: <input name="message" type="text" style="width:300px; height:50px; margin-left:30px"/></li>
        </ul>
        <input type="submit" name="Submit" value="Submit" method="post">
    </fieldset>
</form>

<form>
    <fieldset>
        <!-- error here probably -->
        <p>Users logs and msgs list</p>
        <p><c:out value="${param.userName}"/></p>
        <p><c:out value="${param.tweet}"/></p>
    </fieldset>
</form>

<%
    String author = request.getParameter("author");
    String message = request.getParameter("message");

    if (author == null || message == null) {
        out.print("Brak autora lub wiadomości!");
    } else {
        MyTweet myTweet = new MyTweet(author, message, System.currentTimeMillis());
        tweetsList.add(myTweet);
    }
    for (MyTweet tweet : tweetsList) {
        out.print("Tweet Author: " + tweet.getAuthor() + "<br>");
        out.print("Tweet Message: " + tweet.getTweet() + "<br>");
        out.print("Tweet Date: " + tweet.getTimestamps() + "<br>");
    }

%>

</body>
</html>