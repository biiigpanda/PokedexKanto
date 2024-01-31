//
//  PokemonMainView.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import SwiftUI

struct PokemonMainView: View {
    @State var searchText = ""
    var elements = 1...10
    let gridElements = [GridItem(.flexible(minimum:50)),GridItem(.flexible(minimum:50))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridElements, content: {
//                    ForEach(vm.pokemons) { pokemon in
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
                    ImagePokemon()
//                    }
                })
            }
            .navigationTitle("Pokedex Kanto")
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $searchText)
        
    }
}

#Preview {
    PokemonMainView()
}
