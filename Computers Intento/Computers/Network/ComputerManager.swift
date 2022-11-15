//
//  ComputerManager.swift
//  Computers
//
//  Created by Giggs on 10/11/22.
//

import Foundation

protocol computerManagerDelegate {
    func mostrarListaComputer(lista: [GetComputer])
}


struct ComputerManager {
    var delegado: computerManagerDelegate?
        
    func verComputer() {

        let urlString = "https://636be314ad62451f9fbe7b28.mockapi.io/computers/computers"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url){ datos, respuesta, error in
                
                if error != nil{
                    
                    print("Error al obtener dato de la api", error?.localizedDescription)
                    
                }
                if let datosSeguros = datos{
                    
                    if let listaComputer = self.parsearJson(datosComputer: datosSeguros) {
                        
                        //print("Lista Computers", listaComputer)
                        
                        delegado?.mostrarListaComputer(lista: listaComputer)
                    }
                }
                
            }
            
            tarea.resume()
        }
    }
    
    func parsearJson(datosComputer: Data) -> [GetComputer]? {
        
        let decodificador = JSONDecoder()
        
        do {
            
            let datosDecodificados = try decodificador.decode([GetComputer].self, from: datosComputer)
            
            return datosDecodificados
            
        } catch  {
            
            print("Error al decodificar")
            return nil
            
            
        }
            
    }
    
}
