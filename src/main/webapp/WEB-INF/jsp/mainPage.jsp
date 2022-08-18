<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" >
    <c:param name="page" value="breweries" />
</c:import>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>
<br>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    * {box-sizing: border-box;}
    body {font-family: 'Roboto Slab', serif;; color: #132A13; margin: 0; background-color: #F2EDDB}
    .mySlides {display: none}
    img {vertical-align: middle;}

    .slideshowContainer{
        max-width: 1000px;
        position: relative;
        margin: auto;
    }

    .caption{
        color: #f2f2f2;
        font-size: 25px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
    }

    .numberText {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    .dot {
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 1.0s ease;
    }

    .active {
        background-color: #717171;
    }

    .fade {
        animation-name: fade;
        animation-duration: 6.0s;
    }

    @keyframes fade {
        from {opacity: .4}
        to {opacity: 1}
    }

    @media only screen and (max-width: 300px) {
        .caption {font-size: 11px}
    }

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
</style>
</head>

<body>
<br>
<br>
<h1 style="text-align: center; font-family: 'Calistoga', cursive;">Welcome to Brewery Finder!</h1>
<br>
<!--Slideshow pictures-->
<div class="slideshowContainer">

    <div class="mySlides fade">
        <div class="numberText">1 / 3</div>
        <img src="https://i.imgur.com/1morBSr.png" style="width: 100%">
        <div class="caption"> Welcome to Brewery Finder!</div>
    </div>

    <div class="mySlides fade">
        <div class="numberText">2 / 3</div>
        <img src="https://i.imgur.com/5I4bfk7.jpeg" style="width: 100%">
        <div class="caption"> Explore different breweries!</div>
    </div>

    <div class="mySlides fade">
        <div class="numberText">3 / 3</div>
        <img src="https://i.imgur.com/tswUP3b.jpeg" style="width: 100%">
        <div class="caption"> Find your new favorite beer today!</div>
    </div>
</div>
<br>

<div style="text-align: center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>

<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display="none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 6000)
    }
</script>
</body>

<br>
<body>
<!--Description and instructions-->
<h2 style="text-align: center; font-family: 'Calistoga', cursive;">About Our Site: </h2>
<p style="font-size: large"> The Brewery Finder was created to show registered users information for breweries and beers in our database! Some of our site's functionality includes: </p>
    <ul style="font-size: large">
        <li> <b><i>Beer Lovers</i></b> can view information about breweries and beers, leave reviews, and upload pictures.</li>
        <li> <b><i>Brewers</i></b> can update information about their products as well as upload pictures of their products.</li>
        <li> <b><i>Admins</i></b> are able to register new breweries to the database for Beer Lovers and Brewers to view. </li>
</ul>
<p style="font-size: large"> We hope you enjoy your Brewery Finder experience. Happy Brewing!</p>


<c:choose>
    <c:when test="${not empty currentUser}">

        <c:forEach var="brewery" items="${breweries}">
            <c:url var="breweryHref"
                   value="/breweries/${brewery.id}"/>
            <h3>
                <a class="btn btn-block select" href="${breweryHref}">${brewery.name}</a>
            </h3>
        </c:forEach>


    </c:when>
    <c:otherwise>
        <br>
        <p style="font-size: medium; font-weight: bold">Getting started is easy! Simply <a href="${pageContext.request.contextPath}/users/new">Sign Up</a> for an account and begin your Brewery Finder experience today!</p>
        <p style="font-size: medium; font-weight: bold; text-indent: 20px"> Already have an account? <a href="${pageContext.request.contextPath}/login">Log In</a> to continue your experience!</p>

    </c:otherwise>
</c:choose>

</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
