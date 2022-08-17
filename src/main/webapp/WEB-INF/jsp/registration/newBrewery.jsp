<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 8/17/2022
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        .page-container {
            background-color: white;
            padding-right: 15px;
            width: 100%;
        }

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=number], input [type=number] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        .textbox {
            width: 100%;
            height: 150px;
            padding: 15px 20px;
            box-sizing: border-box;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=text], input [type=text] {*/
        /*    !*width: 100%;*!*/
        /*    !*height:150px;*!*/
        /*    !*padding: 15px 20px;*!*/
        /*    !*box-sizing: border-box;*!*/
        /*    !*margin: 5px 0 15px 0;*!*/
        /*    !*display: inline-block;*!*/
        /*    !*border: none;*!*/
        /*    !*background: #f1f1f1;*!*/

        /*    background-color: #dddddd;*/
        /*    outline: none;*/
        /*}*/

        input[type=text], input [type=text] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 15px;
        }

        .registerbtn {
            background-color: #a68fff;
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
</head>

<body>

<c:url var="validationJs" value="/js/user-validation.js"/>
<script src="${validationJs}"></script>

<c:url var="formAction" value="/users"/>
<form method="POST" action="${formAction}" class="formPadding">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="page-container">
        <div class="page-container">
            <h3 style="color:mediumpurple" class="center"> Add Your Brewery to the Collection! </h3>

            <div class="page-container">
                <label class="control-label" for="userBrewery">Brewery Name: </label>
                <input type="text" id="userBrewery" name="name" placeHolder="Brewery Name" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>

            <%--            Add functionality on the back end to retrieve name from brewer id--%>
            <div class="page-container">
                <label for="userContact">Contact Name: </label>
                <input type="text" id="userContact" name="userContact" placeholder="User Contact" class="form-control"/>
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
                <input type="text" id="history" name="history" placeHolder="History" class="form-control" required
                       oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>


            </select><br>
            <button type="submit" class="btn btn-block registerbtn">Add Brewery</button>
        </div>

    </div>
    </div>
</form>

</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
