//
//  MockManager.swift
//  MarvelHerosTests
//


import Foundation
import Combine
import MarvelHeros

/**
 `MockManager` is a singleton class responsible for handling mock data retrieval during testing.
*/
class MockManager {
    static let shared = MockManager()
    
    private init() { }
    
    /// The fetchData method is generic and supports decoding mock data into any Codable type.
    func fetchData<T: Codable>(from url: String) -> AnyPublisher<T, MarvelServiceError> {
        Logger.debug("Printing from local json")
       
        guard let filePath = Bundle(for: type(of: self)).path(forResource: url, ofType: "json") else {
            Logger.error("File not found in the test bundle.")
            return Fail(error: MarvelServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        do {
            let jsonData = try String(contentsOfFile: filePath, encoding: .utf8)
            let data = jsonData.data(using: .utf8) ?? Data()
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            return CurrentValueSubject(parsedData).eraseToAnyPublisher()
        } catch {
            Logger.error("Failed to read the file content. Error: \(error)")
            return Fail(error: MarvelServiceError.decodingError(error: error)).eraseToAnyPublisher()
        }
    }
}

/**
HerosMockService is a mock implementation of the HerosService protocol for testing purposes.
 This json returns valid response
 */
class HerosMockService: HerosService {
    func fetchHeros() -> AnyPublisher<[Hero], MarvelServiceError> {
        MockManager.shared.fetchData(from: "MarvelHeros")
    }
}

/**
 HerosMockServiceEmptyResponse is a mock implementation of the HerosService protocol for testing purposes.
 This json returns empty response
 */
class HerosMockServiceEmptyResponse: HerosService {
    func fetchHeros() -> AnyPublisher<[Hero], MarvelServiceError> {
        MockManager.shared.fetchData(from: "MarvelHeros_Empty")
    }
}
