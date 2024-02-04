//
//  HerosService.swift
//  MarvelHeros
//


import Foundation
import Combine

public protocol HerosService {
    func fetchHeros() -> AnyPublisher<[Hero], MarvelServiceError>
}

/**
 `HerosAPIService` is a class that conforms to the `HerosService` protocol, providing methods to fetch superhero data from a remote API.

 Fetches a list of superheroes from the remote API.

 Returns: A publisher that emits an array of Hero objects or an error of type MarvelServiceError.
 
 ## Example Usage:
 ```swift
 let apiService = HerosAPIService()
 apiService.fetchHeros()
    .sink { completion in
        // Handle completion (e.g., success or failure)
    } receiveValue: { heroes in
        // Handle the fetched superheroes
    }
*/

class HerosAPIService: HerosService {
    func fetchHeros() -> AnyPublisher<[Hero], MarvelServiceError> {
        NetworkManager.shared.fetchData(from: Constants.marvelHeros, type: [Hero].self)
            .eraseToAnyPublisher()
    }
}
