<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<style>
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


    div.gallery img {
        width: 100%;
        height: auto;
    }

    div.desc {
        padding: 15px;
        text-align: center;
    }
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


    .cardBtn {
        border: 10px solid #344E41;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
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

<br><br><br><br>

<h1 style="text-align: center; font-family: 'Calistoga', cursive;">Beer Directory</h1>

<h2 style="text-align: center;">Browse all the beers in our directory: </h2>

<form>
    <input type="text" name="search" placeholder="Search...">
    <button>Search</button>
</form>

<br>
<div class="cardRow">
    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="/beer/${beer.id}"/>

        <div class="cardColumn">
            <div class="card">
                <a target="_blank" href="${beerHref}">
                    <c:url var="image" value="/img/uploads/${beer.image}"/>
                    <div class="cardBtn"><img src="${image}" alt="breweryPicture" style="width: 100%"></div>
                </a>
                <div class="desc">
                    <ul style="list-style: none;">
                        <li>${beer.name}</li>
                        <li>${beer.beerType}</li>
                    </ul>
                </div>
            </div>
        </div>


    </c:forEach>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />

