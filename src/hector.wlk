import wollok.game.*

object hector {

	var property plantasAca = #{}
	var property paraVender = #{}
	var property monedero = 0
	var property position = game.at(4, 3)

	method imagen() = "player.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method sembrar(unaPlanta) {
		unaPlanta.position(self.position())
		unaPlanta.sembrar()
		game.addVisual(unaPlanta)
	}

	method plantasAca() {
		plantasAca.clear()
		plantasAca.addAll({ game.colliders(self)})
		plantasAca.remove(self)
		return plantasAca
	}

	method regar() {
		self.plantasAca()
		if (!plantasAca.isEmpty()) plantasAca.forEach({ planta => planta.regar() }) else self.error("no tengo nada para regar")
	}

	method cosechar() {
		self.plantasAca()
		if (!plantasAca.isEmpty()) plantasAca.forEach({ planta => planta.cosechar() }) else self.error("no tengo nada para cosechar")
	}

	method vender() {
		monedero = paraVender.sum({ planta => planta.valor() })
		paraVender.clear()
	}

	method informa() {
		game.say(self, self.monedero())
		game.say(self, self.paraVender())
	}

}

