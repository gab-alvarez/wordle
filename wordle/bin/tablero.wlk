import elementoVisualDelJuego.*

object tablero{
	
}

// Cada LetraEnElTablero tiene imagen de fondo que indica el estado, la letra, position
class LetraEnElTablero inherits ElementoVisualDelJuego{
	
	// El estado de la letra, "Inicial" es 
	var estadoActual = "Inicial"
	
	// Devuelve la dirección de la imagen, pero se modifica en base al estado del intento
	override method image() = "celdasPalabra/" + estadoActual + ".png"
	
	// La posición coincide con la palabra a adivinar
	method posicionCorrecta(){
		estadoActual = "Correcto"
	}
	
	// La palabra a adivinar contiene la letra, pero en distinta posición
	method posicionEquivocada(){
		estadoActual = "Errado"
	}
	
	// La palabra a adivinar no contiene esta letra
	method noEstaEnLaPalabra(){
		estadoActual = "Inexistente"
	}
}