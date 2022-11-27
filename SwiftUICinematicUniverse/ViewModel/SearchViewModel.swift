//
//  SearchViewModel.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    
    @Published private(set) var searchCharacters = [Character]() {
        didSet {
            if !searchCharacters.isEmpty {
                isLoading = false
            }
        }
    }
    private(set) var resultsCount = 0
    
    @Published var textFieldText = ""
    @Published private(set) var isLoading = false
    
    let service: SearchService
    private var cancellables = Set<AnyCancellable>()
    
    init(service: SearchService = SearchService()) {
        self.service = service
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        $textFieldText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] textFieldText in
                self?.isLoading = true
                self?.service.performSearch(forName: textFieldText)
            }
            .store(in: &cancellables)
        
        service.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] searchedCharacters in
                guard let self = self else { return }
                self.searchCharacters = searchedCharacters
                self.resultsCount = self.service.resultCount
            }
            .store(in: &cancellables)
    }
    
}
