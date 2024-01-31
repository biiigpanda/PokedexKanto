//
//  ApiClientManager.swift
//  PokedexKanto
//
//  Created by Marc Gallardo Ruiz on 31/1/24.
//

import Foundation
import Combine

enum NetworkError: String, Error {
        case invalidURL = "Invalid URL"
        case responseError = "Unexpected status code"
        case unknown =  "Unknown error"
}

final class ApiClientManager {
    
    var cancellables = Set<AnyCancellable>()
    
    func getPokemonMainModel()-> AnyPublisher<PokemonMainModel, Error> {
        let urlModel = URL(string: Constants().urlDashBoard)!
        return URLSession.shared.dataTaskPublisher(for: urlModel)
            .tryMap(handleOutput)
            .decode(type: PokemonMainModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
