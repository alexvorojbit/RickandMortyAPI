//
//  CharactersListViewController.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/2/21.
//

import UIKit

protocol GetCharacterInfoDelegate: AnyObject {
    func getCharacterInfo(character: Response)
}

// TODO: Refactor to use the MVVM architecture and add a ViewModel (eg: CharactersListViexModel)
class CharactersListViewController: UIViewController {

    // TODO: You might want to add the "drag to refresh" capability as you have no Refresh button.
    
    var characterResults = [Character]()
    var characterR: [Character] = []
    var collectionView: UICollectionView!
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // TODO: Watch out, you'll need to do the contrary if you push another VC.
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Setting up Collection View -
    private func setupCollectionView() {
        // Initialises the collection view with a CollectionViewLayout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createRowsFlowLayout(in: view))
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        // Registering all Cells
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
    }
    
//    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: CharactersResults, for indexPath: IndexPath) -> T {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
//            fatalError("Unable to dequeue \(cellType)")
//        }
//        cell.configure(with: app)
//        return cell
//    }
    
    
    func getData() {
        // TODO: Move this to the ViewModel.
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
                // TODO: You might want to gracefully handle errors, by informing the user that something, somehow, went wrong and he / she might have to try again later.
                print(error.rawValue)
                print("FAILED")
            }
        }
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CharactersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterResults.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        let characterCell = characterResults[indexPath.item]
        cell.configure(with: characterCell)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destVC = CharacterInfoViewController()

        destVC.delegate = self
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension CharactersListViewController: GetCharacterInfoDelegate {
    
    func getCharacterInfo(character: Response) {
        self.characterR = character.results
        characterR.removeAll()
        characterResults.removeAll()
        collectionView.setContentOffset(.zero, animated: true)
        getData()
    }
}
