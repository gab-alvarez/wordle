import baseDeDatos.*
import teclado.*
import juego.*

object estadoDelJuego{
	
	// Condición que se tiene que cumplir para ganar, usada en acertoLaPalabra
	const estadosNecesariosParaGanar = ["Correcto", "Correcto", "Correcto", "Correcto", "Correcto"]
	
	// Intentos que tiene para adivinar
	var intentosRestantes = 6
	
	/**						MÉTODOS VISUALES 				 */
	
	// Agrega visualmente el teclado en la pantalla
	method mostrarTecladoEnPantalla(){}
	
	// Agrega visualmente el tablero en la pantalla
	method mostrarTableroEnPantalla(){}
	
	// Agrega visualmente una letra al intento actual
	method mostrarLetraEnElTablero(unaLetra){}
	
	// Modifica el estado del tablero y teclado en base al último intento, resta un intento y verifica si ganó
	method modificarTableroYTeclado(unaPalabra){
		
		// Guarda el estado individual de cada letra
		const estadosIndividuales = baseDeDatos.estadoIndividualDeCadaLetra(unaPalabra)
		intentosRestantes -= 1
		
		// Actualiza el estado individual de cada letra del tablero y teclado, en base al último intento
		(0..4).forEach({
			posicionDeLaLetra => self.modificarUnaLetraDelTableroYTeclado(unaPalabra, estadosIndividuales, posicionDeLaLetra)
		})
		
		// Verifica si ganó
		if( self.acertoLaPalabra(estadosIndividuales) ){
			self.informarVictoria()
		}
		
		// Verifica si perdió
		if ( not self.acertoLaPalabra(estadosIndividuales) and not self.quedanIntentos()  ){
			self.informarGameOver()
		}
	}
	
	// Modifica el estado de una letra del último intento, tanto en el tablero como en el teclado
	method modificarUnaLetraDelTableroYTeclado(palabra, estados, posicion){
		
	}
	
	/**						MÉTODOS PARA VERIFICAR			 */
	
	// Verifica si una palabra es válida
	method validarIntento(unIntento){
		if(baseDeDatos.esValida(unIntento)){
			
			// Añade la palabra al tablero y modifica el teclado
			self.modificarTableroYTeclado(unIntento)
			teclado.resetearIntento()
		}
		else{
			self.informarIntentoErroneo()
		}
	}
	method quedanIntentos() = intentosRestantes <= 6
	method acertoLaPalabra(estadosIndividuales) = estadosIndividuales == estadosNecesariosParaGanar
	
	/**						MÉTODOS PARA INFORMAR			*/
	method informarVictoria(){}
	method informarLongitudDeLaPalabra(){}
	method informarGameOver(){}
	method informarIntentoErroneo(){}
}



























/**
palabras: rutas

tenés que adivinar una palabra de 5 letras

el usuario escribe una palabra de 5 letras

el juego se fija si es válida

si lo es, actualiza el estado del tablero

el estado del tablero se actualiza indicando la posición individual de cada letra respecto a la  posición de las letras originales de la palabra a adivinar

si la letra está en la misma posición que la original, la letra se vuelve verde

si la palabra original contiene esa letra, pero no en esa posición, se vuelve amarilla

si no la contiene, se vuelve negra

 */
 
/**
1ra parte: tenés que adivinar una palabra de 5 letras
implementación: una lista de n palabras, y usar anyOne
 */
 
/**
2da parte: el usuario escribe una palabra de 5 letras
implementación: algo que tome el input del usuario
 */
 
/**
3ra parte: el juego se fija si es válida
implementación: algo que controle el input del usuario
 */

/**
4ta parte: si lo es, actualiza el estado del tablero
implementación: implementar el tablero, agregar la palabra del usuario al último (relativo) intento
 */
 
/**
implementar el tablero: 
clase ElementoDelTablero -> position, image

clase LetraEnElTablero -> 	letraCorrecta
							estado
							method cambiarEstado()

class EstadoDeUnaTecla

clase LetraEnElTeclado ->	method serPresionada()
 */
 
/**
5ta parte: 
 */
 
 
 
 

 
 
 
 
 
 
 
 
 
 /**

`LetraEnElTablero` podría tener atributos como

```const letraCorrecta
cambiarEstado(){
  image = actualizarEstadoDelJuego.actualizarLetraEnElTablero(letraCorrecta, intento)
}
```

después cada `Intento` se ocupa de 

 */
 
 
/**

object juego{
}


 */ 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 