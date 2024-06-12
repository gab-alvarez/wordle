import elementoVisualDelJuego.*
import estadoDelJuego.*
import wollok.game.*

// Tiene ID, posición e imagen
class LetraEnElTeclado inherits ElementoVisualDelJuego{
	const property idLetra
	
	override method image() = "letras/" + idLetra + ".png" 
	
	method serPresionada(){
		game.whenKeyPressedDo(keyboard.letter(idLetra), { teclado.letraPresionada(idLetra) })
	}
}

object teclado{
	
	// El intento del usuario, tiene que ser 5 letras
	const intentoActual = []
	const property letrasDelTeclado = []
	
	// Agrega el teclado funcional a la pantalla
	method mostrarTecladoEnPantalla(){
		
		// Instancia todos los datos del teclado
		self.generarTeclado()
		
		// Lo añade a la pantalla visualmente
		estadoDelJuego.mostrarTecladoEnPantalla()
	}
	
	// Instancia todos los valores y los añade a letrasDelTeclado
	method generarTeclado(){
		abecedario.inicializar()
		
		self.inicializarLetrasDelTeclado()
	}
	
	// Método auxiliar para generarTeclado(), añade a letrasDelTeclado cada letra con su posición
	method inicializarLetrasDelTeclado(){
		abecedario.diccionarioLetraPosicion().forEach({
			letra, posicion =>
			letrasDelTeclado.add( new LetraEnElTeclado( idLetra= letra, position = posicion ) )
		})
	}
	
	// Se encarga de manejar lo que pasa cuando se presiona una letra: se la añade al tablero visulamente y al intento
	method letraPresionada(unaLetra){
		self.agregarLetraAlIntento(unaLetra)
		estadoDelJuego.mostrarLetraEnElTablero(unaLetra)
	}
	
	// Añade la letra al intento si tiene menos de 6 letras
	method agregarLetraAlIntento(unaLetra){
		if ( intentoActual.size() <= 5 ){
			intentoActual.add(unaLetra)
		}
	}
	
	method enviarIntentoActual(){
		keyboard.enter().onPressDo({ self.validarIntentoActual() })
	}
	// Verifica que tenga 5 letras y se lo delega a estadoDelJuego
	method validarIntentoActual(){
		if (intentoActual.size() == 5){
			estadoDelJuego.validarIntento(intentoActual.toString())
		}
	}
	
	method resetearIntento(){
		intentoActual.clear()
	}
}

object abecedario {
	const property diccionarioLetraPosicion = new Dictionary()
	
	
	method inicializar(){
		diccionarioLetraPosicion.put("q",game.at(5,6))
		diccionarioLetraPosicion.put("w",game.at(7,6))
		diccionarioLetraPosicion.put("e",game.at(9,6))
		diccionarioLetraPosicion.put("r",game.at(11,6))
		diccionarioLetraPosicion.put("t",game.at(13,6))
		diccionarioLetraPosicion.put("y",game.at(15,6))
		diccionarioLetraPosicion.put("u",game.at(17,6))
		diccionarioLetraPosicion.put("i",game.at(19,6))
		diccionarioLetraPosicion.put("o",game.at(21,6))
		diccionarioLetraPosicion.put("p",game.at(23,6))
		
		diccionarioLetraPosicion.put("a",game.at(6,4))
		diccionarioLetraPosicion.put("s",game.at(8,4))
		diccionarioLetraPosicion.put("d",game.at(10,4))
		diccionarioLetraPosicion.put("f",game.at(12,4))
		diccionarioLetraPosicion.put("g",game.at(14,4))
		diccionarioLetraPosicion.put("h",game.at(16,4))
		diccionarioLetraPosicion.put("j",game.at(18,4))
		diccionarioLetraPosicion.put("k",game.at(20,4))
		diccionarioLetraPosicion.put("l",game.at(22,4))
		
		//lista.put("delete",game.at(5,2))
		diccionarioLetraPosicion.put("z",game.at(8,2))
		diccionarioLetraPosicion.put("x",game.at(10,2))
		diccionarioLetraPosicion.put("c",game.at(12,2))
		diccionarioLetraPosicion.put("v",game.at(14,2))
		diccionarioLetraPosicion.put("b",game.at(16,2))
		diccionarioLetraPosicion.put("n",game.at(18,2))
		diccionarioLetraPosicion.put("m",game.at(20,2))
		//lista.put("enter",game.at(22,2))
	}	
	
}
