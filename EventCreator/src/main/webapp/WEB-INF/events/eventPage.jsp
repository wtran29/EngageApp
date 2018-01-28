<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/eventPage.css" rel="stylesheet" type="text/css">
<title>Events</title>
</head>
<body>

<h3 class="title"><span>Engage</span> in events or create your own!</h3>
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
			<li>
				<form id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<input class="logout" type="submit" value="LOGOUT" />
    			</form>
			</li>
		</ul>
	</div>
	 <%-- <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form> --%>
    <div class="list-events">
    <h1 class="welcome">Welcome, <c:out value="${currentUser.firstname}"/></h1>
    <hr>
    <br>
	<p class="event-desc">Here are some of the events in your state:</p>
	<table class="state">	
		<thead>
			<tr>
				<th>Event Name</th>
				<th>Date</th>
				<th>Location</th>
				<th>Host</th>
				<th>Action / Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="event" items="${eventHere}">
				<tr>
					<td><a href="/events/${event.id}"><c:out value="${event.name}"/></a></td>
					<td><fmt:formatDate value="${event.date}" pattern="EEEE, MM/dd/yyyy"/></td>
					<td><c:out value="${event.location}"/></td>
					<td><c:out value="${event.user.firstname}"/></td>
					<c:choose>
						<c:when test="${currentUser==event.getUser()}">
							<td><a class="edit" href="/events/${event.id}/edit">Edit</a> <a class="delete" href="/event/delete/${event.id}">Delete</a></td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${event.getUsers().indexOf(currentUser) >= 0}">
									<td><p class="joining">Joining</p> <a class="cancel" href="/events/cancel/${event.id}">Cancel</a></td>
								</c:when>
								<c:otherwise>
									<td><a class="join" href="/events/join/${event.id}">ENGAGE</a></td>						
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<hr>
	<br>
	<p class="event-desc">Here are some of the events in other states:</p>
	<table class="other">	
		<thead>
			<tr>
				<th>Event Name</th>
				<th>Date</th>
				<th>Location</th>
				<th>State</th>
				<th>Host</th>
				<th>Action / Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="otherEvent" items="${eventOther}">
				<tr>
					<td><a href="/events/${otherEvent.id}"><c:out value="${otherEvent.name}"/></a></td>
					<td><fmt:formatDate value="${otherEvent.date}" pattern="EEEE, MM/dd/yyyy"/></td>
					<td><c:out value="${otherEvent.location}"/></td>
					<td><c:out value="${otherEvent.state}"/></td>
					<td><c:out value="${otherEvent.user.firstname}"/></td>
					<c:choose>
						<c:when test="${currentUser==otherEvent.getUser()}">
							<td><a class="edit" href="/events/${otherEvent.id}/edit">Edit</a> <a class="delete" href="/event/delete/${otherEvent.id}">Delete</a></td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${otherEvent.getUsers().indexOf(currentUser) >= 0}">
									<td><p class="joining">Joining</p> <a class="cancel" href="/events/cancel/${otherEvent.id}">Cancel</a></td>
								</c:when>
								<c:otherwise>
									<td><a class="join" href="/events/join/${otherEvent.id}">Engage</a></td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="create-event">
	<h1 class="create">Create an Event</h1>
	<hr>
		<c:if test="${eventMessage != null}">
	    	<c:out value="${eventMessage}"/>
	    </c:if>
	<p class='error'><form:errors path="event.*"/></p>
	<form:form method="POST" action="/createEvent" modelAttribute="event">
		<p>
			<form:label path="name">Event Name:</form:label>
			<form:input class="name-label" path="name" type="text" name="name"/>
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
			<form:input class="date-label" path="date" type="date" name="date"/>
		</p>
		<p>
			<form:label class="details" path="description">Details:</form:label>
			<form:textarea class="description-label" path="description" type="textarea" cols="22" rows="5" name="description"/>
		</p>
		<p>
        	<form:label path="location">Location:</form:label>
        	<form:input class="location-label" path="location" type="text" name="location"/>
       	</p>
       	<p>
       		<form:label path="state">State:</form:label>
        	<form:select path="state" class="state-label">
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
        <input class="create-button" type="submit" value="Add Event">
      </form:form>
      </div>
</body>
</html>