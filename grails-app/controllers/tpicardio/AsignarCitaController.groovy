package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class AsignarCitaController{
	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() { 
		redirect(action: "edit")
	}

    def edit() {
		switch (request.method) {
		case 'GET':
	        def usuarioInstance = Usuario.get(1)
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'show'
	            return
	        }

	        [usuarioInstance: usuarioInstance]
			break
		case 'POST':
	        def usuarioInstance = Usuario.get(1)
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'edit'
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
	
	def show() {
		def usuarioInstance = Usuario.get(1)
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


	def delete() {
		def usuarioInstance = Usuario.get(1)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
			redirect action: 'list'
			return
		}

		try {
			usuarioInstance.cita=null
			redirect action: 'edit'
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
			redirect action: 'show', id: params.id
		}
	}
}
