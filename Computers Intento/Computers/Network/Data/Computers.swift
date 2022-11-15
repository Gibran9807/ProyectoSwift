//
//  Computers.swift
//  Computers
//
////  Created by Giggs on 09/11/22.
////
//{
//   "title":"title 5",
//   "price":59,
//   "image":"image 5",
//   "description":"description 5",
//   "quantity":"quantity 5",
//   "id":"5"
//}

import Foundation


struct ComputersResponse: Decodable {
//    let data : [Computer?]
    let one: Computer?
    
}

struct Computer: Decodable {
    
    let id: String
    let title: String?
    let price: Int?
    let image: String?
    let description: String?
    let quantity: Int?
    
}

