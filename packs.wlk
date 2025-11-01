import coordinadores.*


class Pack {
    var property duracionDias
    var property precioBase
    const property beneficiosEspeciales = #{}
    var property coordinador

    method agregarBeneficio(unBeneficio) {beneficiosEspeciales.add(unBeneficio)}
    method beneficiosVigentes() = beneficiosEspeciales.filter({b => b.estaVigente()})
    method valorFinal() = precioBase + self.beneficiosVigentes().sum({b => b.costo()})
    method esPremium()
}

class PackNacional inherits Pack {
    var property provincia
    const property actividades = #{}
  
    method provincia() = provincia
    method agregarActividad(unaActividad) {actividades.add(unaActividad)}
    method sacarActividad(unaActividad) {actividades.remove(unaActividad)}

    override method esPremium() = duracionDias >= 10 and coordinador.esAltamenteCalificado()
}

class PackInternacional inherits Pack {
    const pais
    var cantEscalas
    var property esLugarDeInteres

    method pais() = pais
    method cantEscalas() = cantEscalas

    override method valorFinal() = super() * 1.2

    override method esPremium() = esLugarDeInteres and duracionDias >= 20 and cantEscalas == 0
}

class PackProvinciales inherits PackNacional {
    var cantCiudadesAVisitar

    method sumarCiudarAVisitar() {cantCiudadesAVisitar += 1}
    method restarCiudarAVisitar() {cantCiudadesAVisitar -= 1}

    override method esPremium() = actividades.size() >= 4 and cantCiudadesAVisitar > 5 and beneficiosEspeciales.count({beneficio => beneficio.estaVigente()}) >= 3

    override method valorFinal() = if(self.esPremium()) {super() * 1.05} else super()
}

class Beneficio {
    const property tipo 
    const property costo
    var property estaVigente
}