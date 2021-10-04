//
//  CharacterInfoViewController.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/16/21.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    let characterImageView = AvatarImageView(frame: .zero)
    let locationLabel = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .body), textColor: .systemOrange)
    let locationTitle = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .title3), textColor: .systemGray)
    let episodeLabel = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .body), textColor: .systemOrange)
    let episodeTitle = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .title3), textColor: .systemGray)
    let statusLabel = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .body), textColor: .systemOrange)
    let statusTitle = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .title3), textColor: .systemGray)
    
    var character: Character!
    
    init(char: Character) {
        super.init(nibName: nil, bundle: nil)
        self.character = char
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    
    func configureUIElements() {
        characterImageView.downloadImage(from: character.image)
        locationLabel.text = "Last known location:"
        locationTitle.text = character.location.name
        statusLabel.text = "Status:"
//        statusTitle.text = character.status
    }
    
    
    func addSubviews() {
        view.addSubview(characterImageView)
        view.addSubview(locationLabel)
        view.addSubview(locationTitle)
        view.addSubview(locationLabel)
        view.addSubview(statusLabel)
//        view.addSubview(statusTitle)
    }
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let textImagePadding: CGFloat   = 12
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 90),
            characterImageView.heightAnchor.constraint(equalToConstant: 90),
            
            locationLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: textImagePadding),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 38),
            
            locationTitle.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor, constant: 8),
            locationTitle.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: textImagePadding),
            locationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationTitle.heightAnchor.constraint(equalToConstant: 20),
            
            statusLabel.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: textImagePadding),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
