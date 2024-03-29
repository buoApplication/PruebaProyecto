package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService;

class UsuarioController {
	
	def springSecurityService

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	
	def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }
//	@Secured(['ROLE_USER'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[usuarioInstance: new Usuario(params)]
			break
		case 'POST':		
	        def usuarioInstance = new Usuario(params)
			usuarioInstance.encodePassword();
			if (!usuarioInstance.save(flush: true)) {
	            render view: 'create', model: [usuarioInstance: usuarioInstance]
	            return
	        }
			
			flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
	        redirect action: 'show', id: usuarioInstance.id
			break
		}
    }

    def show() {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
            return
        }

        [usuarioInstance: usuarioInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def usuarioInstance = Usuario.get(params.id)
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [usuarioInstance: usuarioInstance]
			break
		case 'POST':
	        def usuarioInstance = Usuario.get(params.id)
			usuarioInstance.encodePassword();
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (usuarioInstance.version > version) {
	                usuarioInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
	                          "Another user has updated this Usuario while you were editing")
	                render view: 'edit', model: [usuarioInstance: usuarioInstance]
	                return
	            }
	        }

	        usuarioInstance.properties = params

	        if (!usuarioInstance.save(flush: true)) {
	            render view: 'edit', model: [usuarioInstance: usuarioInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
	        redirect action: 'show', id: usuarioInstance.id
			break
		}
    }

	@Secured(['ROLE_USER'])
    def delete() {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
            return
        }

        try {
            usuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
