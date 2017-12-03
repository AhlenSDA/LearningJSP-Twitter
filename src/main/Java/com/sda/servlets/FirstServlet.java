package com.sda.servlets;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// @WebServlet(name ="firstServlet", value = "/hello")
public class FirstServlet extends HttpServlet {

    // http://localhost:8080/hello

    private static Logger log = Logger.getLogger(FirstServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.debug("GET executed");
        for (Cookie cookie : req.getCookies()) {
            if ("my-cookie".equals(cookie.getName())) {
                log.debug("Eat cookie");
                resp.getWriter().println(cookie.getValue());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        log.debug("POST executed");
        Cookie cookie = new Cookie("my-cookie", "123");
        resp.addCookie(cookie);
        log.debug("Cookie has been added");
    }
}
