
<%@ page import="tpicardio.Administrador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link controller="usuario">
								<i class="icon-list"></i>
								Usuario 11, 43.
							</g:link>
							<g:link controller="entrenador">
								<i class="icon-list"></i>
								Entrenador
							</g:link>
							<g:link controller="asistencia">
								<i class="icon-list"></i>
								Asistencia
							</g:link>
							<g:link controller="cita">
								<i class="icon-list"></i>
								Cita
							</g:link>
							<g:link controller="ejercicio">
								<i class="icon-list"></i>
								Ejercicio
							</g:link>
							<g:link controller="entrenador">
								<i class="icon-list"></i>
								Entrenador
							</g:link>
							<g:link controller="maquina">
								<i class="icon-list"></i>
								Maquina
							</g:link>
							<g:link controller="prueba">
								<i class="icon-list"></i>
								Prueba
							</g:link>
							<g:link controller="tip">
								<i class="icon-list"></i>
								Tips
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
				
					<g:if test="${administradorInstance?.cedula}">
						<dt><g:message code="administrador.cedula.label" default="Cedula" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="cedula"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.nombre}">
						<dt><g:message code="administrador.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.apellido}">
						<dt><g:message code="administrador.apellido.label" default="Apellido" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="apellido"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.correo}">
						<dt><g:message code="administrador.correo.label" default="Correo" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="correo"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.password}">
						<dt><g:message code="administrador.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.edad}">
						<dt><g:message code="administrador.edad.label" default="Edad" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="edad"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${administradorInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" controller="administrador" action="edit" id="${administradorInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:link class="btn" action="perfilAdministrador" id="${administradorInstance?.id}">
							<i class="icon-list"></i>
							Perfil
						</g:link>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
