<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<br>
<br>
<br>
<br>
<head>
    <meta name = "viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 17px;
        }
        .container {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
        }

        .container img {vertical-align: middle;}

        .container .content {
            position: absolute;
            bottom: 0;
            background: rgb(0,0,0);
            background: rgba(0,0,0,0.5);
            color: #f1f1f1;
            width: 100%;
            padding: 20px;
        }
        p.indent {
            text-indent: 20px;
        }
    </style>
</head>

<body>
<title>Brewery Information Page</title>

<div class="container">
    <img src="${brewery.image}" alt="Brewery Image" style="width:100%;">
    <div class="content">
        <h1>Welcome to ${brewery.name}</h1>
        <p class="indent">${brewery.history}</p>
    </div>
</div>
<div>
    <ul>
    <li>You can find us at: ${brewery.address}</li><br>
    <li>During our hours: ${brewery.hoursOfOperation}</li><br>
    <li>Or contact us at: ${brewery.phone}</li><br>
    </ul>
</div>
    <c:url var="updateHref" value="/breweries/${breweryId}/update"/>
<div>
<h5>
    <c:if test="${currentUser.getRole()}=brewer">
        <a class="nav-link" href="${updateHref}">Update Brewery</a>
    </c:if>
</h5>
<ul>
    <li>You can find us at: ${brewery.address}</li>
    <li>During our hours: ${brewery.hoursOfOperation}</li>
    <li>Or contact us at: ${brewery.phone}</li>
    <br>
</ul>
</div>
<h4 style="color: mediumpurple">What's on tap at ${brewery.name}: </h4><br>
<ul>
    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="/beer/${brewery.id}"/>
        <h3>
            <a class="nav-link" href="${beerHref}">${beer.name}</a>
        </h3>
    </c:forEach>
</ul>
</p>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />