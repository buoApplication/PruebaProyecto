package tpicardio

class Usuario extends User implements Serializable{
    
    double peso
    double altura
    double imc
    static hasMany = [cita:Cita]
	static mappedBy = [cita:"usuario"]
    
    static constraints = {
        edad(size:15..100,blank:false)
        peso(blank:false)
        altura(blank:false)
        imc(blank:false)
    }
    
}
