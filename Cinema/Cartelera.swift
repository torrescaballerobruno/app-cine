import UIKit

struct Pelicula{
    var poster: UIImage
    var titulo: String
    var clasificacion: String
    var duracion: Int
    var sinopsis: String
    var genero: String
    var valoracion: Double
}

struct Sala{
    var tipo: String
    var cupo_max: Int
}

struct Funcion{
    var sala: Sala
    var hora_inicio: String
    var hora_fin: String
    var pelicula: Pelicula
    var cupo_disponible: Int
    var precio: Int
    
    mutating func comprar(cantidad: Int) -> Bool{
        if cupo_disponible >= cantidad{
            cupo_disponible = cupo_disponible - cantidad
            return true
        }else{
            return false
        }
    }
}

extension Funcion: Hashable{

    static func == (lhs: Funcion, rhs: Funcion) -> Bool {
        return lhs.pelicula.titulo == rhs.pelicula.titulo && lhs.hora_inicio == rhs.hora_inicio
    }

    var hashValue: Int {
        get {
            return pelicula.titulo.hashValue^hora_inicio.hashValue
        }
    }
}

struct Cartelera{
    var funciones : [Funcion]

    func buscarFuncionesDe(nombre: String) -> [Funcion]{
        return funciones.filter { (fun) -> Bool in
            return fun.pelicula.titulo == nombre
        }
    }
    
    private func buscarFuncion(nombre: String, horaInicio: String) -> Funcion?{
        return funciones.filter({ (fun) -> Bool in
            return fun.pelicula.titulo == nombre && fun.hora_inicio == horaInicio
        }).first
    }
    
    func comprarBoletos(nombre: String, horaInicio: String, cantidad: Int)-> Bool{
        guard var fun = buscarFuncion(nombre: nombre, horaInicio: horaInicio) else {
            return false
        }
        return fun.comprar(cantidad: cantidad)
    }
}







var vip = Sala(tipo: "VIP", cupo_max: 50)
var iMax = Sala(tipo: "iMax",cupo_max: 75)


var it = Pelicula(poster: UIImage(named: "it")!, titulo: "IT", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 4.0)
var avengers = Pelicula(poster: UIImage(named: "avengers")!, titulo: "Avengers End Game", clasificacion: "C", duracion: 180, sinopsis: "Ultima pelicula de avengers", genero: "Accion", valoracion: 5.0)
var joker = Pelicula(poster: UIImage(named: "joker")!, titulo: "El Bromas", clasificacion: "C", duracion: 120, sinopsis: "La vida de el Joker", genero: "Drama", valoracion: 4.5)
var birdsOfPrey = Pelicula(poster: UIImage(named: "birdsOfPrey")!, titulo: "Birds Of Prey", clasificacion: "C", duracion: 120, sinopsis: "Salo Harley Quinn bb", genero: "Accion", valoracion: 5.0)
var john = Pelicula(poster: UIImage(named: "john3")!, titulo: "John Wick 3", clasificacion: "B15", duracion: 120, sinopsis: "No se", genero: "Accion", valoracion: 4.0)




var peliculas : [Pelicula] = [it,avengers,joker,birdsOfPrey,john]

var fIt = Funcion(sala: vip, hora_inicio:"14:00", hora_fin: "16:00", pelicula: it, cupo_disponible: 40, precio: 70)
var fAvengers = Funcion(sala: vip, hora_inicio: "16:30", hora_fin: "19:30", pelicula: avengers, cupo_disponible: 50, precio: 70)
var fJocker = Funcion(sala: iMax, hora_inicio: "12:00", hora_fin: "14:00", pelicula: joker, cupo_disponible: 70, precio: 120)
var fBirdsOfPrey = Funcion(sala: iMax, hora_inicio: "14:30", hora_fin: "16:30", pelicula: birdsOfPrey, cupo_disponible: 65, precio: 120)

var cartelera = Cartelera(funciones: [fIt,fAvengers,fJocker,fBirdsOfPrey])
