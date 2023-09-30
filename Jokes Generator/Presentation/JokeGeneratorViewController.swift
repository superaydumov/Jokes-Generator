
import UIKit

class JokeGeneratorViewController: UIViewController, JokesFactoryDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var idStackView: UIView!
    @IBOutlet weak var typeStackView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var jokesFactory: JokesFactoryProtocol?
    private var alertPresenter: AlertPresenterProtocol?
    private var currentJoke: JokeViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.layer.addBorder(side: .topAndBottom, thickness: 2, color: UIColor.black.cgColor)
        
        jokesFactory = JokesFactory(delegate: self, jokesLoader: JokesLoader())
        alertPresenter = AlertPresenter(delegate: self)
        jokesFactory?.requestNextJoke()
        
        idStackViewSetup()
        typeStackViewSetup()
        contentViewSetup()
        refreshButtonSetup()
        showButtonSetup()
        
        loadingIndicator.hidesWhenStopped = true
    }
    
    // MARK: - UISetup
    
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
    
    //MARK: - JokesFactoryDelegate
    
    func didReceiveNextJoke(joke: JokeViewModel?) {
        guard let joke = joke else { return }
        
        show(joke)
        currentJoke = joke
        loadingIndicator.stopAnimating()
        enableButtons()
    }
    
    func didFailToLoadData(with error: Error) {
        loadingIndicator.stopAnimating()
        let alert = AlertModel(title: "Error!", text: "\(error.localizedDescription)", buttonText: "Ok", completion: { [weak self] in
            guard let self = self else { return }
            self.jokesFactory?.requestNextJoke()})
        
        alertPresenter?.show(with: alert)
        enableButtons()
    }
    
    func didStartLoadingJoke() {
        clearDataLabels()
        loadingIndicator.startAnimating()
        disableButtons()
    }
    
    // MARK: - Private functions
    
    private func show (_ joke: JokeViewModel) {
        self.IDLabel.text = String (joke.id)
        self.typeLabel.text = joke.type
        self.questionLabel.text = joke.setup
    }
    
    private func clearDataLabels() {
        IDLabel.text = "-"
        typeLabel.text = "-"
        questionLabel.text = "-"
    }
    
    private func enableButtons() {
        self.showButton.isEnabled = true
        self.refreshButton.isEnabled = true
    }
    
    private func disableButtons() {
        self.showButton.isEnabled = false
        self.refreshButton.isEnabled = false
    }
    
    // MARK: - IBActions
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        jokesFactory?.requestNextJoke()
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        guard let currentJoke = currentJoke else { return }
        let alert = AlertModel(title: "Punchline", text: currentJoke.punchline, buttonText: "Ok", completion: { [weak self] in
            guard self != nil else { return }
            self?.jokesFactory?.requestNextJoke()
        })
        alertPresenter?.show(with: alert)
    }
}
