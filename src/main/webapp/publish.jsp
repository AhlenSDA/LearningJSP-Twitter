<%@ page import="com.sda.twitter.model.MyTweet" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sda.twitter.service.MyTwitterService" %>
<%@ page import="com.google.common.base.Strings" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>

<html>
<body>

<%!
    MyTwitterService service = MyTwitterService.getInstance();

%>

<form action="index.jsp" method="post">
    <fieldset>
        <ul>
            <li>Author: <input name="author" type="text" style="width:300px; height:50px; margin-left:30px"/></li>
            <li>Message: <textarea name="message" type="text"
                                   style="width:300px; height:50px; margin-left:30px"></textarea></li>
        </ul>
        <input type="submit" name="Submit" value="Submit" method="post">
    </fieldset>
</form>

<%
    String author = request.getParameter("author");
    String message = request.getParameter("message");

    if ((Strings.isNullOrEmpty(author) || Strings.isNullOrEmpty(message))) {
        out.print("Brak autora lub wiadomości!");
    } else {
        MyTweet myTweet = new MyTweet(author, message, System.currentTimeMillis());
        service.addTweet(myTweet);
    }
    for (MyTweet tweet : service.getMyTweetList()) {
        out.print("<br> Tweet Author: " + tweet.getAuthor() + "<br>");
        out.print("Tweet Message: " + tweet.getTweet() + "<br>");
        out.print("Tweet Date: " + tweet.getTimestamps() + "<br>");
    }
%>

</body>
</html>