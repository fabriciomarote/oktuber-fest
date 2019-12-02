class Persona {
	var peso
	const jarrasCompradas
	var escuchaMusicaTradicional
	var nivelDeAguante
	const pais
	
	method estaEbria() {
		return (self.totalDeAlcoholIngerido() * peso) > nivelDeAguante
	}
	
	method leGusta(marca)
	
	method totalDeAlcoholIngerido() {
		return jarrasCompradas.map({jarra => jarra.capacidad()}).sum()
	}
	
	method quiereEntrarA(carpa) {
		return self.leGusta(carpa.cerveza()) and self.prefiereMusicaEn(carpa)
	}
	
	method prefiereMusicaEn(carpa) {
		return escuchaMusicaTradicional == carpa.tieneBandaQueTocaMusicaTradicional()
	}
	
	method puedeEntrarA(carpa) {
		return self.quiereEntrarA(carpa) and carpa.dejaIngresarA(self)
	}

    method ingresarA(carpa) {
         self.validarParaIngresarA(carpa) 
         carpa.ingresa(self)	
    }
	
	method validarParaIngresarA(carpa) {
		if( ! self.puedeEntrarA(carpa)) {
			self.error("No puedo ingresar a carpa")
		}
	}
	
	method esEbrioEmpedernido() {
		return jarrasCompradas.all({ jarra => jarra.capacidad() >= 1 })
	}
	
	method esPatriota() {
		return jarrasCompradas.all({ jarra => jarra.marca().paisDeOrigen() == pais })
	}
}

class Belga inherits Persona{
	
	override method leGusta(marca) {
		return marca.cantDeLupuloPorLitro() > 4
	}	
}

class Checo inherits Persona{
	
	override method leGusta(marca) {
		return marca.graduacion() > 8
	}
}

class Aleman inherits Persona{
	
    override method leGusta(marca) {
		return true
	}
	
	override method quiereEntrarA(carpa) {
		return super(carpa) and carpa.capacidad().even()
	}
}
