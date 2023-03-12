//
//  RMVerticalController.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 10.03.2023.
//

import UIKit
import SDWebImage


class RMVerticalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var characters: Characters?
    
    var didSelectHandler: ((Results) -> ())?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let character = characters?.results[indexPath.item] {
            didSelectHandler?(character)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9433215261, green: 0.9532694221, blue: 0.948787272, alpha: 1)
        
        
        collectionView.register(CharactersCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return characters?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CharactersCell
        
        let character = characters?.results[indexPath.item]
        
        cell.nameLabel.text = character?.name
        cell.locationNameLabel.text = character?.location.name
        cell.episodeLabel.text = "Episode: \(character?.origin.name ?? "")"
        cell.imageView.sd_setImage(with: URL(string: character?.image ?? ""))

        
        cell.layer.cornerRadius = 12
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  //              cell.charactersResult = charactersResult[indexPath.item]
                cell.clipsToBounds = true



        
        
        return cell
    }
    
    let topbottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let height = (view.frame.height - 2 * topbottomPadding - 2 * lineSpacing) / 7
        
        return .init(width: view.frame.width - 32, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 0, right: 0)
    }
}
