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

    </style>

<body>

<c:url var="validationJs" value="/js/user-validation.js"/>
<script src="${validationJs}"></script>

<c:set var="req" value="${pageContext.request}"/>
<c:set var="url"/>

<c:url var="formAction" value="/beer/${beerId}/reviews"/>
<form method="POST" action="${formAction}" class="formPadding">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="page-container">
        <div class="page-container">
            <h1 style="text-align: center; font-family: 'Calistoga', cursive;"> Write a Review! </h1>

            <div class="page-container">
                <h3>Username: ${currentUser.userName}</h3>
            </div>

            <div class="page-container">
                <label for="reviewTitle">Review Title: </label>
                <input type="text" id="reviewTitle" name="reviewTitle" placeholder="Title" class="form-control"/>
            </div>

            <div class="page-container">
                <label for="rating">Rating: </label>
                <select style="background-color: #C4C0B0" type="text" id="rating" name="rating" placeholder="User Contact" class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>

            <div class="page-container">
                <label for="review">Review: </label>
                <textarea type="text" id="review" name="review" placeholder="Review" class="form-control"
                          required oninvalid="this.setCustomValidity(\'This field is required\')" style="background-color: #C4C0B0"></textarea>
            </div>

<%--            <c:forEach var="review" items="${reviews}">--%>

<%--                <div class="review inner-content">--%>
<%--                    <p><span class="title">${review.title}</span> ${review.username} </p>--%>
<%--                    <p> ${review.dateSubmitted}</p>--%>
<%--                    <div>--%>
<%--                        <c:forEach begin="1" end="${review.rating}">--%>
<%--                            <img class="ratingStar" src="/img/rsz_beermug.png"/>--%>
<%--                        </c:forEach>--%>
<%--                    </div>--%>
<%--                    <p>${review.text}</p>--%>
<%--                </div>--%>

<%--            </c:forEach>--%>





            </select><br>
            <button type="submit" class="btn btn-block registerbtn">Create Review</button>
        </div>

    </div>
    </div>
</form>

</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
