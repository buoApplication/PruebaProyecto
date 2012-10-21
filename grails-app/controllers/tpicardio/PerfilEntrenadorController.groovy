package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class PerfilEntrenadorController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def springSecurityService

    def index() {
        redirect action: 'perfilEntrenador'
    }
	
	@Secured(['ROLE_USER','IS_AUTHENTICATED_FULLY'])
	def cambiarPassword(){
		switch (request.method) {
			case 'GET':
				def entrenadorInstance = User.get(springSecurityService.principal.id)
				if (!entrenadorInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
					redirect action: 'list'
					return
				}
	
				[entrenadorInstance: entrenadorInstance]
				break
			case 'POST':
				def entrenadorInstance = Entrenador.get(2)
				if (!entrenadorInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
					redirect action: 'list'
					return
				}
	
				if (params.version) {
					def version = params.version.toLong()
					if (entrenadorInstance.version > version) {
						entrenadorInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
								  [message(code: 'entrenador.label', default: 'Entrenador')] as Object[],
								  "Another user has updated this Entrenador while you were editing")
						render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
						return
					}
				}
	
				entrenadorInstance.properties = params
	
				if (!entrenadorInstance.save(flush: true)) {
					render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
					return
				}
	
				flash.message = message(code: 'default.updated.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), entrenadorInstance.id])
				redirect action: 'show', id: entrenadorInstance.id
				break
		}
	}
	
	@Secured(['ROLE_USER'])
	def perfilEntrenador(){
		def entrenadorInstance = User.get(springSecurityService.principal.id)
		if (!entrenadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
			redirect action: 'list'
			return
		}

		[entrenadorInstance: entrenadorInstance]
	}

	@Secured(['ROLE_USER'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [entrenadorInstanceList: Entrenador.list(params), entrenadorInstanceTotal: Entrenador.count()]
    }

	@Secured(['ROLE_USER'])
    def show() {
        def entrenadorInstance = User.get(springSecurityService.principal.id)
        if (!entrenadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
            return
        }

        [entrenadorInstance: entrenadorInstance]
    }

}
