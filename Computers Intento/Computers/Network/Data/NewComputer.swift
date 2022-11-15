//
//  NewComputer.swift
//  Computers
//
//  Created by Giggs on 09/11/22.
//

import Foundation


//Tiene que ser encodable para que se transforme a json
struct NewComputer: Encodable {

    let title: String?
    let price: Int?
    let image: String?
    let description: String?
    let quantity: Int?

}
