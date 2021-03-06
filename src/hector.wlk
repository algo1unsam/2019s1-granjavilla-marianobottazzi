import wollok.game.*
import market.*

object hector {

	var property paraVender = #{}
	var property monedero = 0
	var property position = game.at(4, 3)

	method imagen() = "player.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method sembrar(unaPlanta) {
		if(!self.mercado().hayMercado()){	
			unaPlanta.position(self.position())
			game.addVisual(unaPlanta)
			}
		else self.error("aca no se puede plantar")
	}

	method regar() {
		if (!game.colliders(self).asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.regar() }) else self.error("no tengo nada para regar")
	}

	method cosechar() {
		if (!game.colliders(self).asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.cosechar() }) else self.error("no tengo nada para cosechar")
	}

	method vender() {
		if(!game.colliders(self).asSet().isEmpty())
			if (self.mercado().hayMercado()) {
				monedero = paraVender.sum({ planta => planta.valor() }).min(self.mercado().enCaja()) 
				self.mercado().enCaja((self.mercado().enCaja() - paraVender.sum({ planta => planta.valor() })).max(0))
				paraVender.clear()
			} else self.error("ahi no hay un mercado")
		else self.error("aca no hay un mercado")
//		else game.errorReporter("aca no hay mercado")
	}
	
	method mercado() = game.colliders(self).first()
	
	method informe() {
		game.say(self, self.monedero())
		game.say(self, self.paraVender())
	}

}

