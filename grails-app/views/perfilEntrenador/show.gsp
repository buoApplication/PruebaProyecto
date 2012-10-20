
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'entrenador.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link controller="asignarCita">
								<i class="icon-list"></i>
								Asignar Cita
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${entrenadorInstance?.cedula}">
						<dt><g:message code="entrenador.cedula.label" default="Cedula" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="cedula"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.nombre}">
						<dt><g:message code="entrenador.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.apellido}">
						<dt><g:message code="entrenador.apellido.label" default="Apellido" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="apellido"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.correo}">
						<dt><g:message code="entrenador.correo.label" default="Correo" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="correo"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.password}">
						<dt><g:message code="entrenador.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.edad}">
						<dt><g:message code="entrenador.edad.label" default="Edad" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="edad"/></dd>
						
					</g:if>
				
					<g:if test="${entrenadorInstance?.campoLaboral}">
						<dt><g:message code="entrenador.campoLaboral.label" default="Campo Laboral" /></dt>
						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="campoLaboral"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${entrenadorInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" controller="entrenador" action="edit" id="${entrenadorInstance?.id}">
							<i class="icon-pencil"></i>
							Editar
						</g:link>
						<g:link class="btn" action="perfilEntrenador" id="${entrenadorInstance?.id}">
							<i class="icon-list"></i>
							Perfil
						</g:link>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
