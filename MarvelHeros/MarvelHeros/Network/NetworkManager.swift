//
//  NetworkManager.swift
//  MarvelHeros
//


import Foundation
import Combine

/// `MarvelServiceError` is an enumeration representing errors that can occur during network requests or data processing in a Marvel service.
public enum MarvelServiceError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingError(error: Error)
}

/**
 `NetworkManager` is a singleton class responsible for handling network requests and data fetching in Swift.
*/
public class NetworkManager {
    static let shared = NetworkManager()
    
    //Do not let user to initialize the NetworkManager separately. It should be singleton only
    private init() { }
    
    func fetchData<T: Codable>(from url: String, type: T.Type) -> AnyPublisher<T, MarvelServiceError> {
        guard let url = URL(string: "\(Constants.baseURL)\(url)") else {
            Logger.error("URL Error")
            return Fail(error: MarvelServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw MarvelServiceError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
                }
                Logger.debug("\(try JSONSerialization.jsonObject(with: data))")
                Logger.debug("Status response - \(httpResponse.statusCode)")
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                Logger.error("Decoding error")
                return MarvelServiceError.decodingError(error: error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
