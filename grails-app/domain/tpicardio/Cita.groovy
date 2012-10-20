package tpicardio

class Cita implements Serializable{
	long id
    Date fecha  
	int hora 
	Entrenador entrenador
	static belongsTo = Usuario
	static hasMany = [usuario:Usuario]    
	
    static constraints = {
        fecha(min: new Date()-1, max: new Date() + 7)
		hora(min:7, max:17)
    }
	
}
