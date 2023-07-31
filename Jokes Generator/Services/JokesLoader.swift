//
//  JokesLoader.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 14.07.2023.
//

import Foundation

struct JokesLoader {
    private let networkClient = NetworkClient()
    
    private var mostFunnyJokesURL: URL {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            preconditionFailure("Unable to construct mostFunnyJokesURL.")
        }
        return url
    }
    
    func loadJokes(handler: @escaping (Result<JokeModel, Error>) -> Void) {
        networkClient.fetch(url: mostFunnyJokesURL, handler: { result in
            switch result {
            case .success(let data):
                do {
                    let mostFunnyJokes = try JSONDecoder().decode(JokeModel.self, from: data)
                    handler(.success(mostFunnyJokes))
                }
                catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            } })
    }
}
