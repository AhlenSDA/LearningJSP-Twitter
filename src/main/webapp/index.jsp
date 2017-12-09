<%@ page import="com.sda.twitter.model.MyTweet" %>
<%@ page import="com.sda.twitter.service.MyTwitterService" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<!-- list tweets -->
<head>
    <title>SDA INDEX</title>
</head>
<body>

<p>
    <a href="publish.jsp">Publish tweet</a>
</p>

<%!
    MyTwitterService service = MyTwitterService.getInstance();
%>

<%
    for (MyTweet tweet : service.getMyTweetList()) {
        out.print("<br> Tweet Author: " + tweet.getAuthor() + "<br>");
        out.print("Tweet Message: " + tweet.getTweet() + "<br>");
        out.print("Tweet Date: " + tweet.getTimestamps() + "<br>");
    }
%>

</body>
</html>