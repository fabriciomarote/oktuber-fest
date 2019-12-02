class Carpa {
	const property limiteDeGenteAdmitida
	var property tieneBandaQueTocaMusicaTradicional = false	
	const property cerveza //marca
	var property personasQueEstan
	
	method capacidad() = personasQueEstan.size()
	
	method personasEbrias() {
		return personasQueEstan.filter({ persona => persona.estaEbria()})
	}
	
	method cantDeEbriosEmpedernidos() {
	    return 	self.personasEbrias().count( { persona => persona.esEbrioEmpedernido()})
	}
	
	method seSuperaCapacidad() {
		return (self.capacidad() +1) > limiteDeGenteAdmitida
	}
	
	method dejaIngresarA(persona) {
		return not (self.seSuperaCapacidad() and persona.estaEbria())
	}
	
	method ingresa(persona) { 
		personasQueEstan.add(persona)
	}
}

class Jarra {
	const property capacidad
	const property marca

   method contenidoDeAlcohol() {
   	  return capacidad * marca.graduacion()
   }
}