<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<link rel="shortcut icon" href="/TPIcardio/static/images/gym2.jpg" />
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		
		<meta name="viewport" content="initial-scale = 1.0">
		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		
		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">					
					<a class="brand" href="${createLink(uri: '/')}">BuoCardio</a>
					<div class="nav-collapse" style="height: auto;">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<li<%= controllerName == "maquina" ? ' class="active" ':''%>><a href="${createLink(controller:'maquina', action:'index')}">Gimnasio</a></li>
							<li<%= controllerName == "ejercicio" ? ' class="active" ':''%>><a href="${createLink(controller:'ejercicio', action:'index')}">Rutinas</a></li>
							<li<%= controllerName == "persona" ? ' class="active" ':''%>><a href="${createLink(controller:'persona', action:'index')}">Contacto</a></li>
						</ul>
						<g:if test='${flash.message}'>
							<div class='login_message'>${flash.message}</div>
						</g:if>						
						<sec:ifNotLoggedIn>							
						    <form class="navbar-form pull-right" action="${resource(file: 'j_spring_security_check')}" method='POST'>
								<input class = "span2" type="text" placeholder="email" name='j_username' id='username'>								
								<input class="span2" type="password" placeholder="contraseña" name='j_password' id='password'>				
								<g:submitButton class="bnt" name="login" value="Sing in"/>
							</form>
						</sec:ifNotLoggedIn>
						<sec:ifLoggedIn>						
							<g:link controller="logout"  class="btn btn-small pull-right">Sign out</g:link>
						</sec:ifLoggedIn>
					</div>					
				</div>
			</div>
		</nav>
		<div class="container">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; Company 2011</p>
			</footer>
		</div>

		<r:layoutResources/>
	</body>
</html>