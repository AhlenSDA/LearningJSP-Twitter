<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="utf-8" %>
<html>
<body>

<ul>

    <c:forEach var="i" begin="1" end="10">
        <li>Item No. <c:out value="${i}"/></li>
    </c:forEach>

    <c:catch var="MyOwnException">
        <% int x = 3 / 0; %>
    </c:catch>

    <br><br>
    <c:if test="${MyOwnException != null}">
        We have an error!
    </c:if>

</ul>
<br>


</body>
</html>