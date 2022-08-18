<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<html>
<br>
<br>

<head>
    <title>Beer Information Page</title>
</head>
<body>

<br>
<br>

<%--Image for Beer--%>

<br>
<br>
<h2>${beer.name}</h2>
<h5>${beer.description}</h5>


<p>
<ul>
    <li>ABV: ${beer.abv}%</li>
    <li>Beer Type: ${beer.beerType}</li>
    <br>
</ul>
</p>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />

