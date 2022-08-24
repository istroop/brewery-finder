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

</style>

<h1 style="text-align: center; font-family: 'Calistoga', cursive;">User Directory</h1>

<h2 style="text-align: center;">Browse all the users in our directory: </h2>

<br>
<h3>Brewers</h3>
<div class="cardRow">
    <c:forEach var="brewer" items="${brewers}">

        <div class="cardColumn">
            <div class="card">
                <div class="cardContainer">
                    <h2 style="text-align: center;">${brewer.getName()}</h2>
                    <p class="title">${brewer.getUserEmail()} | ${brewer.getUserName()}</p>
                    <c:set value="${brewer.id}" var="id"/>
                    <c:url var="deleteUserHref"
                           value="/users/${id}/delete"/>
                    <p><a class="cardBtn btn-block select" href="${deleteUserHref}">Delete</a></p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<br>

<h3>Beer Lovers</h3>
<div class="cardRow">
    <c:forEach var="beerLover" items="${beerLovers}">

        <div class="cardColumn">
            <div class="card">
                <div class="cardContainer">
                    <h2 style="text-align: center;">${beerLover.getName()}</h2>
                    <p class="title">${beerLover.getUserEmail()} | ${beerLover.getUserName()}</p>
                    <c:set value="${beerLover.id}" var="id"/>
                    <c:url var="deleteUserHref"
                           value="/users/${id}/delete"/>
                    <p><a class="cardBtn btn-block select" href="${deleteUserHref}">Delete</a></p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />