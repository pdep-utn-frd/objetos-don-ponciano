object ponciano {
	var cultivo = trigo
	var dinero = 5000
	var hecSembrada = 10
	const superficieTotal = 15
	
	method fertilizar(valor) {
		dinero = dinero - valor * hecSembrada
		cultivo.aumentarRendimiento()
	}
	
	method fumigar() {
		dinero -= 10 * superficieTotal
	}
	
	method resembrar(nuevoCultivo) {
		cultivo = nuevoCultivo
		dinero = dinero - hecSembrada * cultivo.costo(hecSembrada)
	}
	
	method ampliarSuperficie() {
		hecSembrada = superficieTotal
	}
	
	method nuevaTemporada(nuevoCultivo, superficie) {
		dinero = dinero + cultivo.rendimiento() * hecSembrada * cultivo.precioVenta()		
		hecSembrada = superficie.min(superficieTotal)
		self.resembrar(nuevoCultivo)
	}
}

object trigo {
	var rendimiento = 10
	
	method costo(hecSembrada) = 500
	
	method aumentarRendimiento() {
		rendimiento = rendimiento + 2	
	}
	
	method rendimiento() = rendimiento
	
	method precioVenta() = 1000
}


object maiz {
	method costo(hecSembrada) {
		return (500 * hecSembrada).min(5000)
	}
	
	method aumentarRendimiento() {}
	
	method rendimiento() = 15
	
	method precioVenta() = soja.precioVenta()
}

object soja {
	var estaFertilzado = false
		
	method costo(hecSembrada) {
		return self.precioVenta() / 2
	}
	
	method aumentarRendimiento() {
		estaFertilzado = not estaFertilzado		
	}
	
	method rendimiento() = if (estaFertilzado) 40 else 20
	
	method precioVenta() {
		return chicago.cotizacion() * dolar.conversion() * 0.65
	}
}

object chicago {
	method cotizacion() = 250
}

object dolar {
	method conversion() = 500
}