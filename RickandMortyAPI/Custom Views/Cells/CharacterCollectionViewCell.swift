//
//  CharacterCollectionViewCell.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

// TODO: Elements that are working together (like CharactersList, CharacterCell, etc.) should be grouped together (like Scenes > Characters > VC + VM + Cell).

class CharacterCollectionViewCell: UICollectionViewCell {

    let imageView = AvatarImageView(frame: .zero)
    let title = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .title2), textColor: .systemOrange)
    let location = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .footnote), textColor: .secondaryLabel)
    let episode = CharacterLabel(font: UIFont.preferredFont(forTextStyle: .footnote), textColor: .secondaryLabel)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        setupViews()
    }
    
    private func setupViews() {
        
        let innerStackView = UIStackView(arrangedSubviews: [title, location, episode])
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
        

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100), // TODO: This size might not work with all iPhones
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
    
    func configure(with: Character) {
        imageView.downloadImage(from: with.image)
        title.text = with.name
        location.text = with.location.name
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Not happening")
    }
}
