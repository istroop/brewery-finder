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
<<<<<<< HEAD:src/main/webapp/WEB-INF/jsp/beerInfoPage.jsp
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

=======
<h3>${beer.name} Reviews</h3>

<c:url var="newReviewHref"
       value="/beer/${beerId}/reviews/new"/>
<h3>
    <a class="btn btn-primary" href="${newReviewHref}">Write a Review</a>
</h3>


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
>>>>>>> 629a66751900d320ee4a3f18ba992a5bd0e7e244:src/main/webapp/WEB-INF/jsp/beers/beerInfoPage.jsp
</p>

</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />

