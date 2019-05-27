import wollok.game.*
import hector.*

class Planta {

	var property listaParaCosechar = false

	method cosechar() {
		if (self.listaParaCosechar()) {
			hector.paraVender().add(self)
			game.removeVisual(self)
		}
	}

}

class Maiz inherits Planta {

	var property imagen = "corn_baby.png"
	var property position = game.at(0, 0)
	var property esAdulta = false

	method imagen() = "corn_baby.png"

	method regar() {
		if (!esAdulta) esAdulta = true
		listaParaCosechar = true
		self.imagen("corn_adult.png")
	}

	method valor() = 150

}

class Trigo inherits Planta {

	var property imagen = "wheat_0.png"
	var property position = game.at(0, 0)
	var property nivel = 0

	method regar() {
		if (nivel < 4) {
			nivel += 1
			self.imagen("wheat_'nivel'.png")
		}
	}

	override method listaParaCosechar() = nivel >= 2

	method valor() = 100 * (nivel - 1)

}

class Tomaco inherits Planta {

	var property siempreLista = true
	var property imagen = "tomaco.png"
	var property position = game.at(0, 0)

	override method listaParaCosechar() = siempreLista

	method regar() {
		self.position().up(1)
	}

	method valor() = 80

}

