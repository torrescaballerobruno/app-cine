//
//  CarritoViewController.swift
//  Cinema
//
//  Created by Bruno Torres on 10/10/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class CarritoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        tableView.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        total.text = "$   \(carrito.total())"
        tableView.reloadData()
        
    }

    @IBAction func comprar(_ sender: UIButton) {
        carrito.comprar()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito.boletos.count + carrito.dulces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowCarrito", for: indexPath) as! CarritoTableViewCell
        
        if idx < carrito.boletos.count {
            let boleto = Array(carrito.boletos.keys)[idx]
            cell.articulo.text = "\(boleto.hora_inicio) - \(boleto.pelicula.titulo)"
            cell.precio.text = "$\(boleto.precio)"
            cell.cantidad.text = "\(carrito.boletos[boleto]!) X"
        }else{
            let dulce = Array(carrito.dulces.keys)[idx-carrito.boletos.count]
            cell.articulo.text = "\(dulce.nombre)"
            cell.precio.text = "$\(dulce.precio)"
            cell.cantidad.text = "\(carrito.dulces[dulce]!) X"
        }
        
        return cell
    }
}