package com.sda.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// @WebServlet(name ="firstServlet", value = "/hello")
public class FirstServlet extends HttpServlet {

    // http://localhost:8080/hello

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("Hello there");

        resp.addCookie(new Cookie("ciasteczko_1", "TheBigOne"));
    }
}
