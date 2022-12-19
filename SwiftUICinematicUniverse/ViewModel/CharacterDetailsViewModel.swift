//
//  CharacterDetailsViewModel.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Combine
import Foundation

class CharacterDetailsViewModel: ObservableObject {
    
    let character: Character
    let service: ComicsDataService
    
    @Published private(set) var comics = [Comic]() {
        didSet {
            if !comics.isEmpty {
                isLoading = false
            }
        }
    }
    var numberOfComics = 0
    @Published private(set) var isLoading: Bool
    
    private var cancellables = Set<AnyCancellable>()
    
    init(character: Character, service: ComicsDataService? = nil) {
        isLoading = true
        self.character = character
        if let service = service {
            self.service = service
        } else {
            self.service = ComicsDataService(characterId: character.id)
        }
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$comics
            .receive(on: DispatchQueue.main)
            .sink { [weak self] fetchedComics in
                guard let self = self else { return }
                self.comics = fetchedComics
                self.numberOfComics = self.service.allComics
            }
            .store(in: &cancellables)
    }
    
    func fetchNextSetOfComics() {
        service.page += 1
    }
}
