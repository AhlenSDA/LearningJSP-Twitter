package com.sda.twitter.servlets;

import com.google.common.base.Strings;
import com.sda.twitter.model.MyTweet;
import com.sda.twitter.service.MyTwitterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "publishServlet", value = "/publish")
public class PublishServlet extends HttpServlet {

    public static final String AUTHOR_COOKIE = "author-cookie";

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MyTwitterService service = MyTwitterService.getInstance();

        String author = (String) req.getParameter("author");
        String message = (String) req.getParameter("message");

        if ((Strings.isNullOrEmpty(author) || Strings.isNullOrEmpty(message))) {
            resp.sendRedirect("/publish.jsp?error");
        } else {
            Cookie cookie = new Cookie(AUTHOR_COOKIE, author);
            cookie.setMaxAge(60*30);
            resp.addCookie(cookie);

            MyTweet myTweet = new MyTweet(author, message, System.currentTimeMillis());
            service.addTweet(myTweet);
            resp.sendRedirect("/index.jsp");
        }
    }
}