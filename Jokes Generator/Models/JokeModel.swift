//
//  JokeModel.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 18.07.2023.
//

import Foundation

struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
