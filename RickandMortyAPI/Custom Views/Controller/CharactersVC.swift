//
//  HomeVC.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/2/21.
//

import UIKit

class CharactersVC: UIViewController {
    
    var characterResults = [CharacterResults]()
    var collectionView: UICollectionView!
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: UIColor.red,
        NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        getData()
//        self.navigationController?.navigationBar.changeFont()
        UINavigationBar.appearance().titleTextAttributes = attrs
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "YOUR FONT NAME", size: 25.0) ?? ""]
//        guard let sansLightFont = UIFont(name: "OpenSans", size: 20) else { return }
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : sansLightFont]
        
    }
    
    
    // MARK: - Setting up Collection View -
    
    private func setupCollectionView() {
        // Initialises the collection view with a CollectionViewLayout which we will define
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createRowsFlowLayout(in: view))
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        // Registering all Cells
        collectionView.register(CharactersCell.self, forCellWithReuseIdentifier: CharactersCell.identifier)
    }
    
//    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: CharactersResults, for indexPath: IndexPath) -> T {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
//            fatalError("Unable to dequeue \(cellType)")
//        }
//
//        cell.configure(with: app)
//        return cell
//    }
    
    
    func getData() {
        NetworkManager.shared.getCharactersCVCData { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let characterResults):
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.characterResults = characterResults.results
                    self.collectionView.reloadData()
                    print("SUCCESS")
                }
            case .failure(let error):
                print(error.rawValue)
                print("FAILED")
            }
        }
    }
}

// MARK: - UICollecionViewDataSource, UICollecionViewDelegate

extension CharactersVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterResults.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as! CharactersCell
        let characterResults = characterResults[indexPath.item]
        cell.characterResults = characterResults
        
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.systemGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}
