import wollok.game.*
import hector.*

class Planta {

	method listaParaCosechar()

	method cosechar() {
		if (self.listaParaCosechar()) {
			hector.paraVender().add(self)
			game.removeVisual(self)
		}
	}
	method hayMercado() = false
}

class Maiz inherits Planta {

	var property image = "corn_baby.png"
	var property position = game.at(0, 0)
	var property esAdulta = false
	var property listaParaCosechar = false

	method image() = "corn_baby.png"

	method regar() {
		if (!esAdulta) esAdulta = true
		listaParaCosechar = true
		self.image("corn_adult.png")
	}

	method valor() = 150

}

class Trigo inherits Planta {

	var property image = "wheat_0.png"
	var property position = game.at(0, 0)
	var property nivel = 0

	method regar() {
		if (nivel < 3) {
			nivel += 1
			self.image("wheat_"+nivel+".png")
		}
	}

	override method listaParaCosechar() = nivel > 1

	method valor() = 100 * (nivel - 1)

}

class Tomaco inherits Planta {

	var property siempreLista = true
	var property image = "tomaco.png"
	var property position = game.at(0, 0)

	override method listaParaCosechar() = siempreLista

	method regar() {
		position = self.position().up(1)
	}

	method valor() = 80

}

