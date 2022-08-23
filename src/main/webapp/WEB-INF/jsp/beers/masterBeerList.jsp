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

  div.gallery {
      display: inline-block;
      margin: 5px;
      border: 1px solid #cccccc;
      float: left;
      width: 180px;
  }

  div.gallery:hover {
      border: 1px solid #777777;
  }

  div.gallery img {
      width: 100%;
      height: auto;
  }

  div.desc {
      padding: 15px;
      text-align: center;
  }

</style>


    <h1 style="text-align: center; font-family: 'Calistoga', cursive;">Beer Directory</h1>

<h2 style="text-align: center;">Browse all the beers in our directory: </h2>

<form>
    <input type="text" name="search" placeholder="Search..."> <br>
    <button>Search</button>
</form>

<c:forEach var="beer" items="${beers}">
    <c:url var="beerHref"
           value="/beer/${beer.id}"/>

    <div class="gallery">
        <a target="_blank" href="${beerHref}">
            <c:url var="image" value="/img/uploads/${beer.image}"/>
            <img src="${image}" alt="breweryPicture" width="700" height="500">
        </a>
        <div class="desc">
            <ul style="list-style: none;">
                <li>${beer.name}</li>
                <li>${beer.beerType}</li>
            </ul>
        </div>
    </div>

    </c:forEach>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />