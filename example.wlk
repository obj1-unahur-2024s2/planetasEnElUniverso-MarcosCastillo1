class Persona {
  var monedas = 20
  var edad 

  
  method esDestacado(){
    return edad.between(18, 65) or monedas > 30

  }   
  method edad() = edad
  method cumplirAnios() {
    edad = edad +1
  }

  method monedas() = monedas
  method gastarMonedas(unaCantidad) {
    monedas -= unaCantidad    
  } 
    method sumarMonedas(unaCantidad) {
    monedas += unaCantidad    
  } 
}

class Construccion {
  method valor()  
}

class Muralla inherits Construccion  {
  const property  longitud 
  override method valor() = longitud * 10



}

class Museo inherits Construccion {
  const property superficieCubierta
  const property indiceDeImportancia 
  override method valor() = superficieCubierta * indiceDeImportancia  
  
}

class Planetas {
  const personas =#{}
  const construcciones = []
  
  method delegacionDiplomatica() = self.habitantesDestacados() + #{self.habitanteConMasRecursos()}

  method habitantesDestacados() = personas.filter({personas => personas.esDestacado()})

  method habitanteConMasRecursos() = personas.max({persona => persona.monedas()})

  method esValioso() = construcciones.sum({construcciones => construcciones.valor()}) > 100

  method agregarPersonas(unaPersona) {
    personas.add(unaPersona)
    
  }
    method agregarConstruccion(unaConstruccion) {
    construcciones.add(unaConstruccion)
    
  }

  method personas() = personas

  method construcciones() = construcciones  


}


class Productor inherits Persona {
  const tecnicas = #{"cultivo"}
  const property planetaQueVive 

  method cantidadDeTecnicas() = tecnicas.size()

  method tecnicas() = tecnicas

  override method monedas() = super() * self.cantidadDeTecnicas()

  override method esDestacado() = super() or self.cantidadDeTecnicas() > 5


  method realizarTecnica_Durante(unaTecnica,unTiempo) {
    if (tecnicas.contains({unaTecnica})){ monedas = monedas + 3 * unTiempo}
    else{monedas= monedas -1}
  } 

  method aprenderUnaTecnica(unaTecnica) {
    tecnicas.add({unaTecnica})
  }

  method trabajarEn_Durante(unPlaneta,unTiempo) {
    if(planetaQueVive == unPlaneta){self.realizarTecnica_Durante(tecnicas.last(), unTiempo)}
    
  }



  
}
