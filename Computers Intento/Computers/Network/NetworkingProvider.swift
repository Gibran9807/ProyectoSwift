//
//  NetworkingProvider.swift
//  Computers
//
//  Created by Giggs on 09/11/22.
//

import Foundation
import Alamofire
import UIKit

final class NetworkingProvider{
    
    static let shared = NetworkingProvider()
    
    private let baseUrl = "https://636be314ad62451f9fbe7b28.mockapi.io/computers/computers"

    private let statusOk = 200...299
    

    
    func getComputer(id: Int, success: @escaping (_ computer: Computer) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(baseUrl)/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: ComputersResponse.self) {
            response in
            
            if let computer = response.value?.one {
                success(computer)
            }
            else{
                failure(response.error)
            }
            
        }
        
    }
    
    
    //Añadir usuario
    func postComputer(computer: NewComputer, success: @escaping (_ computer: Computer) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(baseUrl)"
        //header de autenticacion
        
        
        AF.request(url, method: .post, parameters: computer, encoder: JSONParameterEncoder.default).validate(statusCode: statusOk).responseDecodable(of: ComputersResponse.self) {
            response in
            
            //El user.id es pàra saber que si el id es distinto de nulo
            if let computer = response.value?.one, computer.title != nil {
                success(computer)
            }
            else{
                failure(response.error)
            }
            
        }
    }
    
    func putComputer(id: Int, computer: NewComputer, success: @escaping (_ computer: Computer) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(baseUrl)/\(id)"
        //header de autenticacion
        
        
        AF.request(url, method: .put, parameters: computer, encoder: JSONParameterEncoder.default).validate(statusCode: statusOk).responseDecodable(of: ComputersResponse.self) {
            response in
            
            //El user.id es pàra saber que si el id es distinto de nulo
            if let computer = response.value?.one, computer.title != nil {
                success(computer)
            }
            else{
                failure(response.error)
            }
            
        }
    }
    
    //Eliminar un usuario
    
    func deleteComputer(id: String, success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(baseUrl)/\(id)"
        //header de autenticacion
        
        AF.request(url, method: .delete).validate(statusCode: statusOk).response { response in
            
            if let error = response.error{
                failure(error)
            }else{
                success()
            }
            
            
        }
    }
    
}
