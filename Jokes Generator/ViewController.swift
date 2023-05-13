//
//  ViewController.swift
//  Jokes Generator
//
//  Created by Эльдар Айдумов on 11.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idStackView: UIView!
    @IBOutlet weak var typeStackView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.layer.addBorder(side: .topAndBottom, thickness: 2, color: UIColor.black.cgColor)
        
        idStackViewSetup()
        typeStackViewSetup()
        contentViewSetup()
        refreshButtonSetup()
        showButtonSetup()
        
    }
    
    private func idStackViewSetup() {
        idStackView.layer.masksToBounds = true
        idStackView.layer.cornerRadius = 8
        idStackView.layer.borderWidth = 2
        idStackView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func typeStackViewSetup() {
        typeStackView.layer.masksToBounds = true
        typeStackView.layer.cornerRadius = 8
        typeStackView.layer.borderWidth = 2
        typeStackView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func contentViewSetup() {
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.backgroundColor = .pinky
    }
    
    private func refreshButtonSetup() {
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = 8
        refreshButton.layer.borderWidth = 2
        refreshButton.layer.borderColor = UIColor.black.cgColor
    }
    
    private func showButtonSetup() {
        showButton.layer.masksToBounds = true
        showButton.layer.cornerRadius = 8
        showButton.layer.borderWidth = 2
        showButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func showButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController (title: "Punchline", message: "For fowl play", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
    
        alert.addAction(action)
        self.present (alert, animated: true, completion: nil)
    }

}

