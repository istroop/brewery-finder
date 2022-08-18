<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<html>

<head>
    <title>Beer List</title>
</head>
<body>

<br>
<br>
<c:forEach var="brewery" items="${breweries}">
    <c:url var="breweryHref"
           value="/breweries/${brewery.id}"/>
    <h3>
        <a class="btn btn-block select" href="${breweryHref}">${brewery.name}</a>
    </h3>
</c:forEach>

<c:url var="newBreweryHref"
       value="/breweries/new"/>
<h3>
    <a class="btn btn-primary new-brewery" href="${newBreweryHref}">Add a Brewery</a>
</h3>

</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
