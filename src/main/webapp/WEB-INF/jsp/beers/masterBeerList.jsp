<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>
<br>
<style>
    body {
        font-family: 'Roboto Slab', serif;;
        font-size: 17px;
        color: #344E41;
        background-color: #DAD7CD;
    }

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

    .title {
        color:grey;
        text-align: center;
    }

    input[type=text] {
        width: 130px;
        box-sizing: border-box;
        border: 2px solid #cccccc;
        border-radius: 4px;
        font-size: 16px;
        background-color: #C4C0B0;
        background-image: url('searchicon.png');
        background-position: 10px 10px;
        background-repeat: no-repeat;
        padding: 12px 20px 12px 40px;
        -webkit-transition: width 0.4s ease-in-out;
        transition: width 0.4s ease-in-out;
    }

    input[type=text]:focus {
        width: 100%;
    }

</style>

    <h1 style="text-align: center; font-family: 'Calistoga', cursive;">Beer Directory</h1>

<h2 style="text-align: center;">Browse all the beers in our directory: </h2>

<form>
    <input type="text" name="search" placeholder="Search..."> <br>
    <button>Search</button>
</form><br>

<div class="cardRow">
    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="/beer/${beer.id}"/>

        <div class="cardColumn">
            <div class="card">
                <c:url var="image" value="/img/uploads/${beer.image}"/>
                <img src="${image}" alt="beerPicture" style="width: 100%">
                <div class="cardContainer">
                    <h2 style="text-align: center;">${beer.name}</h2>
                    <p class="title";">${beer.beerType} | ABV: ${beer.abv}%</p>
                    <p><a class="cardBtn btn-block select" href="${beerHref}">Read More...</a></p><br>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />