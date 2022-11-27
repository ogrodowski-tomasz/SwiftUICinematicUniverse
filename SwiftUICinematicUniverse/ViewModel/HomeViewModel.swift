//
//  HomeViewModel.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published private(set) var characters = [Character]()
    
    let characterDataService: CharacterDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(characterDataService: CharacterDataService = CharacterDataService()) {
        self.characterDataService = characterDataService
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        characterDataService.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] fetchedCharacters in
                self?.characters = fetchedCharacters
            }
            .store(in: &cancellables)
    }
    
}
