<%--
  Created by IntelliJ IDEA.
  User: maslov
  Date: 04.11.2019
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:if test="${empty film.title}">
        <title>Add</title>
    </c:if>
    <c:if test="${!empty film.title}">
        <title>Edit</title>
    </c:if>
</head>
<body>
<c:url value="/add" var="addUrl"/>
<c:url value="/edit" var="editUrl"/>
<form class="style" action="${empty film.title ? addUrl : editUrl}" name="film" method="POST">
    <c:choose>
        <c:when test="${!empty film.title}">
            <p class="heading">Edit film</p>
            <input type="hidden" name="id" value="${film.id}">
        </c:when>
        <c:otherwise>
            <p class="heading">Add new film</p>
        </c:otherwise>
    </c:choose>
    <p><input type="text" name="title" placeholder="title" value="${film.title}" maxlength="100" required autofocus
              pattern="^[^\s]+(\s.*)?$">
    <p><input type="number" name="year" placeholder="year" value="${film.year}" maxlength="4" required
              oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
    <p><input type="text" name="genre" placeholder="genre" value="${film.genre}" maxlength="20" required>
    <p class="checkbox">
        <label for="watched">watched
            <c:if test="${film.watched == true}">
                <input type="checkbox" name="watched" id="watched" value="${film.watched}" checked>
            </c:if>
            <c:if test="${film.watched != true}">
                <input type="checkbox" name="watched" id="watched">
            </c:if>
            <span class="checkbox-common checkbox-no">no</span>
            <span class="checkbox-common checkbox-yes">yes</span>
        </label>
    </p>
    <p>
        <c:set value="add" var="add"/>
        <c:set value="edit" var="edit"/>
        <input type="submit" value="${empty film.title ? add : edit}">
    </p>
    <p class="heading">${message}</p>
</form></form>
</body>
</html>
