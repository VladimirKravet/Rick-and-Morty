//
//  DetailController.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 10.03.2023.
//

import UIKit

class DetailController: BaseListController, UICollectionViewDelegateFlowLayout {


    var characterId: Int! {
        didSet {
            print("here is Id:", characterId as Any)
            let urlString = "https://rickandmortyapi.com/api/character/?id=\(characterId)"
            NetworkManager.shared.fetchGenericJSONData(urlString: urlString) { (result: Characters?, err) in
                print(result?.results.first?.id as Any)
                let characters = result?.results.first
                self.characters = characters
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
    
    var characters: Results?
    
let detailCellId = "detailCellId"
let locationCellId = "locationCellId"

override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    
    collectionView.register(DetailCell.self, forCellWithReuseIdentifier: detailCellId)
    
    collectionView.register(LocationFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: locationCellId)
    
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width - 32, height: view.frame.height - 240)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let location = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: locationCellId, for: indexPath)
        return location
    }

override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! DetailCell
    cell.clipsToBounds = true
    cell.layer.cornerRadius = 12
    cell.nameLabel.text = characters?.name
    cell.episodeLabel.text = "First seen in: \(String(describing: characters?.origin.name ?? ""))"
    cell.lastLocation.text = "Last known location: \(characters?.location.name ?? "")"
    cell.statusLabel.text = "Status: \(characters?.status ?? "")"
    cell.imageView.sd_setImage(with: URL(string: characters?.image ?? ""))
    
    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 32, height: 240)
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    

}
