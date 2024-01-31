//
//  PokemonMainModel.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import Foundation

struct PokemonMainModel: Decodable {
    
    let count: Int
    let next : String
    let previous : Int?
    let results : [DashBoardModel]

}

struct DashBoardModel: Identifiable, Decodable {
    
    let name: String
    let url : String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name,url
    }
}

