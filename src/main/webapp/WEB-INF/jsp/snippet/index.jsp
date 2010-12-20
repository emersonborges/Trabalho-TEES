<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<h1>Listing Snippets</h1>

<table>
  <tr>
   <th>nome</th>
   <th>tags</th>
   <th>linguagem</th>
   <th>codigo</th>
   <th></th>
   <th></th>
   <th></th>
  </tr>

<c:forEach items="${snippetList}" var="snippet">
  <tr>
      <td>
      ${snippet.home}
    </td>
      <td>
      ${snippet.tags}
    </td>
      <td>
      ${snippet.linguagem}
    </td>
      <td>
      ${snippet.codigo}
    </td>
      <td><a href="<c:url value="/snippets/${snippet.id}"/>">show</a></td>
    <td><a href="<c:url value="/snippets/${snippet.id}/edit"/>">edit</a></td>
    <td>
      <form action="<c:url value="/snippets/${snippet.id}"/>" method="post">
    	  <input type="hidden" name="_method" value="delete"/>
    	  <button type="submit" onclick="return confirm('Are you sure?')">destroy</button>
	    </form>
	  </td>
    </tr>
</c:forEach>
</table>

<br />
<a href="<c:url value="/snippets/new"/>">New Snippet</a> 


<c:if test="${not empty errors}">
	<c:forEach items="${errors}" var="error">
		 ${error.category} - ${error.message}<br />
	</c:forEach>
</c:if>

<h2>Code Share</h2>

<!-- Include required JS files -->
<script type="text/javascript" src="/javascripts/shCore.js"></script>

<!--
    At least one brush, here we choose JS. You need to include a brush for every
    language you want to highlight
-->
<script type="text/javascript" src="/javascripts/shBrushJScript.js"></script>

<!-- Include *at least* the core style and default theme -->
<link href="/stylesheets/shCore.css" rel="stylesheet" type="text/css" />
<link href="/stylesheets/shThemeDefault.css" rel="stylesheet"
	type="text/css" />

<!-- Finally, to actually run the highlighter, you need to include this JS on your page -->
<script type="text/javascript">
     SyntaxHighlighter.all()
</script>

<style type="text/css">
div.campoBusca {
	position: relative;
	left: 100px;
}
</style>
<div>
<form action="<c:url value="/snippets"/>" method="post">
<c:if test="${not empty snippet.id}">
	<input type="hidden" name="snippet.id" value="${snippet.id}" />
	<input type="hidden" name="_method" value="put" />
</c:if>

<div class="field">Nome:<br />
<input type="text" name="snippet.home" value="${snippet.home}" />


</div>

<div class="field">Tags:<br />
<input type="text" name="snippet.tags" value="${snippet.tags}" /></div>
<div class="field">Linguagem:<br />
<select name="snippet.linguagem">
	<option value="java">Java</option>
	<option value="javascript">Java Script</option>
	<option value="cpp">C++</option>
	<option value="groovy">Groovy</option>
	<option value="php">PHP</option>
	<option value="ruby">Ruby</option>
	<option value="python">Python</option>
	<option value="xml">XML</option>
</select> <!-- <input type="text" name="snippet.linguagem" value="${snippet.linguagem}"/> -->
</div>
<div class="field">Codigo:<br />
<textarea rows="20" cols="80" name="snippet.codigo">${snippet.codigo}</textarea>
<!-- <input type="text" name="snippet.codigo" style="height: 200px; width: 200px;" maxlength="500" value="${snippet.codigo}"/> -->
</div>
<div class="actions">
<button type="submit">send</button>
</div>

</form></div>
</div>
<form action="<c:url value="/snippets/search"/>" method="post">
 <div class="field" >
    <input type="text" name="tag" />
  </div>

 <div class="actions">
    <button type="submit">Buscar</button>
  </div>
<br> <br> 
</form>


</body>
