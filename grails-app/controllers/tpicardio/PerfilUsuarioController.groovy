package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class PerfilUsuarioController {
	
    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def springSecurityService
		
    def index() {
        redirect action: 'perfilUsuario'
    }
	
	
	// CREAR EL SERVICIO springSecurityService
	// BUSCAR 
	
	
	
	
	def cambiarPassword(){
		switch (request.method) {
			case 'GET':
				def usuarioInstance = User.get(springSecurityService.principal.id)

				if (!usuarioInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
					redirect action: 'list'
					return
				}
	
				[usuarioInstance: usuarioInstance]
				break
			case 'POST':
				def usuarioInstance = User.get(springSecurityService.principal.id)

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
	
	def perfilUsuario(){
		def usuarioInstance = User.get(springSecurityService.principal.id)

		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
			redirect action: 'list'
			return
		}

		[usuarioInstance: usuarioInstance]
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def show() {
        def usuarioInstance = User.get(springSecurityService.principal.id)

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
	        def usuarioInstance = User.get(springSecurityService.principal.id)

	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [usuarioInstance: usuarioInstance]
			break
		case 'POST':
	        def usuarioInstance = User.get(springSecurityService.principal.id)

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
}
