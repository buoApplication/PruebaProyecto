<%@ page import="tpicardio.Administrador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${administradorInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${administradorInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${administradorInstance?.id}" >
						<g:hiddenField name="version" value="${administradorInstance?.version}" />
						<fieldset>
							
							<div class="fieldcontain">
								<label>
									Contraseña Actual: ${administradorInstance?.password}
								</label>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'password', 'error')} ">
								<label for="password">
									Contraseña Nueva
								</label>
								<g:field type="password" name="password" maxlength="20" value=""/>
							</div>

							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<g:link class="btn" action="perfiladministrador" id="${administradorInstance?.id}">
									<i class="icon-list"></i>
									Perfil
								</g:link>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
