//
//  PokemonViewModel.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    
    // MARK: - APIClient
    @Published var pokemonMainModel: [PokemonPage] = []
    @Published var pokemonDetail: [PokemonDetailModel] = []
    @Published var isFinished: Bool = false
    @Published var types: [String] = []

    
    var cancellables = Set<AnyCancellable>()
    
    let apiClient: ApiClientManager
    
    init(apiClient: ApiClientManager)  {
        self.apiClient = apiClient
        self.fetchModel()
    }
    
    // MARK: - Call first method to obtain name and url for image
    
    func fetchModel() {
        apiClient.getPokemonMainModel()
            .sink { completion in
                switch(completion) {
                case .finished:
                    self.fetchDetailPokemon(model: self.pokemonMainModel )
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { [weak self] appResponse in
                self?.pokemonMainModel = appResponse.results
            } .store(in: &cancellables)
    }
    // MARK: - Call second method to obtain properties of pokemon

    func fetchDetailPokemon(model: [PokemonPage]) {
        for value in model {
            apiClient.getDetailPokemon(urlImage: value.url )
                .sink { _ in
                } receiveValue: { [weak self] appResponse in
                    self?.pokemonDetail.append(appResponse)
                    self?.pokemonDetail = (self?.pokemonDetail.sorted(by:{ $0.id < $1.id }))!
                    if self?.pokemonMainModel.count == self?.pokemonDetail.count {
                        self?.isFinished = true
                    }
                } .store(in: &cancellables)
        }
    }
    
    // MARK: - Set String for image type

    func setImageType(typeName: [TypeElement]) -> [String] {
        var typesArray: [String] = []
        for type in typeName {
            if type.type.name == "grass" {
                typesArray.append("img_grassType")
            } else if type.type.name == "fire" {
                typesArray.append("img_fireType")
            } else if type.type.name == "bug" {
                typesArray.append("img_bugType")
            } else if type.type.name == "electric" {
                typesArray.append("img_electricType")
            } else if type.type.name == "fighting" {
                typesArray.append("img_fightingType")
            } else if type.type.name == "ghost" {
                typesArray.append("img_ghostType")
            } else if type.type.name == "ground" {
                typesArray.append("img_groundType")
            } else if type.type.name == "normal" {
                typesArray.append("img_normalType")
            } else if type.type.name == "poison" {
                typesArray.append("img_poisonType")
            } else if type.type.name == "psychic" {
                typesArray.append("img_psychicType")
            } else if type.type.name == "water" {
                typesArray.append("img_waterType")
            } else if type.type.name == "flying" {
                typesArray.append("img_flyingType")
            } else if type.type.name == "rock" {
                typesArray.append("img_rockType")
            } else if type.type.name == "ice" {
                typesArray.append("img_iceType")
            } else if type.type.name == "dragon" {
                typesArray.append("img_dragonType")
            }else if type.type.name == "dark" {
                typesArray.append("img_darkType")
            } else if type.type.name == "fairy" {
                typesArray.append("img_fairyType")
            } else if type.type.name == "steel" {
                typesArray.append("img_steelType")
            }
        }
        return typesArray
    }
}
