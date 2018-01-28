<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/showPage.css" rel="stylesheet" type="text/css">
<title><c:out value="${event.name}"/></title>
</head>
<body>
	<a class="back" href="/">back</a>
	<br>
	<h1 class="title">Are you ENGAGED in this event?</h1>
	<div class="event-section">
	<fieldset class="event">
	<h1><c:out value="${event.name}"/></h1>
	<p>Category: <c:out value="${event.category}"/></p>
	<p>Host: <c:out value="${event.user.firstname}"/> <c:out value="${event.user.lastname}"/></p>
	<p>Date: <fmt:formatDate value="${event.date}" pattern="EEEE, MMMM-dd-yyyy"/></p>
	<p>Details: <c:out value="${event.description}"/></p>
	<p>Location: <c:out value="${event.location}"/>, <c:out value="${event.state}"/></p>
	<p>People who are attending this event: <c:out value="${fn:length(event.users)}"/></p>
	<div class="scroller">
	<table>
		<tr>
			<th>Name</th>
			<th>Location</th>
		</tr>	
	<c:forEach var="event" items="${events}">
		<tr>
			<td><c:out value="${event.user.firstname}"/> <c:out value="${event.user.lastname}"/></td>
			<td><c:out value="${event.user.location}"/>, <c:out value="${event.user.state}"></c:out></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	</fieldset>
	</div>
	<div class="message-section">
	<h1>Message Wall</h1>
	<fieldset class="message">
	<c:forEach var="message" items="${messages}">
		<c:out value="${message.user.firstname}"/> <c:out value="${message.user.lastname}"/> (<c:out value="${message.user.createdAt}"/>) says: <span class="comment-color"><c:out value="${message.comment}"/></span>
		<br>
	</c:forEach>
	
	</fieldset>
	<c:if test="${commentMessage != null}">
	    	<c:out value="${commentMessage}"/>
	    </c:if>
	<p class='error'><form:errors path="message.*"/></p>
	<form:form action="/message/${event.id}" method="POST" modelAttribute="message">
		<form:input type="hidden" path="event" value="${event.id}"/>
		<form:label class="comment" path="comment">Add Comments:</form:label>
		<form:input path="comment" type="textarea" name="comment"/>
		<form:input type="hidden" path="user" value="${currentUser.id}"/>
        <input class="submit" type="submit" value="Submit">
	</form:form>
	</div>
</body>
</html>