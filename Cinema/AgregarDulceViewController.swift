//
//  AgregarDulceViewController.swift
//  Cinema
//
//  Created by Bruno Torres on 10/10/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class AgregarDulceViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var cantidad: UILabel!
    var dulce: Dulce!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = dulce.nombre
        view.backgroundColor = .lightGray
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
        if cant <= 9 && cant <= dulce.existencia-1 {
            cant += 1
            cantidad.text = "\(cant)"
        }
    }
    
    @IBAction func salir(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func agregar(_ sender: UIButton) {
        if cantidad.text != "0"{
            carrito.agregarDulce(dulce: dulce, cantidad: Int.init(cantidad.text!)!)
            dismiss(animated: true, completion: nil)
        }
    }

}
