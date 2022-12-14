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
    * {
      box-sizing: border-box;
    }

    body {
      font-family: 'Roboto Slab', serif;;
      font-size: 17px;
      color: #344E41;
      background-color: #DAD7CD;
    }

    input[type=text], input [type=password] {
      width: 100%;
      padding: 15px;
      margin: 5px 0 15px 0;
      display: inline-block;
      border: none;
      background-color: #C4C0B0;
    }

    input[type=text]:focus, input[type=password]:focus {
      background-color: #C4C0B0;
      outline: none;
    }

    .container img {vertical-align: middle;}
  </style>

<h1>Update Beer Page</h1>

<c:url var="formAction" value="/breweries/${breweryId}/beer/${beerId}" />
<form method="POST" action="${formAction}">
  <div class="container">
    <div class="container">
      <h1 style="text-align: center; font-family: 'Calistoga', cursive;"> Update ${beer.getName()}:</h1>
      <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

      <div class="container">
        <label class="control-label" for="name">Name: </label>
        <input type="text" id="name" name="name" value="${beer.name}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')"/>
      </div>

      <div class="container">
        <label for="description">Description: </label>
        <input type="text" id="description" name="description" value="${beer.description}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
      </div>

      <div class="container">
        <label for="abv">ABV: </label>
        <input type="text" id="abv" name="abv" value="${beer.abv}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
      </div>
      <div class="container">
        <label for="beerType">Beer Type: </label>
        <input type="text" id="beerType" name="beerType" value="${beer.beerType}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
      </div>

      <div class="container">
        <label for="activityStatus">Activity Status: </label><br>
        <select name="activityStatus" id="activityStatus" style="background-color: #C4C0B0" required>
          <option value="true">Active</option>
          <option value="false">Inactive</option>
        </select><br><br>

        <button type="submit" class="registerbtn">Update Beer</button>
      </div>
    </div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />