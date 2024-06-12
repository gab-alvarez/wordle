object baseDeDatos{
	
	const property palabrasValidas = ["cinco"]
	
	// Selecciona una palabra al azar
	const property palabraAAdivinar = palabrasValidas.anyOne()
	
	method esValida(unaPalabra) = palabrasValidas.contains(unaPalabra)
	
	// method contieneLaLetra(unaLetra) = palabraAAdivinar.contains(unaLetra)
	
	// method estaEnLaPosicionCorrecta(unaLetra, posicion) = palabraAAdivinar.charAt(posicion) == unaLetra
	
	method informarEstado(letra, posicion){
		
		// Se fija si coincide en la posición  
	    if(palabraAAdivinar.charAt(posicion) == letra){
	        return "Correcto"
	    }
	    
	    // Se fija si por lo menos la tiene
	    else if (palabraAAdivinar.contains(letra)){
	        return "Errado"
	    }
	    
	    // No la tiene
	    else{
	        return "Inexistente"
	    }
    }
	
	// Devuelve el estado de cada letra en comparación con la original. Por ejemplo, si es "cinco" y le mandás "cinco", devuelve ["]
    method estadoIndividualDeCadaLetra(unaPalabra){
    	
    	// (0..4) genera 5 números del 0 al 4
        return (0..4).map({
        	
        		// Mapea cada letra con su estado
            	posicion => self.informarEstado( unaPalabra.charAt(posicion), posicion )
        })
    }
}