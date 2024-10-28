class Stream {
  const invitados
  
  method estaPegado() = self.nivelDeHype() > 60
  
  method nivelDeHype() = invitados.sum(
    { invitado => invitado.popularidad() }
  ).min(100)
  
  method ganancias() = self.viewers() * self.nivelDeHype()
  
  method viewers()
}

class EpisodioCanal inherits Stream (invitados = []) {
  var costoProduccion
  
  override method ganancias() = super() - costoProduccion
}

class EpisodioHayAlgoAhi inherits EpisodioCanal {
  var dia
  
  method hayAnalisisSesudos() = dia.estaInteresante()
  
  override method viewers() = if (self.hayAnalisisSesudos()) 10000 else 20000
  
  override method nivelDeHype() = 100
}

class DiaEnLaRealidad {
  var cantSucesos = 10
  
  method sucesos(cantidad) {
    cantSucesos = cantidad
  }
  
  method estaInteresante() = cantSucesos > 5
}

class EpisodioSonieQueVolaba inherits EpisodioCanal {
  const canciones
  
  override method viewers() = canciones * 10000
}

class SesionStreamerIndependiente inherits Stream {
  var suscriptores
  
  method frenesiDeSuscripciones() {
    suscriptores *= 2
  }
  
  override method viewers() = (suscriptores * 1.randomUpTo(3)).truncate(0)
}

class SesionStreamDeCoscu inherits SesionStreamerIndependiente {
  var momentoDelDia
  
  override method viewers() = super() + momentoDelDia.genteConectada()
}

object maniana {
  method genteConectada() = 1000
}

object tarde {
  method genteConectada() = 5000
}

object noche {
  method genteConectada() = 10000
}

object streamIvo inherits SesionStreamerIndependiente (
  invitados = [],
  suscriptores = 1200
) {
  // BONUS: objeto heredando 
  // y dandole valor a los atributos heredados
}