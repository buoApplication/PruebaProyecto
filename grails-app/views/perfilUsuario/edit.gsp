<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">

			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${usuarioInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${usuarioInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${usuarioInstance?.id}" >
						<g:hiddenField name="version" value="${usuarioInstance?.version}" />
						<fieldset>
							<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
								<label for="cedula">
									<g:message code="usuario.cedula.label" default="Cedula" />
									<span class="required-indicator">*</span>
								</label>
								<g:field name="cedula" type="number" value="${usuarioInstance.cedula}" required=""/>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
								<label for="nombre">
									<g:message code="usuario.nombre.label" default="Nombre" />
									<span class="required-indicator">*</span>
								</label>
								<g:textField name="nombre" maxlength="50" required="" value="${usuarioInstance?.nombre}"/>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
								<label for="apellido">
									<g:message code="usuario.apellido.label" default="Apellido" />
									<span class="required-indicator">*</span>
								</label>
								<g:textField name="apellido" maxlength="50" required="" value="${usuarioInstance?.apellido}"/>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
								<label for="correo">
									<g:message code="usuario.correo.label" default="Correo" />
									<span class="required-indicator">*</span>
								</label>
								<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'edad', 'error')} required">
								<label for="edad">
									<g:message code="usuario.edad.label" default="Edad" />
									<span class="required-indicator">*</span>
								</label>
								<g:field name="edad" type="number" min="10" max="100" value="${usuarioInstance.edad}" required=""/>
							</div>

							<div class="form-actions">
								<g:link class="btn" action="cambiarPassword" id="${usuarioInstance?.id}">
									<i class="icon-list"></i>
									Cambiar Contraseña
								</g:link>
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									Editar
								</button>
								<g:link class="btn" action="perfilUsuario" id="${usuarioInstance?.id}">
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
