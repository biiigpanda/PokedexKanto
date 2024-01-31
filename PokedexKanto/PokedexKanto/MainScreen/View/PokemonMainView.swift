//
//  PokemonMainView.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import SwiftUI

struct PokemonMainView: View {
    @State var searchText = ""
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(apiClient: ApiClientManager())
    
    let gridElements = [GridItem(.flexible(minimum:50)),GridItem(.flexible(minimum:50))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridElements, content: {
                        ForEach(viewModel.pokemonDetail) { pokemonDetail in
                            ImagePokemon(pokemonDetail: pokemonDetail)
                        }
                })
            }
            .navigationTitle("Pokedex Kanto")
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $searchText)
        .environmentObject(viewModel)
        
    }
}

#Preview {
    PokemonMainView()
}
