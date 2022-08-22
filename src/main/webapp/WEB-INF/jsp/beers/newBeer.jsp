<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto Slab', serif;;
            font-size: 17px;
            color: #344E41;
            background-color: #DAD7CD;
        }

        * {
            box-sizing: border-box;
        }

        .page-container {
            background-color: #DAD7CD;
            padding-right: 15px;
            width: 100%;
        }

        .textbox {
            width: 100%;
            height: 150px;
            padding: 15px 20px;
            box-sizing: border-box;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #C4C0B0;
        }

        input[type=text], input [type=text] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #C4C0B0;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 15px;
        }

        .registerbtn {
            background-color: #344E41;
            color: white;
            padding: 10px 20px;
            margin: 40px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 140%;
        }

        .registerbtn:hover {
            opacity: 1;
        }

        .formPadding {
            padding-top: 50px;
        }

        .center {
            text-align: center;
        }

    </style>

<c:url var="validationJs" value="/js/user-validation.js"/>
<script src="${validationJs}"></script>

<c:url var="formAction" value="/breweries/${breweryId}/newBeer"/>
<form method="POST" action="${formAction}" class="formPadding">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="page-container">
        <div class="page-container">
            <h1 style="text-align: center; font-family: 'Calistoga', cursive;"> Add a New Beer to Your Brewery! </h1>

            <div class="page-container">
                <label class="control-label" for="name">Beer Name: </label>
                <input type="text" id="name" name="name" placeHolder="Beer Name" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="description">Description: </label>
                <input type="text" id="description" name="description" placeholder="Description" class="form-control"
                       required oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="abv">ABV: </label>
                <input type="number" step=0.1 min=0 max=100 id="abv" name="abv" placeHolder="ABV" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="beerType">Beer Type: </label>
                <input type="text" id="beerType" name="beerType" placeHolder="Beer Type" class="form-control"
                       required oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>


            </select><br>
            <button type="submit" class="btn btn-block registerbtn">Add Beer</button>
        </div>

    </div>
    </div>
</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
