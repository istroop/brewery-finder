<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<style>
    * {box-sizing: border-box;}

    body {
        font-family: 'Roboto Slab', serif;;
        font-size: 17px;
        color: #344E41;
        background-color: #DAD7CD;
    }

    .about-section {
        text-align: center;
        font-size: 20px;
        color: #f1f1f1;
        background-color: #588157;
        padding: 1em;
    }

    .review-section {
        text-align: center;
        font-size: 20px;
        color: #f1f1f1;
        background-color: #3A5A40;
        padding: 1em;
    }
</style>

<br>
<br>
    <h1 style="text-align: center; font-family: 'Calistoga', cursive;">Beer Information Page</h1><br>

    <img src="${beer.image}" alt="beerPicture" style="width: 100%">
<br>

<div class="about-section">
<h2 style="text-align: center; font-family: 'Calistoga', cursive;">More about ${beer.name}</h2><br>


<c:if test="${beer.brewer == currentUser.id}">
    <c:url var="updateHref" value="/beer/${beerId}/update"/>
    <h5>
        <a class="nav-link" href="${updateHref}">Update Beer</a>
    </h5>
</c:if>

<p style="font-size: 25px;">${beer.description}</p>


<p>
<ul style="list-style: none;">
    <li>ABV: ${beer.abv}%</li>
    <li>Beer Type: ${beer.beerType}</li>
    <br>
</ul>
</p>
</div>

<div class="review-section">
    <br>
<h1 style="text-align: center; font-family: 'Calistoga', cursive;">${beer.name} Reviews</h1>

<c:choose>
    <c:when test="${averageRating > 0}">
        <h4>Average Rating: ${averageRating} out of 5!</h4>

        <hr>

        <c:forEach var="review" items="${reviews}">
            <h4>${review.getReviewTitle()} <small>by: ${review.getUsername()}</small></h4>
            <c:set var="rating" value="${review.getRating()}"/>
            <c:url var="beermugurl" value="/img/newbeers.png"/>
            <c:forEach begin="1" end="${rating}">
                <a> <img class="ratingStar" src="${beermugurl}"/></a>
            </c:forEach>
            <p>${review.getReview()}</p>
            <br>
        </c:forEach>

    </c:when>
    <c:otherwise>
        <hr>
        <h4>There has not been a review for this beer yet! :(</h4>
    </c:otherwise>
</c:choose>

<c:if test="${currentUser.role.equals('beerLover')}">
    <c:url var="newReviewHref"
           value="/beer/${beerId}/reviews/new"/>
    <h3>
        <a class="btn btn-primary" href="${newReviewHref}">Write a Review</a>
    </h3>
</c:if>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>

