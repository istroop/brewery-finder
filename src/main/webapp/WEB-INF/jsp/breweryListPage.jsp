<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" >
    <c:param name="page" value="breweries" />
</c:import>

<br>
<br>

<h2>Welcome to the Brewery Finder!</h2>
<label>Below you can find all of the breweries currently in our database!</label>

<c:forEach var="brewery" items="${breweries}">
    <c:url var="breweryHref"
           value="/breweries/${brewery.id}"/>
    <h3>
        <a class="nav-link" href="${breweryHref}">${brewery.name}</a>
    </h3>
</c:forEach>





<c:import url="/WEB-INF/jsp/common/footer.jsp" />