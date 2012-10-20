package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class CitaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [citaInstanceList: Cita.list(params), citaInstanceTotal: Cita.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[citaInstance: new Cita(params)]
			break
		case 'POST':
	        def citaInstance = new Cita(params)
	        if (!citaInstance.save(flush: true)) {
	            render view: 'create', model: [citaInstance: citaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])
	        redirect action: 'show', id: citaInstance.id
			break
		}
    }

    def show() {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'list'
            return
        }

        [citaInstance: citaInstance]
    }

	@Secured(['ROLE_USER'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def citaInstance = Cita.get(params.id)
	        if (!citaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [citaInstance: citaInstance]
			break
		case 'POST':
	        def citaInstance = Cita.get(params.id)
	        if (!citaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (citaInstance.version > version) {
	                citaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'cita.label', default: 'Cita')] as Object[],
	                          "Another user has updated this Cita while you were editing")
	                render view: 'edit', model: [citaInstance: citaInstance]
	                return
	            }
	        }

	        citaInstance.properties = params

	        if (!citaInstance.save(flush: true)) {
	            render view: 'edit', model: [citaInstance: citaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])
	        redirect action: 'show', id: citaInstance.id
			break
		}
    }

	@Secured(['ROLE_USER'])
    def delete() {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'list'
            return
        }

        try {
            citaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
