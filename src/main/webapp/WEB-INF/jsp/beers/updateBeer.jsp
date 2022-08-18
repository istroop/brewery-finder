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

    .container img {vertical-align: middle;}

    .container .content {
      position: absolute;
      bottom: 0;
      background: rgb(0,0,0);
      background: rgba(0,0,0,0.5);
      color: #f1f1f1;
      width: 100%
      padding: 20px;
    }
    p.indent {
      text-indent: 20px;
    }
  </style>
</head>

<body>
<title>Update Brewery Page</title>

<c:url var="formAction" value="/beer/${beerId}" />
<form method="POST" action="${formAction}">
  <div class="container">
    <div class="container">
      <h3 style="color:mediumpurple"> Update ${beer.getName()}:</h3>
      <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

      <div class="container">
        <label class="control-label" for="name">Name: </label>
        <input type="text" id="name" name="name" value="${beer.name}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')"/>
      </div>

      <div class="container">
        <label for="image">Image: </label>
        <input type="text" id="image" name="image" value="${beer.image}" class="form-control" />
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
        <input type="text" id="beerType" name="beerType" value="${brewery.beerType}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
      </div>

      <div class="container">
        <label for="activityStatus">Activity Status: </label><br>
        <select name="activityStatus" id="activityStatus" required>
          <option value="true">Active</option>
          <option value="false">Inactive</option>
        </select><br><br>
        <button type="submit" class="registerbtn">Update Brewery</button>
      </div>
    </div>
</form>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />