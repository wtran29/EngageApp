<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../css/editPage.css" rel="stylesheet" type="text/css">
<title>Update Events</title>
</head>
<body>
	<a class="back" href="/">back</a>
	<br>
	<h3 class="title">Changes to your <span>ENGAGE</span>ment?</h3>
	<div class="section">
	<h1><c:out value="${event.name}"/></h1>
	
	<c:if test="${eventMessage != null}">
    	<c:out value="${eventMessage}"/>
    </c:if>
	<p class='error'><form:errors path="event.*"/></p>
	<form:form method="POST" action="/events/${event.id}/update" modelAttribute="event">
		<form:hidden path="id" value="${event.id}" />
		<p>
			<form:label path="name">Name:</form:label>
			<form:input path="name" type="text" name="name" value="${event.name}"/>
		</p>
		<p>
			<form:label path="category">Category:</form:label>
			<form:select path="category" class="category-label">
				<form:option value="Concert">Concert</form:option>
				<form:option value="Festival">Festival</form:option>
				<form:option value="Food">Food</form:option>
				<form:option value="Comedy">Comedy</form:option>
				<form:option value="Nature">Nature</form:option>
				<form:option value="Family">Family</form:option>
				<form:option value="Nightlife">Nightlife</form:option>
				<form:option value="Sports">Sports</form:option>
				<form:option value="Movies">Movies</form:option>
				<form:option value="Networking">Networking</form:option>
				<form:option value="Technology">Technology</form:option>
			</form:select>
		</p>
		<p>
			<form:label path="date">Date:</form:label>
			<form:input path="date" type="date" name="date" value="${event.date}"/>
		</p>
		<p>
        	<form:label class="details" path="description">Details:</form:label>
        	<form:textarea path="description" type="textarea" rows="5" cols="20" name="description" value="${event.description}"/>
       	</p>
		<p>
        	<form:label path="location">Location:</form:label>
        	<form:input path="location" type="text" name="location" value="${event.location}"/>
       	</p>
       	<p>
       		<form:label path="state">State:</form:label>
        	<form:select path="state" value="${event.state}">
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
        <form:input type="hidden" path="user" value="${currentUser.id}"/>
        <input class="edit" type="submit" value="UPDATE CHANGES">
      </form:form>
      </div>
</body>
</html>