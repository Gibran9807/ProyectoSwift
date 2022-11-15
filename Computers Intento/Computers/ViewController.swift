//
//  ViewController.swift
//  Computers
//
//  Created by Giggs on 09/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    var computers : [GetComputer] = []
    var computerManager = ComputerManager()

    
    @IBOutlet weak var Tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerManager.delegado = self

        Tabla.delegate = self
        Tabla.dataSource = self

        computerManager.verComputer()
        
        
    }
   
    
}



extension ViewController: computerManagerDelegate{
    func mostrarListaComputer(lista: [GetComputer]) {
        
        computers = lista
        
        DispatchQueue.main.sync {
            self.Tabla.reloadData()
        }
        
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.Tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = computers[indexPath.row].title
        cell.detailTextLabel?.text = computers[indexPath.row].description
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.Tabla.deselectRow(at: indexPath, animated: true)
    }
    
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            NetworkingProvider.shared.deleteComputer(id: self.computers[indexPath.row].id) {
//                self.Tabla.deleteRows(at: [indexPath], with: .left)
//            } failure: { error in
//                print(error?.localizedDescription)
//
//            }
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Eliminar"){
            _,_,_ in
            
            
            NetworkingProvider.shared.deleteComputer(id: self.computers[indexPath.row].id) {
                
                self.viewDidLoad()
                
            } failure: { error in
                print(error?.localizedDescription)
            }

            
        }
        
        delete.backgroundColor = .red
        
        
        return UISwipeActionsConfiguration(actions: [delete])

        
    }
	
   
}

