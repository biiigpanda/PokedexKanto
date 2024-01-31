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
    
    var cancellables = Set<AnyCancellable>()
    
    let apiClient: ApiClientManager
    
    init(apiClient: ApiClientManager)  {
        self.apiClient = apiClient
        self.fetchModel()
    }
    
    // MARK: - Call first method to obtain name and url for image
    
    func fetchModel() {
        apiClient.getPokemonMainModel()
            .sink { _ in
            
            } receiveValue: { [weak self] appResponse in
                self?.pokemonMainModel = appResponse.results
                self?.fetchDetailPokemon(model: self?.pokemonMainModel ?? [])
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
                } .store(in: &cancellables)
        }
    }
}
