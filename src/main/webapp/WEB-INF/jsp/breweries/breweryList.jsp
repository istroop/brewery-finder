<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>

    <style>
        body {font-family: 'Roboto Slab', serif; font-size: 17px; color: #344E41; background-color: #DAD7CD}

        html {box-sizing: border-box;}

        *, *:before, *:after {box-sizing: inherit;}

        .cardColumn {
            float: left;
            width: 100%;
            margin-bottom: 16px;
            padding: 0 8px;
        }

        .cardRow {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        @media screen and (max-width: 650px) {
            .cardColumn {
                width: 100%;
                display: block;
            }
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.4);
            background-color: white;
        }

        .cardContainer{padding: 0 16px;}

        .cardContainer::after, .cardRow::after {
            content: "";
            clear: both;
            display: table;
        }

        .title {color:grey;}

        .cardBtn {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #344E41;
            text-align: center;
            cursor: pointer;
            width: 100%;
            opacity: 1;
        }

        .cardBtn:hover {opacity: .7;}

        a:hover {
            color: white;
            text-decoration: underline;
        }
    </style>



<h1 style="font-family: 'Calistoga', cursive; text-align: center">Our Brewery List: </h1>

<br>


<div class="cardRow">
<c:forEach var="brewery" items="${breweries}">
    <c:url var="breweryHref"
           value="/breweries/${brewery.id}"/>

        <div class="cardColumn">
            <div class="card">
                <img src="${brewery.image}" alt="breweryPicture" style="width: 100%">
                <div class="cardContainer">
                    <h2>${brewery.name}</h2>
                    <p class="title">${brewery.address}</p>
                    <p>${brewery.history}</p>
                    <p><a class="cardBtn btn-block select" href="${breweryHref}">Learn More</a></p><br>
                </div>
            </div>
        </div>


</c:forEach>
</div>

<c:url var="newBreweryHref"
       value="/breweries/new"/>
<h3>
    <a class="btn btn-primary new-brewery" href="${newBreweryHref}">Add a Brewery</a>
</h3>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
