//
//  JokesFactory.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 18.07.2023.
//

import Foundation

final class JokesFactory: JokesFactoryProtocol {
    weak var delegate: JokesFactoryDelegate?
    private let jokesLoader: JokesLoader
    
    init(delegate:JokesFactoryDelegate, jokesLoader: JokesLoader) {
        self.jokesLoader = jokesLoader
        self.delegate = delegate
    }
    
    func requestNextJoke() {
        delegate?.didStartLoadingJoke()
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            jokesLoader.loadJokes(handler: { [weak self] result in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    
                    switch result {
                    case .success(let data):
                        let joke = JokeViewModel(id: data.id, type: data.type, setup: data.setup, punchline: data.punchline)
                        self.delegate?.didReceiveNextJoke(joke: joke)
                    case .failure(let error):
                        self.delegate?.didFailToLoadData(with: error)
                    }
                }
            })
        }
    }
}
