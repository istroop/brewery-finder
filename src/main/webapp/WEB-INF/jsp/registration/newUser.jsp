
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="validationJs" value="/js/user-validation.js" />
<script src="${validationJs}"></script>

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<h3 style="color:mediumpurple"> Create your Beer Lover Profile Today! </h3>
			<div class="form-group required">
				<label class="control-label" for="userName">Full Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="Full Name" class="form-control" required oninvalid="this.setCutomValidity(\'This field is required\')"/>
			</div>
			<div class="form-group">
				<label for="userBirthday">Birthday: </label>
				<input type="date" id="userBirthday" name="userBirthday" placeholder="User Birthday" class="form-control" />
			</div>
			<div class="form-group required">
				<label class="control-label" for="userEmail">Email: </label>
				<input type="text" id="userEmail" name="userEmail" placeholder="User Email" class="form-control" required oninvalid="this.setCutomValidity(\'This field is required\')" />
			</div>
			<div class="form-group required">
				<label class="control-label" for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" required oninvalid="this.setCutomValidity(\'This field is required\')" />
			</div>
			<div class="form-group required">
				<label class="control-label" for="confirmPassword">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" required oninvalid="this.setCutomValidity(\'This field is required\')" />
			</div>
			<div class="form-group required">
				<h4 style="color: darkred"> Choose Role:</h4>
				<input type="checkbox" id="choice1" name="choice1" value="Beer Lover">
				<label for="choice1">Beer Lover </label><br>
				<input type="checkbox" id="choice2" name="choice2" value="Brewer">
				<label for="choice2">Brewer </label>
			</div>
			<button type="submit" class="btn btn-primary">Create My Profile</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form>

		
<c:import url="/WEB-INF/jsp/common/footer.jsp" />