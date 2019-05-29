import wollok.game.*

class Market {
	var x
	var y
	const property position = game.at(x, y)
	var property enCaja 
	method image() = "market.png"
	method hayMercado() = true
}

