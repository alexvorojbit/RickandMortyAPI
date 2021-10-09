//
//  CharacterInfoViewController.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 10/8/21.
//

import UIKit



class CharacterInfoViewController: UIViewController {
    
    let characterHeaderView = UIView()
    
    var character: Response!
    var characterIndex: IndexPath!
    
    weak var delegate: GetCharacterInfoDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    func getCharacterInfo() {
        NetworkManager.shared.getCharactersCVCData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let characterResults):
                    DispatchQueue.main.async {
                        self.configureUIElements(with: characterResults)
                        print("SUCCESS")
                    }
                case .failure(let error):
                        // TODO: You might want to gracefully handle errors, by informing the user that something, somehow, went wrong and he / she might have to try again later.
                    print(error.rawValue)
                    print("FAILED")
            }
        }
    }
    
    func configureUIElements(with character: Response) {
        self.add(childVC: CharacterInfoHeaderViewController(char: character), to: self.characterHeaderView)
        delegate?.getCharacterInfo(character: character, index: characterIndex)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 180
        
        view.addSubview(characterHeaderView)
        characterHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            characterHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            characterHeaderView.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
}
