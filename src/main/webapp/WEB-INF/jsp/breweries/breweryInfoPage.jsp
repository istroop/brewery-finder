<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>
<br>
<br>
    <style>
        * {box-sizing: border-box}

        body {
            font-family: 'Roboto Slab', serif;;
            font-size: 17px;
            color: #344E41;
            background-color: #DAD7CD;
        }

        .brewerycontainer {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
        }

        .brewerycontainer img {vertical-align: middle;}

        .brewerycontainer .content {
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

        .hours-section {
            text-align: center;
            font-size: 20px;
            color: #f1f1f1;
            background-color: #588157;
            padding: 1em;
        }

        .contact-section {
            text-align: center;
            font-size: 20px;
            color: #f1f1f1;
            background-color: #344E41;
            padding: 1em;
        }

        .address-section {
            text-align: center;
            font-size: 20px;
            color: #f1f1f1;
            background-color: #3A5A40;
            padding: 1em;
        }

        .beer-list-section {
            text-align: center;
            font-size: 20px;
            color: #f1f1f1;
            background-color: #A3B18A;
            padding: 1em;
        }

        a {
            color: white;
        }

        a:hover {
            color: white;
            text-decoration: underline;
        }
    </style>

<h1 style="text-align: center; font-family: 'Calistoga', cursive;">Brewery Information Page</h1><br>
<c:url var="updateHref" value="/breweries/${breweryId}/update"/>
<h5>
    <c:set var="userId" value="${currentUser.id}"/>
    <c:set var="brewer" value="${brewery.brewer}"/>
    <c:if test = "${userId == brewer}">
        <a class="nav-link" href="${updateHref}">Update Brewery</a>
    </c:if>
</h5>

<!--Image with history overlay-->
<div class="brewerycontainer">
    <img src="${brewery.image}" alt="Brewery Image" style="width:100%;">
    <div class="content">
        <h1 style="font-family: 'Calistoga', cursive;">Welcome to ${brewery.name}</h1>
        <p class="indent" style="font-family: 'Roboto Slab', serif;">${brewery.history}</p>
    </div>
</div>

<!--Address, HOO section-->
<div>
    <h1 style="text-align: center; font-family: 'Calistoga', cursive;">About This Brewery: </h1><br>
    <div class="hours-section">
        <h1 style="font-family: 'Calistoga', cursive;">Hours of Operation: </h1><br>
        <p>${brewery.hoursOfOperation}</p>
    </div>

    <div class="address-section">
        <h1 style="font-family: 'Calistoga', cursive;">Find Us At: </h1><br>
            <p>${brewery.address}</p>
    </div>

<div class="contact-section">
        <h1 style="font-family: 'Calistoga', cursive;">Contact Information: </h1><br>
        <p>Give us a call at ${brewery.phone}!</p>
</div>
<br>

<div class="beer-list-section">
<h1 style="font-family: 'Calistoga', cursive; text-align: center">What's on tap at ${brewery.name}: </h1><br>

<c:url var="addHref" value="/breweries/${breweryId}/addBeer"/>
<h5>
    <c:set var="userId" value="${currentUser.id}"/>
    <c:set var="brewer" value="${brewery.brewer}"/>
    <c:if test = "${userId == brewer}">
        <a class="nav-link" href="${addHref}">Add Beer</a>
    </c:if>
</h5>

    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="/beer/${beer.id}"/>
        <h3>
            <a class="nav-link" href="${beerHref}">${beer.name}</a>
        </h3>
    </c:forEach>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />