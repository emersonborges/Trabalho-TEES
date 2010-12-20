<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<!-- Include required JS files -->
<script type="text/javascript" src="/javascripts/shCore.js"></script>
 
<!--
    At least one brush, here we choose JS. You need to include a brush for every
    language you want to highlight
-->
<script type="text/javascript" src="/javascripts/shBrushJScript.js"></script>
<script type="text/javascript" src="/javascripts/shBrushJava.js"></script>
<script type="text/javascript" src="/javascripts/shBrushXml.js"></script>
<script type="text/javascript" src="/javascripts/shBrushRuby.js"></script>
<script type="text/javascript" src="/javascripts/shBrushPhp.js"></script>
<script type="text/javascript" src="/javascripts/shBrushPhyton.js"></script>
<script type="text/javascript" src="/javascripts/shBrushCpp.js"></script>
<script type="text/javascript" src="/javascripts/shBrushGroovy.js"></script>
 
<!-- Include *at least* the core style and default theme -->
<link href="/stylesheets/shCore.css" rel="stylesheet" type="text/css" />
<link href="/stylesheets/shThemeDefault.css" rel="stylesheet" type="text/css" />
 
 
<!-- Finally, to actually run the highlighter, you need to include this JS on your page -->
<script type="text/javascript">
     SyntaxHighlighter.all()
</script>

<p>
  <b>Home:</b>
   ${snippet.home}
</p>
<p>
  <b>Tags:</b>
   ${snippet.tags}
</p>
<p>
  <b>Linguagem:</b> 	
   ${snippet.linguagem}
</p>
<p>
  <b>Codigo:</b>
  <pre class="brush: ${snippet.linguagem} }">
   ${snippet.codigo}
   </pre>
</p>

<a href="<c:url value="/snippets/${snippet.id}/edit"/>">Edit</a>
<a href="<c:url value="/snippets"/>">Back</a>

</body>
