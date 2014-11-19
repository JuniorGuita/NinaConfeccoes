<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="uf" items="${estados}">
			${uf.id} - ${uf.estado}<br>
		</c:forEach>