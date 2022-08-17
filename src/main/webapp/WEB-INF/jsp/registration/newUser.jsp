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

        input[type=text], input [type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=password], input [type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=date], input [type=date] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #dddddd;
            outline: none;
        }

        input[type=password]:focus, input[type=password]:focus {
            background-color: #dddddd;
            outline: none;
        }

        input[type=date]:focus, input[type=date]:focus {
            background-color: #dddddd;
            outline: none;
        }

        hr {
        	border: 1px solid #f1f1f1;
        	margin-bottom: 15px;
        }

        .registerbtn {
            background-color: #C8B6FF;
            color: white;
            padding: 16px 20px;
            margin: 40px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        .registerbtn:hover {
            opacity: 1;
        }

        .formPadding {
            padding-top: 50px;
        }

        .inputField {
            padding-right: 15px;
        }

        .center {
            text-align: center;
        }
    </style>
</head>

<body>

<c:url var="validationJs" value="/js/user-validation.js"/>
<script src="${validationJs}"></script>



<div class="row glyphicon-align-left">
    <div class="col-sm"></div>
    <div class="col-sm">
        <c:url var="formAction" value="/users"/>
        <form class="formPadding" method="POST" action="${formAction}">
            <h3 style="color:mediumpurple" class="center"> Create your Profile Today! </h3>
            <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
            <div class="container">
                <div class="container">
                    <div class="inputField form-group">
                        <label class="control-label" for="userName">Full Name: </label>
                        <input type="text" id="userName" name="userName" placeHolder="Full Name" class="form-control"
                               required oninvalid="this.setCustomValidity(\'This field is required\')"/>
                    </div>
                    <div class="inputField">
                        <label for="userBirthday">Birthday: </label>
                        <input type="date" id="userBirthday" name="birthdate" placeholder="User Birthday"
                               class="form-control"/>
                    </div>
                    <div class="inputField">
                        <label for="userEmail">Email: </label>
                        <input type="text" id="userEmail" name="userEmail" placeholder="User Email" class="form-control"
                               required oninvalid="this.setCustomValidity(\'This field is required\')"/>
                    </div>
                    <div class="inputField">
                        <label for="password">Password: </label>
                        <input type="password" id="password" name="password" placeHolder="Password" class="form-control"
                               required oninvalid="this.setCustomValidity(\'This field is required\')"/>
                    </div>
                    <div class="inputField">
                        <label for="confirmPassword">Confirm Password: </label>
                        <input type="password" id="confirmPassword" name="confirmPassword"
                               placeHolder="Re-Type Password" class="form-control" required
                               oninvalid="this.setCustomValidity(\'This field is required\')"/>
                    </div>
                        <label for="role">Choose a Role: </label><br>
                        <select name="role" id="role" required>
                            <option value="beerLover">Beer Lover</option>
                            <option value="brewer">Brewer</option>
                        </select><br>
                        <button type="submit" class="registerbtn">Create My Profile</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm"></div>

</div>
</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>