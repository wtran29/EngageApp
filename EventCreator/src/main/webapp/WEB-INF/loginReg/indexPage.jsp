<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome</title>
	<link href="/css/indexPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="image">
	<h3 class="title">Let's <span>Engage</span>. JOIN US!</h3>
	<div class="nav-bar">
		<ul>
			<li><a href="#">All Events</a></li>
			<li><a href="#">Concerts</a></li>
			<li><a href="#">Festivals</a></li>
			<li><a href="#">Food</a></li>
			<li><a href="#">Comedy</a></li>
			<li><a href="#">Family</a></li>
			<li><a href="#">Nightlife</a></li>
			<li><a href="#">Sports</a></li>
			<li><a href="#">Networking</a></li>
		</ul>
	</div>
	<c:if test="${logoutMessage != null}">
		<p class="logout"><c:out value="${logoutMessage}"/></p>
	</c:if>
	<div class="about">
		<h2>What are we about?</h2>
		<p>We live in a world where technology plays a big role in our lives.
		No longer do we need to depend on maps to get to places, figuring where to eat,
		or things to do. However, when is the last time anyone really got together?? It seems everyones'
		schedules don't mesh with each others'. With the Engage App, getting together couldn't be easier.
		Our platform is about connecting the world and engaging in activities within the community.</p>
		<p> I ENGAGE you, you ENGAGE me, we ENGAGE us.</p>
		<p>Join the movement and ENGAGE.</p>
	</div>
	<div class="section">
	<div class="register">
	<h3>Sign Up Here</h3>
    <c:if test="${regMessage != null}">
    	<p class="errors"><c:out value="${regMessage}"/></p>
    </c:if>
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p class="first">
            <form:label path="firstname">First Name:</form:label>
            <form:input path="firstname"/>
        </p>
        <p class="last">
            <form:label path="lastname">Last Name:</form:label>
            <form:input path="lastname"/>
        </p>
        <p class="email">
            <form:label path="email">Email:</form:label>
            <form:input path="email"/>
        </p>
        <p class="location">
        	<form:label path="location">Location:</form:label>
        	<form:input path="location"/>
       	</p>
       	<p class="state">
       		<form:label path="state">State:</form:label>
        	<form:select path="state">
        		<form:option value="AL">Alabama (AL)</form:option>
	            <form:option value="AK">Alaska (AK)</form:option>
	            <form:option value="AZ">Arizona (AZ)</form:option>
	            <form:option value="AR">Arkansas (AR)</form:option>
	            <form:option value="CA">California (CA)</form:option>
	            <form:option value="CO">Colorado (CO)</form:option>
	            <form:option value="CT">Connecticut (CT)</form:option>
	            <form:option value="DE">Delaware (DE)</form:option>
	            <form:option value="DC">District Of Columbia (DC)</form:option>
	            <form:option value="FL">Florida (FL)</form:option>
	            <form:option value="GA">Georgia (GA)</form:option>
	            <form:option value="HI">Hawaii (HI)</form:option>
	            <form:option value="ID">Idaho (ID)</form:option>
	            <form:option value="IL">Illinois (IL)</form:option>
	            <form:option value="IN">Indiana (IN)</form:option>
	            <form:option value="IA">Iowa (IA)</form:option>
	            <form:option value="KS">Kansas (KS)</form:option>
	            <form:option value="KY">Kentucky (KY)</form:option>
	            <form:option value="LA">Louisiana (LA)</form:option>
	            <form:option value="ME">Maine (ME)</form:option>
	            <form:option value="MD">Maryland (MD)</form:option>
	            <form:option value="MA">Massachusetts (MA)</form:option>
	            <form:option value="MI">Michigan (MI)</form:option>
	            <form:option value="MN">Minnesota (MN)</form:option>
	            <form:option value="MS">Mississippi (MS)</form:option>
	            <form:option value="MO">Missouri (MO)</form:option>
	            <form:option value="MT">Montana (MT)</form:option>
	            <form:option value="NE">Nebraska (NE)</form:option>
	            <form:option value="NV">Nevada (NV)</form:option>
	            <form:option value="NH">New Hampshire (NH)</form:option>
	            <form:option value="NJ">New Jersey (NJ)</form:option>
	            <form:option value="NM">New Mexico (NM)</form:option>
	            <form:option value="NY">New York (NY)</form:option>
	            <form:option value="NC">North Carolina (NC)</form:option>
	            <form:option value="ND">North Dakota (ND)</form:option>
	            <form:option value="OH">Ohio (OH)</form:option>
	            <form:option value="OK">Oklahoma (OK)</form:option>
	            <form:option value="OR">Oregon (OR)</form:option>
	            <form:option value="PA">Pennsylvania (PA)</form:option>
	            <form:option value="RI">Rhode Island (RI)</form:option>
	            <form:option value="SC">South Carolina (SC)</form:option>
	            <form:option value="SD">South Dakota (SD)</form:option>
	            <form:option value="TN">Tennessee (TN)</form:option>
	            <form:option value="TX">Texas (TX)</form:option>
	            <form:option value="UT">Utah (UT)</form:option>
	            <form:option value="VT">Vermont (VT)</form:option>
	            <form:option value="VA">Virginia (VA)</form:option>
	            <form:option value="WA">Washington (WA)</form:option>
	            <form:option value="WV">West Virginia (WV)</form:option>
	            <form:option value="WI">Wisconsin (WI)</form:option>
	            <form:option value="WY">Wyoming (WY)</form:option>
        	</form:select>
        </p>
        <p class="password">
            <form:label path="password">Create Password:</form:label>
            <form:password path="password"/>
        </p>
        <p class="confirm">
            <form:label path="passwordConfirmation">Password Confirm:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input class="reg-button" type="submit" value="REGISTER"/>
    </form:form>
    </div>
    <div class="login">
    <h3>Login</h3>
    <c:if test="${errorMessage != null}">
    	<p class="errors"><c:out value="${errorMessage}"/></p>
    </c:if>
    <form method="POST" action="/login">
        <p>
            <label for="username">Email</label>
            <input type="text" id="username" name="username"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input class="login-button" type="submit" value="LOGIN"/>
    </form>
    </div>
    </div>
</div>
</body>
</html>