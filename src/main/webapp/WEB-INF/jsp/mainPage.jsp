<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" >
    <c:param name="page" value="breweries" />
</c:import>

<br>
<br>

<style>
    .select {
        background-color: #a68fff;
        color: white;
        border: solid 2px #a68fff;
    }
    .select:hover {
        background-color: #b6abfc;
        color: white;
        border: solid 2px #b6abfc;
    }

    .new-brewery {
        background-color: #354df5;
        color: white;
        border: solid 2px #354df5;
    }
</style>

<h2>Welcome to the Brewery Finder!</h2>


<c:choose>
    <c:when test="${not empty currentUser}">

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


    </c:when>
    <c:otherwise>

        <label>Please login or sign up to be able to find a brewery!</label>

    </c:otherwise>
</c:choose>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
