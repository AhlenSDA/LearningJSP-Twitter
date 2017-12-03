<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>


<html>
<body>

<ul>
    <%= request.getParameter("Marcin") %>
    <c:choose>
        <c:when test="${param.enter=='Marcin'}">
            There is number 1 inside!
        </c:when>

        <c:otherwise>
            Nothing was found there!
        </c:otherwise>
    </c:choose>
</ul>
<br>


</body>
</html>