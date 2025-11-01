class Coordinador {
    var cantidadDeViajes
    var property estaMotivado
    var añosDeExperiencia
    var rol
    const property listaDeRoles = #{guia, asistenteLogico, acompañante}

    method cantidadDeViajes() = cantidadDeViajes
    method sumarViaje() {cantidadDeViajes += 1}
    method añosDeExperiencia() = añosDeExperiencia
    method sumarAñosDeExperiencia() {añosDeExperiencia += 1}
    method rol() = rol
    method cambiarRol(unRol) {
        if (!listaDeRoles.contains(unRol)) {
            throw new Exception(message = "Este no es un rol valido")
        }
        rol = unRol
    }

    method esAltamenteCalificado() = 
        cantidadDeViajes > 20 && (
            (rol == guia && estaMotivado) ||
            (rol == asistenteLogico && añosDeExperiencia >= 3) ||
            (rol == acompañante)
        )
}

object guia {}
object asistenteLogico {}
object acompañante {}