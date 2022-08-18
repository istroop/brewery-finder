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

        .w3-container,.w3-panel{padding:0.01em 16px}.w3-panel{margin-top:16px;margin-bottom:16px}

        .w3-container:after,.w3-container:before,.w3-panel:after,.w3-panel:before,.w3-row:after,.w3-row:before,.w3-row-padding:after,.w3-row-padding:before,
        .w3-cell-row:before,.w3-cell-row:after,.w3-clear:after,.w3-clear:before,.w3-bar:before,.w3-bar:after{content:"";display:table;clear:both}


        .w3-padding-64{padding-top:64px!important;padding-bottom:64px!important}

        .w3-blue-grey,.w3-hover-blue-grey:hover,.w3-blue-gray,.w3-hover-blue-gray:hover{color:#fff!important;background-color:#607d8b!important}

        .w3-xlarge{font-size:24px!important}.w3-xxlarge{font-size:36px!important}.w3-xxxlarge{font-size:48px!important}.w3-jumbo{font-size:64px!important}


        .w3-bar{width:100%;overflow:hidden}.w3-center .w3-bar{display:inline-block;width:auto}
        .w3-bar-block.w3-center .w3-bar-item{text-align:center}.w3-block{display:block;width:100%}
        .w3-left-align{text-align:left!important}.w3-right-align{text-align:right!important}.w3-justify{text-align:justify!important}.w3-center{text-align:center!important}

        .w3-row-padding,.w3-row-padding>.w3-half,.w3-row-padding>.w3-third,.w3-row-padding>.w3-twothird,.w3-row-padding>.w3-threequarter,.w3-row-padding>.w3-quarter,.w3-row-padding>.w3-col{padding:0 8px}

    </style>
</head>

<body>
<title>Brewery Information Page</title>
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
        <h1>Welcome to ${brewery.name}</h1>
        <p class="indent">${brewery.history}</p>
    </div>
</div>
<!--Address, HOO section-->
<div class="w3-container w3-padding-64 w3-xlarge" id="about">
    <div class="w3-content">
        <h1 class="w3-center w3-jumbo" style="margin-bottom: 64px">About</h1>
        <h1><b>Opening Hours</b></h1>
        <div class="w3-row">
            <p>${brewery.hoursOfOperation}</p>
        </div>
        <h1><b>Address</b></h1>
        <div class="w3-row">
            <p>${brewery.address}</p>
    </div>
</div>
</div>

<div class="w3-container w3-padding-64 w3-blue-grey w3-xlarge">
    <div class="w3-content">
        <h1 class="w3-center w3-jumbo" style="margin-bottom: 64px">Contact</h1>
        <p>Give us a call at ${brewery.phone}!</p>
    </div>
</div>

<div>
<br>
</div>
<h4 style="color: mediumpurple">What's on tap at ${brewery.name}: </h4><br>
<ul>
    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="/beer/${beer.id}"/>
        <h3>
            <a class="nav-link" href="${beerHref}">${beer.name}</a>
        </h3>
    </c:forEach>
</ul>
</p>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />