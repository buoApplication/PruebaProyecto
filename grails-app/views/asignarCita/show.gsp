
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1>${usuarioInstance.nombre} ${usuarioInstance.apellido}</h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
					<g:if test="${usuarioInstance?.cita}">
						<dt><g:message code="usuario.cita.label" default="Cita" /></dt>
						
							<g:each in="${usuarioInstance.cita}" var="c">
							<dd><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				</dl>
				<g:form>
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${usuarioInstance?.id}">
							<i class="icon-pencil"></i>
							Cambiar Cita
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
