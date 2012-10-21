package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class AdministradorController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

//	@Secured(['ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administradorInstanceList: Administrador.list(params), administradorInstanceTotal: Administrador.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[administradorInstance: new Administrador(params)]
			break
		case 'POST':
	        def administradorInstance = new Administrador(params)
	        if (!administradorInstance.save(flush: true)) {
	            render view: 'create', model: [administradorInstance: administradorInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])
	        redirect action: 'show', id: administradorInstance.id
			break
		}
    }

	@Secured(['ROLE_ADMIN'])
    def show() {
        def administradorInstance = Administrador.get(params.id)
        if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
            return
        }

        [administradorInstance: administradorInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def administradorInstance = Administrador.get(params.id)
	        if (!administradorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [administradorInstance: administradorInstance]
			break
		case 'POST':
	        def administradorInstance = Administrador.get(params.id)
	        if (!administradorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (administradorInstance.version > version) {
	                administradorInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'administrador.label', default: 'Administrador')] as Object[],
	                          "Another user has updated this Administrador while you were editing")
	                render view: 'edit', model: [administradorInstance: administradorInstance]
	                return
	            }
	        }

	        administradorInstance.properties = params

	        if (!administradorInstance.save(flush: true)) {
	            render view: 'edit', model: [administradorInstance: administradorInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])
	        redirect action: 'show', id: administradorInstance.id
			break
		}
    }

	@Secured(['ROLE_ADMIN','IS_AUTHENTICATED_FULLY'])
    def delete() {
        def administradorInstance = Administrador.get(params.id)
        if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
            return
        }

        try {
            administradorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
