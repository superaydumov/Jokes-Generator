//
//  AlertModel.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 18.07.2023.
//

import Foundation

struct AlertModel {
    let title: String
    let text: String
    let buttonText: String
    let completion: () -> Void
}
