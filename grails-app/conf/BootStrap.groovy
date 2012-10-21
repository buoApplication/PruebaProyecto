import tpicardio.Administrador
import tpicardio.Entrenador
import tpicardio.Persona
import tpicardio.User
import tpicardio.UserRole
import tpicardio.UserUserRole
import tpicardio.Usuario

class BootStrap {
	def springSecurityService

    def init = { servletContext ->
		def userRole = UserRole.findByAuthority("ROLE_USER") ?: new UserRole(authority:"ROLE_USER").save();
		def adminRole = UserRole.findByAuthority("ROLE_ADMIN") ?: new UserRole(authority:"ROLE_ADMIN").save();
		def sessionRole = UserRole.findByAuthority("IS_AUTHENTICATED_FULLY") ?: new UserRole(authority:"IS_AUTHENTICATED_FULLY").save();
		
		def administrador = new Administrador(username:"administrador",
									password:springSecurityService.encodePassword("password"),
									cedula:1045621,
									edad:21,
									nombre:"nombre Administrador",
									apellido:"apellido",
									correo:"administrador@unal.edu.co")
		
		administrador.save()
		UserUserRole.create administrador, adminRole
    }
    def destroy = {
    }
}
