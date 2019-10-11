//
//  CarteleraCollectionViewController.swift
//  Cinema
//
//  Created by Bruno Torres on 9/26/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CarteleraCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return peliculas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaPeliculas", for: indexPath) as! PeliculaCollectionViewCell
        cell.poster.image = peliculas[indexPath.row].poster
        cell.titulo.text = peliculas[indexPath.row].titulo
        cell.duracion.text = "\(peliculas[indexPath.row].duracion)"
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectFuncion" {
            let dest = segue.destination as! FuncionesTableViewController
            let cell = sender as! PeliculaCollectionViewCell
            
            let indexPath = self.collectionView.indexPath(for: cell)!
            //print(indexPath.row)
            //print(peliculas[indexPath.row].titulo)
            dest.pelicula = peliculas[indexPath.row]
            
        }
    }
    
    /*
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        print("asdasas")
        let tableView = FuncionesTableViewController()
        tableView.pelicula = peliculas[indexPath.row].titulo
        self.navigationController?.pushViewController(tableView, animated: true)
    }*/
 

}
