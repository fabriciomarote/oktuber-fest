class Marca {
	const property cantDeLupuloPorLitro
	const property paisDeOrigen
	
	method graduacion()
}

class Rubia inherits Marca {
	const graduacion
	
	override method graduacion() = graduacion
}

class Negra inherits Marca{
	const graduacionReglamentaria = 2
	
	override method graduacion() {
	   return graduacionReglamentaria.min(cantDeLupuloPorLitro *2)
	}
}

class Roja inherits Negra {
	
	override method graduacion() {
	   return super()* 1.25
	}
}
