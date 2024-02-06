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
    let results : [PokemonPage]

}

struct PokemonPage: Identifiable, Decodable {
    
    var name: String
    var url : String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name,url
    }
}

