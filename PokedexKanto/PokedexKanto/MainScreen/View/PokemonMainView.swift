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
            if viewModel.isFinished == false {
                ProgressView("Cargando Información...")
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
            } else {
                ScrollView {
                        LazyVGrid(columns: gridElements, content: {
                                ForEach(viewModel.pokemonDetail) { pokemonDetail in
                                    NavigationLink(destination: DetailPokemonView(pokemonDetail: pokemonDetail)) {
                                        ImagePokemon(viewModel: viewModel, pokemonDetail: pokemonDetail)
                                    }
                                }
                        })
                }
                .navigationTitle("Pokedex de Kanto")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .searchable(text: $searchText)
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    PokemonMainView()
}
