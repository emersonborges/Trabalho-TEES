<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
div.campoBusca {
	position: relative;
	left: 100px;
}
</style>



<body>
<script type="text/javascript" src="<c:url value="/javascripts/jquery.min.js"/>"></script>
<script src="/codepress/codepress.js" type="text/javascript"></script> 
<script type="text/javascript">

var mudalinguagem = function(){	
	var l = $('[name=snippet.linguagem]').val();	
	//$('.cd2').remove();
	//var codigo = '<div class="cd2"><textarea id="snippet_codigo" name="snippet.codigo" class="codepress '+ l +'" style="width:700px;height:200px;" ></textarea></div>'
	//$(codigo).appendTo('.cd');
	snippet_codigo.edit('cp-'+l,l);

	//snippet_codigo.edit('snippet_codigo', l);	
}

var salvo = function(res) {
	   alert('Salvo com sucesso');
	   //location.reload();
	}

var testePegaCodigo = function(){
	alert('asdf');
}

var salvar = function() {
	
	  var nome = $("#snippet_nome").val();	  	  
	  var tags = $("#snippet_tags").val(); 
	  var linguagem = $("#snippet_linguagem").val();
	  var codigo = snippet_codigo.getCode();
	  if($("#atualiza").val() == "put"){
		  var id  = $("#id_snippet").val();
		  $.post("/snippets", {'snippet.nome' : nome, 'snippet.tags' : tags, 'snippet.linguagem' : linguagem, 'snippet.codigo': codigo, 
			  'snippet.id' : id, '_method' : "put"}, success = salvo);
		  
	  }
	  else{
		  $.post("/snippets", {'snippet.nome' : nome, 'snippet.tags' : tags, 'snippet.linguagem' : linguagem, 'snippet.codigo': codigo}, success = salvo);	  	
	  }	  
	  return false;
	};

</script>



<div class="busca" id="idBusca" style="width: 700px; height: 700px; float: left;">
<c:if test="${not empty errors}">
	<c:forEach items="${errors}" var="error">
		 ${error.category} - ${error.message}<br />
	</c:forEach>
</c:if>

<h2>Code Share</h2>


<div>
<form action="<c:url value="/snippets"/>" method="post">
<c:if test="${not empty snippet.id}">
	<input id="id_snippet"  type="hidden" name="snippet.id" value="${snippet.id}" />
	<input id="atualiza" type="hidden" name="_method" value="put" />
</c:if>

<div class="field">Nome:<br />
<input type="text" name="snippet.nome" id="snippet_nome"  value="${snippet.nome}" />
</div>

<div class="field">Tags:<br />
<input type="text" name="snippet.tags" id="snippet_tags" value="${snippet.tags}" />
</div>
<!-- <div class="field">Linguagem:<br />
<select name="snippet.linguagem" onchange="alert(CodePress.getCode())">
	<option value="java">Java</option>
	<option value="javascript">Java Script</option>
	<option value="cpp">C++</option>
	<option value="groovy">Groovy</option>
	<option value="php">PHP</option>
	<option value="ruby">Ruby</option>
	<option value="python">Python</option>
	<option value="xml">XML</option>
</select> 
</div>-->

 <div class="field">
    Linguagem:<br />
    <select  id="snippet_linguagem" name="snippet.linguagem" onchange="mudalinguagem()" >
  <option  value="java" <c:if test="${snippet.linguagem eq \"java\" }"> selected="selected" </c:if>>Java</option>
   <option  value="javascript" <c:if test="${snippet.linguagem eq \"javascript\" }"> selected="selected" </c:if>>Java Script</option>
    <option  value="html" <c:if test="${snippet.linguagem eq \"html\" }"> selected="selected" </c:if>>HTML</option>  
</select>
<!--    <input id="snippet_linguagem" type="text" name="snippet.linguagem" value="${snippet.linguagem}"/>-->
  </div>
  
  
   <div class="cd">
    Codigo:<br />
    <div class="cd2">
   			<textarea id="cp-java" name="snippet.codigo" style="display:none">${snippet.codigo}</textarea>
   			<textarea id="cp-javascript" name="snippet.codigo" style="display:none">${snippet.codigo}</textarea>
   			<textarea id="cp-html" name="snippet.codigo" style="display:none">${snippet.codigo}</textarea>
<!-- 		<textarea id="snippet_codigo" name="snippet.codigo" style="width:700px;height:200px;" >${snippet.codigo}</textarea>--->
	</div>
	 <textarea id="snippet_codigo" name="snippet.codigo" class="codepress  <c:choose> <c:when test="${snippet.linguagem eq \"java\"}">java"</c:when> <c:when test="${snippet.linguagem eq \"javascript\"}">javascript"</c:when> <c:when test="${snippet.linguagem eq \"html\"}">html"</c:when> <c:otherwise>java"</c:otherwise></c:choose> style="width:700px;height:200px;" >${snippet.codigo}</textarea>
	
	</div>



<!-- <div class="field">Codigo:<br />
<textarea id="snippet_codigo" name="snippet.codigo" class="codepress  <c:choose> <c:when test="${snippet.linguagem eq \"java\"}">java"</c:when> <c:when test="${snippet.linguagem eq \"php\"}">php"</c:when><c:otherwise>java"</c:otherwise></c:choose> style="width:700px;height:200px;" >${snippet.codigo}</textarea>
<textarea id="codepress-ondemand" lang="[language]" rows="20" cols="80" name="snippet.codigo" class="codepress java linenumbers-on">${snippet.codigo}</textarea> 
<input type="text" name="snippet.codigo" style="height: 200px; width: 200px;" maxlength="500" value="${snippet.codigo}"/>
</div> -->
<div class="actions">
<button id="salvar" type="submit">send</button>

</div>

</form>
</div>
</div>




<div class="busca" id="idLista" style="width: 500px; height: 400px; float: right; position: relative; right: 40px">

<br>
<br>
<br>
<form action="<c:url value="/snippets/search" />" method="post">
<input type="text" name="tag" /> <input type="submit" value="Buscar" />
</form>

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
			<td>${snippet.nome}</td>
			<td>${snippet.tags}</td>
			<td>${snippet.linguagem}</td>
			<td>${snippet.codigo}</td>			
			<td><a href="<c:url value="/snippets/${snippet.id}/edit"/>">edit</a></td>
			<td>
			<form action="<c:url value="/snippets/${snippet.id}"/>" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button type="submit" onclick="return confirm('Are you sure?')">destroy</button>
			</form>
			</td>
		</tr>
	</c:forEach>
</table>

<br />
</div>

<script>



$("#salvar").click(salvar);

</script>

</body>



