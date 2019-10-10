//
//  Carrito.swift
//  Cinema
//
//  Created by Bruno Torres on 10/5/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit


struct Carrito{

    var boletos =  [Funcion: Int]()  //funcion, cantidad
    var dulces = [Dulce:Int]() //nombreDulce, cantidad

    func total() -> Float{
        var total: Float = 0.0
        for (f, c) in boletos {
            total = total + Float((f.precio * c))
        }

        for(d,c) in dulces{
            total = total + (d.precio * Float(c))
        }

        return total
    }
    
    func comprar(){
        for (f,c) in boletos{
            cartelera.comprarBoletos(nombre: f.pelicula.titulo, horaInicio: f.hora_inicio, cantidad: c)
        }
        for(d,c) in dulces{
            dulceria.comprarDulce(nombre: d.nombre, precio: d.precio, cantidad: c)
        }
    }
    
    mutating func agregarDulce(dulce: Dulce,cantidad: Int){
        
        if dulces.index(forKey: dulce) != nil{
            dulces.updateValue(cantidad + dulces[dulce]!, forKey: dulce)
        }else{
            dulces[dulce] = cantidad
        }
    }
    
    mutating func agregarBoleto(peli: Funcion, cantidad: Int){
        if boletos.index(forKey: peli) != nil{
            boletos.updateValue(cantidad + boletos[peli]!, forKey: peli)
        }else{
            boletos[peli] = cantidad
        }
    }
}

var carrito = Carrito()
