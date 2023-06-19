<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<title>Home</title>
</head>
<body>

<table border="1" style="margin: auto;">
	<tr>
		<td><a href="${contextPath}/crawling/addNetflixContents">Netflix Crawling Start</a></td>
	</tr>
	<tr>
		<td><a href="${contextPath}/crawling/addTvingContents">Tving Crawling Start</a></td>
	</tr>
	<tr>
		<td><a href="${contextPath}/crawling/addWavveContents">wavve Crawling Start</a></td>
	</tr>
</table>

</body>
</html>
