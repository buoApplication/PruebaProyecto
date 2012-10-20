<%@ page import="tpicardio.Usuario" %>
<%@ page import="tpicardio.Cita" %>
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
							<div class="control-group ">
								<label class="control-label" for="cita">Seleccione una Cita</label>
								<div class="controls">
									<g:select name="cita" from="${tpicardio.Cita.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.cita*.id}" class="many-to-many"/>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									Asignar
								</button>
								<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>
			</div>
		</div>
	</body>
</html>
