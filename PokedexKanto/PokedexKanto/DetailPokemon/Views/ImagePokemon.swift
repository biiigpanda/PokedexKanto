//
//  ImagePokemon.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import SwiftUI

struct ImagePokemon: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemonDetail: PokemonDetailModel
    var body: some View {
        VStack{
            ZStack{
                Image("img_launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight:180)
                // get index
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonDetail.id).png"))
                { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView().frame(width:120, height:80)
                }.frame(maxHeight:180)
                    .background(.white.opacity(0.4))
                    .clipShape(Circle())
            }.padding(0)
            VStack {
                Image("img_grassType")
                    .resizable()
                    .scaledToFit()
                    .frame(width:120, height: 50)
                    .padding(-10)
                Image("img_grassType")
                    .resizable()
                    .scaledToFit()
                    .frame(width:120, height: 50)
            }
            Text("\(pokemonDetail.name)")
        }
    }
}

//#Preview {
//    ImagePokemon()
//}
