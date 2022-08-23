<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<c:url var="uploadJs" value="/js/upload-image.js" />
<script src="${uploadJs}"></script>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

<c:url var="formAction" value="/breweries"/>
<form method="POST" action="${formAction}" class="formPadding">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="page-container">
        <div class="page-container">
            <h1 style="text-align: center; font-family: 'Calistoga', cursive;"> Add Your Brewery to the Collection! </h1>

            <div class="page-container">
                <label class="control-label" for="userBrewery">Brewery Name: </label>
                <input type="text" id="userBrewery" name="name" placeHolder="Brewery Name" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="brewerId">Brewer Name: </label>
                <select type="text" id="brewerId" name="brewer" class="form-control" style="background-color: #C4C0B0">
                    <c:forEach var="brewer" items="${brewers}">
                        <option value="${brewer.id}">${brewer.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="page-container">
                <label for="userPhone">Phone Number: </label>
                <input type="text" id="userPhone" name="phone" placeholder="User Phone" class="form-control"
                       required oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="address">Address: </label>
                <input type="text" id="address" name="address" placeHolder="Address" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="operation">Days & Hours of Operation: </label>
                <input type="text" id="operation" name="hoursOfOperation" placeHolder="Operation" class="form-control"
                       required oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <div class="page-container">
                <label for="history">History: </label>
                <textarea type="text" id="history" name="history" placeholder="History" style="background-color: #C4C0B0" class="form-control"
                          required oninvalid="this.setCustomValidity(\'This field is required\')"></textarea>
            </div>


            </select><br>
            <button id="uploadButton" type="submit" class="btn btn-block registerbtn">Add Brewery</button>
        </div>

    </div>
    </div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
