<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" >
    <c:param name="page" value="breweries" />
</c:import>


<h2>Welcome to the Brewery Finder!</h2>

<c:forEach var="brewery" items="${breweries}">
    <h3>${brewery.name}</h3>
</c:forEach>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />