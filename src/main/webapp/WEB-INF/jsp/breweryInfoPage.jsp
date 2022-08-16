<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
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
        .container {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
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
<title>Brewery Information Page</title>

<div class="container">
    <img src="https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,h_1200,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/asheville/Funkatorium-Exterior-480-91fc40fd5056a36_91fc4714-5056-a36a-0aaf2f3b57df9c87.jpg" alt="Brewery Image" style="width:100%;">
    <div class="content">
        <h1>Welcome to ${brewery.name}</h1>
        <p class="indent">${brewery.history}</p>
    </div>
</div>

<br><p>
    <ul>
    <li>You can find us at: ${brewery.address}</li>
    <li>During our hours: ${brewery.hoursOfOperation}</li>
    <li>Or contact us at: ${brewery.phone}</li>
    <br>
</ul>

<h4>What's on tap at ${brewery.name}: </h4>
<ul>
    <c:forEach var="beer" items="${beers}">
        <li>${beer.name}</li>
    </c:forEach>
</ul>
</p>
</body>
</html>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
