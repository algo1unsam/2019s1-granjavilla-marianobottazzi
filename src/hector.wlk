import wollok.game.*

object hector {

	var property paraVender = #{}
	var property monedero = 0
	var property position = game.at(4, 3)

	method imagen() = "player.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method sembrar(unaPlanta) {
		unaPlanta.position(self.position())
		game.addVisual(unaPlanta)
	}

	method regar() {
		if (!game.colliders(self).asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.regar() }) else self.error("no tengo nada para regar")
	}

	method cosechar() {
		if (!game.colliders(self).asSet().isEmpty()) game.colliders(self).forEach({ planta => planta.cosechar() }) else self.error("no tengo nada para cosechar")
	}

	method vender() {
		if(game.colliders(self).hayMercado()) {
			monedero = (game.colliders(self).enCaja() - paraVender.sum({ planta => planta.valor() })).max(0)
			paraVender.clear()
			}
		else self.error("aca no hay un mercado")
	}
                   
	method informe() {
		game.say(self, self.monedero())
		game.say(self, self.paraVender())
	}

}

