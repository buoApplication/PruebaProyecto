<%@ page import="tpicardio.Entrenador" %>



<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cedula', 'error')} required">
	<label for="cedula">
		<g:message code="entrenador.cedula.label" default="Cedula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cedula" type="number" value="${entrenadorInstance.cedula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="entrenador.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${entrenadorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="entrenador.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" maxlength="50" required="" value="${entrenadorInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="entrenador.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${entrenadorInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="entrenador.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" maxlength="20" value="${entrenadorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="entrenador.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="edad" type="number" min="10" max="100" value="${entrenadorInstance.edad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'campoLaboral', 'error')} ">
	<label for="campoLaboral">
		<g:message code="entrenador.campoLaboral.label" default="Campo Laboral" />
		
	</label>
	<g:textField name="campoLaboral" value="${entrenadorInstance?.campoLaboral}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cita', 'error')} ">
	<label for="cita">
		<g:message code="entrenador.cita.label" default="Cita" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entrenadorInstance?.cita?}" var="c">
    <li><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cita" action="create" params="['entrenador.id': entrenadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cita.label', default: 'Cita')])}</g:link>
</li>
</ul>

</div>

