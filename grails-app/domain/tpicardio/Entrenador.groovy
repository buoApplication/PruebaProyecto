package tpicardio

class Entrenador extends User implements Serializable{

    String campoLaboral
	    
    static constraints = {
    }
	
    String toString(){
       cedula + "-" + nombre +" "+ apellido
    }
}
