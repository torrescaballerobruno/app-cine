//
//  AgregarBoletosViewController.swift
//  Cinema
//
//  Created by Bruno Torres on 10/10/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class AgregarBoletosViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var cantidad: UILabel!
    var funcion: Funcion!

    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = funcion.pelicula.titulo
        view.backgroundColor = .lightGray
        //print(funcion.cupo_disponible)
    }

    @IBAction func menos(_ sender: UIButton) {
        var cant = Int.init(cantidad.text!)!
        if cant > 1 {
            cant -= 1
            cantidad.text = "\(cant)"
        }
    }

    @IBAction func mas(_ sender: UIButton) {
        var cant = Int.init(cantidad.text!)!
        if cant <= 9 && cant <= funcion.cupo_disponible-1 {
            cant += 1
            cantidad.text = "\(cant)"
        }
    }

    @IBAction func salir(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func agregar(_ sender: UIButton) {
        if cantidad.text != "0"{
            carrito.agregarBoleto(peli: funcion, cantidad: Int.init(cantidad.text!)!)
            dismiss(animated: true, completion: nil)
        }
    }

}
