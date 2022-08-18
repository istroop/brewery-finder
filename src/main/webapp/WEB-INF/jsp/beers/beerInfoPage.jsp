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

<c:url var="updateHref" value="/beer/${beerId}/update"/>
<h5>
    <a class="nav-link" href="${updateHref}">Update Brewery</a>
</h5>

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
        <c:url var="newReviewHref"
               value="/beer/${beerId}/reviews/new"/>
        <h3>
            <a class="btn btn-primary" href="${newReviewHref}">Write a Review</a>
        </h3>
        </c:when>

    <c:when test="${currentUser.role.equals('brewer')}">
        <c:choose>
            <c:when test="${averageRating > 0}">
                <h4>Average Rating: ${averageRating} out of 5!</h4>
            </c:when>
            <c:otherwise>
                <h4>There has not been a review for this beer yet! :(</h4>
            </c:otherwise>
        </c:choose>
    </c:when>

    </c:choose>

</p>

</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />

