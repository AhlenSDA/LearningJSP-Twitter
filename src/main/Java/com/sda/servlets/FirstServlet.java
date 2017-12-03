package com.sda.servlets;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


// @WebServlet(name ="firstServlet", value = "/hello")
public class FirstServlet extends HttpServlet {

    // http://localhost:8080/hello

    private static Logger log = Logger.getLogger(FirstServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("Hello there");

        //    resp.addCookie(new Cookie("ciasteczko_1", "TheBigOne"));

        String uri = req.getRequestURI();
        printWriter.println("Hello there, what is your name: " + uri);

        String[] split = uri.split("/");

        if (split.length == 3) {
            PrintWriter printWriter1 = resp.getWriter();
            printWriter1.println(split[1] + ", how are you doing? " +  " " + split[2]);
        }


    }


}
