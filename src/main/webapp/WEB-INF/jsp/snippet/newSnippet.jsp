<%@page import="app.repositories.Repository"%>
<body>
	<%@include file="form.jsp"%>
	<c:if test="${empty snippet}">
	
	</c:if>
	${snippet.home}
	<c:forEach items="${snippetList}" var="snippet">
	<p>${snippet.tag}</p>
	</c:forEach>
	<%
		
		for(int i=0; i<10; i++){
			out.println(i);
		}
	%>
</body>