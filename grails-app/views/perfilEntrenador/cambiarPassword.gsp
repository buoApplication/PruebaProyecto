<%@ page import="tpicardio.Entrenador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'entrenador.label', default: 'Entrenador')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">

			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link controller="cita">
								<i class="icon-plus"></i>
								Crear Cita
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

				<g:hasErrors bean="${entrenadorInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${entrenadorInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${entrenadorInstance?.id}" >
						<g:hiddenField name="version" value="${entrenadorInstance?.version}" />
						<fieldset>
							
							<div class="fieldcontain">
								<label>
									Contraseña Actual: ${entrenadorInstance?.password}
								</label>
							</div>
							
							<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'password', 'error')} ">
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
								<g:link class="btn" action="perfilEntrenador" id="${entrenadorInstance?.id}">
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
