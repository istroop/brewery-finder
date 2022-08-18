<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<html>

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

<p>
<br>
<c:choose>
    <c:when test="${currentUser.role.equals('beerLover')}">
        <h3>${beer.name} Reviews</h3>
        <hr>
        <c:forEach var="review" items="${reviews}">
            <h4>${review.getReviewTitle()} <small>by: ${review.getUsername()}</small> </h4>
            <c:set var="rating" value="${review.getRating()}"/>
            <c:forEach begin="1" end="${rating}">
                <a>* </a>
            </c:forEach>
            <p>${review.getReview()}</p>
            <br>
        </c:forEach>
        </c:when>
    <c:when test="${currentUser.role.equals('brewer')}">
        <h4>Average Rating: ${averageRating} out of 5!</h4>
    </c:when>
    </c:choose>

</p>

</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />

