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
            } .store(in: &cancellables)
    }
}
