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
		
		def administrador = new Administrador(username:"nicolas",
									password:springSecurityService.encodePassword("password"),
									cedula:1045621,
									edad:21,
									nombre:"nombre Administrador",
									apellido:"apellido",
									correo:"administrador@unal.edu.co")
		
		//comente todo por que cuando se define un solo User, todos los atributos son validos
		//y era para probar que se pudiera hacer un administrador, Si lo crea pero no lo reconoce al 
		//momento de hacer LogIn
		
		
//		def usuario = new Usuario(cedula:10,
//								  edad:14,
//								  nombre:"nombre usuario",
//								  apellido:"apellido",
//								  correo:"usuario@unal.edu.co",
//								  peso:12,
//								  altura:12,
//								  imc:12,
//								  username:"angie",
//								  password:springSecurityService.encodePassword("password"),
//								  enabled:true).save
//		
//		def entrenador = new Entrenador(username:"camilo",
//									password:springSecurityService.encodePassword("password"),
//									cedula:1022321,
//									edad:89,
//									nombre:"nombre Entrenador",
//									apellido:"apellido",
//									correo:"entrenador@unal.edu.co",
//									campoLaboral:"Salud").save
		administrador.save()
//		usuario.save()
//		entrenador.save()
		
		UserUserRole.create administrador, adminRole
//		UserUserRole.create usuario, sessionRole
//		UserUserRole.create entrenador, userRole
		
    }
    def destroy = {
    }
}
