<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>
<br>
<br>
<style>
    * {
        box-sizing: border-box
    }

    body {
        font-family: 'Roboto Slab', serif;
        font-size: 17px;
        color: #344E41;
        background-color: #DAD7CD;
    }

    .brewerycontainer {
        position: relative;
        max-width: 800px;
        margin: 0 auto;
    }

    .brewerycontainer img {
        vertical-align: middle;
    }

    .brewerycontainer .content {
        position: absolute;
        bottom: 0;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.5);
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

    .photo-list-section {
        text-align: center;
        font-size: 20px;
        color: #f1f1f1;
        background-color: #588157;
        padding: 1em;
    }

    .flip-card {
        display: inline-block;
        background: transparent;
        width: 300px;
        height: 300px;
        perspective: 1000px;
    }

    .flip-card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.6s;
        transform-style: preserve-3d;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    .flip-card:hover .flip-card-inner {
        transform: rotateY(180deg);
    }

    .flip-card-front, .flip-card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .flip-card-front {
        background-color: #bbbbbb;
        color: black;
    }

    .flip-card-back {
        font-size: 16px;
        background-color: #344E41;
        color: white;
        width: 300px;
        height: 300px;
        transform: rotateY(180deg);
    }

    a {
        color: white;
    }

    a:hover {
        color: white;
        text-decoration: underline;
    }

    .limit {
        width: 300px;
        height: 180px;
        overflow-y: scroll;
    }

    .beerBtn {
        background-color: #588157;
        color: #f1f1f1;
    }

</style>

<h1 style="text-align: center; font-family: 'Calistoga', cursive;">Brewery Information Page</h1>
<c:url var="updateHref" value="/breweries/${breweryId}/update"/>
<h4>
    <c:set var="userId" value="${currentUser.id}"/>
    <c:set var="brewer" value="${brewery.brewer}"/>
    <c:if test = "${userId == brewer}">
        <div style="text-align: center;"><a class="nav-link" style="align-items: center;" href="${updateHref}">Update Brewery</a></div>
    </c:if>
</h4><br>

<!--Image with history overlay-->
<div class="brewerycontainer">
    <c:url var="image" value="/img/uploads/${brewery.image}"/>
    <img src="${image}" alt="Brewery Image" style="width:100%;">
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
        <p>Give us a call at ${breweryPhone}!</p>
    </div>
    <br>

    <!--On tap section-->
    <div class="beer-list-section">
        <h1 style="font-family: 'Calistoga', cursive; text-align: center">What's on tap at ${brewery.name}: </h1><br>

        <c:forEach var="beer" items="${beers}">
            <c:url var="beerHref"
                   value="/beer/${beer.id}"/>

            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <c:url var="beerImage" value="/img/uploads/${beer.image}"/>
                        <img src="${beerImage}" alt="beerPicture" style="width: 300px; height: 300px;">
                    </div>
                    <div class="flip-card-back">
                        <h1 style="font-size: 30px;"><i>${beer.name}</i></h1>
                        <div class="limit">
                            <p style="text-align: center;">${beer.description}</p>
                        </div>
                        <button class="beerBtn btn-block select"><a class="nav-link" href="${beerHref}">More Info...</a>
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:url var="addHref" value="/breweries/${breweryId}/addBeer"/>
        <c:url var="inactiveHref" value="/breweries/${breweryId}/inactiveBeers"/>

        <c:url var="editList" value="/breweries/${breweryId}/allBeers"/>
        <h5>
            <c:set var="userId" value="${currentUser.id}"/>
            <c:set var="brewer" value="${brewery.brewer}"/>
            <c:if test="${userId == brewer}">
                <a class="nav-link" href="${editList}">Edit Beer List</a> <br>

            </c:if>
        </h5>
    </div>
    <br>
    <div class="photo-list-section">
    <h2 style="font-family: 'Calistoga', cursive; text-align: center" href="${uploadImg}">Share a photo from your time at ${brewery.name}</h2>
    <c:if test="${currentUser.getRole().equals('beerLover')}">
        <c:url var="uploadImg" value="/breweries/${breweryId}/uploadImage"/>
        <h3><a class="btn btn-primary" style="background-color: #2b542c; border: #9d9d9d" href="${uploadImg}">Upload your image!</a> </h3>
        <br><br>
    </c:if>
    <c:forEach var="image" items="${images}">
        <c:url var="img" value="/img/uploads/${image}"/>
    <img src="${img}" alt="breweryPictures" style="width: auto; height:200px;">
    </c:forEach>
    </div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>