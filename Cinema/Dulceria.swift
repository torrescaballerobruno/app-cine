//
//  Dulceria.swift
//  Cinema
//
//  Created by Bruno Torres on 10/6/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

struct Dulce{
    
    var imagen: UIImage
    var nombre: String
    var precio: Float
    var descripcion: String
    var existencia: Int
    
    mutating func comprar(cantidad: Int) -> Bool{
        if existencia >= cantidad{
            existencia = existencia - cantidad
            return true
        }else{
            return false
        }
    }
}

extension Dulce: Hashable{
    
    static func == (lhs: Dulce, rhs: Dulce) -> Bool {
        return lhs.nombre == rhs.nombre && lhs.precio == rhs.precio
    }
    
    var hashValue: Int {
        get {
            return nombre.hashValue^precio.hashValue
        }
    }
}

struct Dulceria{
    var dulces: [Dulce]
    
    private func buscarDulce(nombre: String, precio: Float) -> Dulce?{
        return dulces.filter({ (dul) -> Bool in
            return dul.nombre == nombre && dul.precio == precio
        }).first
    }
    
    func comprarDulce(nombre: String, precio: Float, cantidad: Int)-> Bool{
        guard var fun = buscarDulce(nombre: nombre, precio: precio) else {
            return false
        }
        return fun.comprar(cantidad: cantidad)
    }

}

var kitkat = Dulce(imagen: UIImage(named: "kitkat")!, nombre: "KitKat", precio: 25.50, descripcion: "Un chocolate bien chidori", existencia: 30)
var popCH = Dulce(imagen: UIImage(named: "palomitas")!, nombre: "Palomitas chicas", precio: 55, descripcion: "Palomitas chicas", existencia: 50)
var popM = Dulce(imagen: UIImage(named: "palomitas")!, nombre: "Palomitas medianas", precio: 70, descripcion: "Palomitas Medianas", existencia: 50)
var popG = Dulce(imagen: UIImage(named: "palomitas")!, nombre: "Palomitas Grandes", precio: 85, descripcion: "Palomitas Grandes", existencia: 50)
var nachos = Dulce(imagen: UIImage(named: "nachos")!, nombre: "Nachos", precio: 60, descripcion: "Unos nachos con queso", existencia: 40)
var panditas = Dulce(imagen: UIImage(named: "panditas")!, nombre: "Panditas sueltos", precio: 22.50, descripcion: "Panditas de colores sueltos", existencia: 40)
var serpientes = Dulce(imagen: UIImage(named: "serpientes")!, nombre: "Gomitas de Serpiente", precio: 22.50, descripcion: "Gomitas de Serpiente suletas", existencia: 40)



var dulceria:Dulceria = Dulceria( dulces:[kitkat,popCH,popM,popG,nachos,panditas,serpientes])
