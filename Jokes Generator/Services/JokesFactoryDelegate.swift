//
//  JokesFactoryDelegate.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 18.07.2023.
//

import Foundation

protocol JokesFactoryDelegate: AnyObject {
    func didReceiveNextJoke(joke: JokeViewModel?)
    func didFailToLoadData(with error: Error)
    func didStartLoadingJoke()
}
