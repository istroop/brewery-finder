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

<c:url var="formAction" value="/breweries/${breweryId}/update" />
<form method="POST" action="${formAction}">
    <div class="container">
        <div class="container">
            <h3 style="color:mediumpurple"> Update ${brewery.getName()}:</h3>
            <div class="container">
                <label class="control-label" for="phone">Phone: </label>
                <input type="text" id="phone" name="phone" value="${brewery.phone}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')"/>
            </div>
            <div class="container">
                <label for="hoursOfOperation">Hours of Operation: </label>
                <input type="text" id="hoursOfOperation" name="hoursOfOperation" value="${brewery.hoursOfOperation}" class="form-control" />
            </div>
            <div class="container">
                <label for="address">Address: </label>
                <input type="text" id="address" name="address" value="${brewery.address}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
            </div>
            <div class="container">
                <label for="history">History: </label>
                <input type="text" id="history" name="history" value="${brewery.history}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
            </div>
            <div class="container">
                <label for="image">Image: </label>
                <input type="text" id="image" name="image" value="${brewery.image}" class="form-control" required oninvalid="this.setCustomValidity(\'This field is required\')" />
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