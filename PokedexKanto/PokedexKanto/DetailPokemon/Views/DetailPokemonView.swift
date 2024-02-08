//
//  DetailPokemonView.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 7/2/24.
//

import SwiftUI

struct DetailPokemonView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    var pokemonDetail: PokemonDetailModel
    
    var body: some View {
        VStack {
            ImagePokemon(viewModel: viewModel, pokemonDetail: pokemonDetail)
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
        }
        .frame(width: 300, height: 300, alignment: .top)
        .padding(.bottom, 80)
        VStack(alignment: .leading) {
            HStack {
                Text("HP: ")
            }
            HStack {
                Text("Atack: ")
            }
            HStack {
                Text("Defense: ")
            }
            HStack {
                Text("S.Atack: ")
            }
            HStack {
                Text("S.Defense: ")
            }
        }                
        .navigationTitle("Detalle de Pokemon")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailPokemonView( pokemonDetail: PokemonDetailModel(id: 1,
                                                        name: "Bulbasaur",
                                                        baseExperience: 0,
                                                        height: 10,
                                                        isDefault: false,
                                                        order: 1,
                                                        weight: 10,
                                                        abilities: [],
                                                        forms: [],
                                                        gameIndices: [],
                                                        heldItems: [],
                                                        locationAreaEncounters: "",
                                                        moves: [],
                                                        species: Species(name: "",
                                                                         url: ""),
                                                        sprites: Sprites(backDefault: "",
                                                                         backFemale: "",
                                                                         backShiny: "",
                                                                         backShinyFemale: "",
                                                                         frontDefault: "",
                                                                         frontFemale: "",
                                                                         frontShiny: "",
                                                                         frontShinyFemale: "",
                                                                         other: nil,
                                                                         versions: nil,
                                                                         animated: nil),
                                                        stats: [], 
                                                        types: [],
                                                        pastTypes: []))
}
