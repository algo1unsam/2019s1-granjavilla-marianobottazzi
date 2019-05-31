import wollok.game.*
import market.*

object hector {

	var property paraVender = #{}
	var property monedero = 0
	var property position = game.at(4, 3)

	method image() = "player.png"

	method objetosAca() = game.colliders(self)

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method sembrar(unaPlanta) {
		if (self.objetosAca().asSet().isEmpty()) {
			unaPlanta.position(self.position())
			game.addVisual(unaPlanta)
			}
		else {
			if(!self.objetosAca().first().hayMercado()) {
				unaPlanta.position(self.position())
				game.addVisual(unaPlanta)
				}
			else self.error("aca no se puede plantar")
		}
	}

	method regar() {
		if (!self.objetosAca().asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.regar() }) else self.error("no tengo nada para regar")
	}

	method cosechar() {
		if (!self.objetosAca().asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.cosechar() }) else self.error("no tengo nada para cosechar")
	}

	method vender() {
		if (!self.objetosAca().asSet().isEmpty()) {
			monedero = paraVender.sum({ planta => planta.valor() }).min(self.objetosAca().first().enCaja())
			self.objetosAca().first().enCaja((self.objetosAca().first().enCaja() - paraVender.sum({ planta => planta.valor() })).max(0))
			paraVender.clear()
			}
		else self.error("ahi no hay un mercado")
	}

	method mochila() = paraVender.size()

	method informe() {
		game.say(self, "tengo "+self.monedero()+" monedas de oro")
		game.say(self, "y tengo "+self.mochila()+" plantas para vender")
	}

}

