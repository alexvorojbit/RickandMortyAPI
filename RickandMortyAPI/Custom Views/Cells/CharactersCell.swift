//
//  CharactersCell.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
//    var episodeResults: Episode?
    
    var characterResults: CharacterResults! {
        didSet {
            title.text = characterResults.name
            imageView.loadImageUsingCacheWithUrlString(urlString: characterResults.image)
            location.text = characterResults.location.name
//            episode.text = episodeResults?.name
        }
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let title = RMTitleLabel()
    let location = RMBodyLabel()
//    let episode = RMTitleLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        setupViews()
    }
    
    private func setupViews() {
        
        let innerStackView = UIStackView(arrangedSubviews: [title, location,])
        innerStackView.axis = .vertical
        innerStackView.spacing = 5
        innerStackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        innerStackView.isLayoutMarginsRelativeArrangement = true
        
        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        outerStackView.axis = .horizontal
        outerStackView.alignment = .leading
        outerStackView.spacing = 10
        contentView.addSubview(outerStackView)
        outerStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(imageView)
//        addSubview(title)
//        addSubview(location)
//
//        let padding: CGFloat = 8
//
        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

//            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: padding),
//            title.heightAnchor.constraint(equalToConstant: 30),

//            location.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
//            location.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: padding),
//            location.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
//    func configure(with app: Results) {
//        imageView.image = UIImage(named: app.image)
//        title.text = app.name
//        location.text = app.location.name
//        episode.text = app.episode
//    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Not happening")
    }
}
