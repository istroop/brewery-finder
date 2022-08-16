<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<html>
<head>
    <title>Brewery Information Page</title>
</head>
<body>

<%--Image for Brewery--%>
<%--<li>Brewery Image: ${brewery.image}</li>--%>


<h2>${brewery.name}</h2>
<h5>${brewery.history}</h5>


<p>
    <ul>
    <li>Address: ${brewery.address}</li>
    <li>Phone Number: ${brewery.phone}</li>
    <li>Hours of Operation: ${brewery.hoursOfOperation}</li>
    <br>
</ul>

<h4>Beers: </h4>
<ul>
    <c:forEach var="beer" items="${beers}">
        <li>${beer.name}</li>
    </c:forEach>
</ul>
</p>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
