class Invitado {
  var seguidoresIg
  
  method popularidad() = seguidoresIg / 2
}

class InvitadoInfluencerDeMascotas inherits Invitado {
  var cantidadDeMascotas
  
  method jugarConMascotas() {
    seguidoresIg = 1.max(seguidoresIg * cantidadDeMascotas)
  }
}