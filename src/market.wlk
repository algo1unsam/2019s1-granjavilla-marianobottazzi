import wollok.game.*

class Market {
	var x
	var y
	var property enCaja
	method position() = game.at(x, y)
	method image() = "market.png"
	method hayMercado() = true
}

