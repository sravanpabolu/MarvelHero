//
//  HerosViewModel.swift
//  MarvelHeros
//


import Foundation
import Combine

/**
 `HerosViewModel` is a class, responsible for managing the state and business logic related to superhero data in the Marvel Heroes application.

 ## Example Usage:
 ```swift
 let viewModel = HerosViewModel()
 viewModel.fetchHeros()
*/

class HerosViewModel: ObservableObject {
    /// The array of superheroes to be displayed in the UI.
    @Published var heroes: [Hero] = []
    
    /// A boolean indicating whether an error has occurred during data fetching.
    @Published var hasError: Bool = false
    
    /// The error message to be displayed when an error occurs.
    @Published var errorMessage: String = ""
    
    /// A boolean indicating whether data is currently being loaded.
    @Published var isLoading: Bool = false
    
    /// A set of cancellables to manage Combine publishers.
    private var cancellables: Set<AnyCancellable> = []
    
    /// The service responsible for fetching superhero data
    private var service: HerosService
    
    /**
    Initializes a new instance of HerosViewModel.

    Parameter service: The service responsible for fetching superhero data.
    */
    init(service: HerosService = HerosAPIService()) {
        self.service = service
    }
    
    /**
    Fetches superhero data from the service, updating the state accordingly.
    */
    func fetchHeros() {
        isLoading = true
        service.fetchHeros()
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .finished:
                    Logger.debug("Fetched heros successfully")
                    break
                case .failure(let failure):
                    Logger.error("Fetched heros failure -> \(failure.localizedDescription)")
                    self.hasError = true
                    self.errorMessage = failure.localizedDescription
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                Logger.debug("Fetched heros -> \(response.count)")
                self.heroes = response
            }
            .store(in: &cancellables)
    }
}
