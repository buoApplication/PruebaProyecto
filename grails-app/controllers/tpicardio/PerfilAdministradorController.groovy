package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class PerfilAdministradorController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'perfilAdministrador'
    }
	@Secured(['ROLE_ADMIN','IS_AUTHENTICATED_FULLY'])
	def cambiarPassword(){
		switch (request.method) {
			case 'GET':
				def administradorInstance = Administrador.get(3)
				if (!administradorInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
					redirect action: 'list'
					return
				}
	
				[administradorInstance: administradorInstance]
				break
			case 'POST':
				def administradorInstance = Administrador.get(3)
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
	def perfilAdministrador(){
		def administradorInstance = Administrador.get(3)
		if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
			redirect action: 'list'
			return
		}

		[administradorInstance: administradorInstance]
	}

	@Secured(['ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administradorInstanceList: Administrador.list(params), administradorInstanceTotal: Administrador.count()]
    }
	
	@Secured(['ROLE_ADMIN'])
    def show() {
        def administradorInstance = Administrador.get(3)
        if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
            return
        }

        [administradorInstance: administradorInstance]
    }

    
}
