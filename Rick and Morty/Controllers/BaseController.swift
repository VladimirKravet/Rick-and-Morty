//
//  BaseTabBarController.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 09.03.2023.
//

import UIKit


class BaseController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var page = 1
    
    var characterCount = 0
    var hasMoreContent = true
    var results: [Results] = []
    var characters: Characters?
    
    fileprivate let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9433215261, green: 0.9532694221, blue: 0.948787272, alpha: 1)
        
        collectionView.register(RMCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchCharachters(page: page)
    }
    

    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height
            
            if offsetY > contentHeight - height {
                guard hasMoreContent else { return }
                page += 1
                fetchCharachters(page: page)
            }
        }
    
    fileprivate func fetchCharachters(page: Int) {
        NetworkManager.shared.fetchCharacters(page: page) { (results, err) in

            if let err = err {
                print("Failed to fetch characters:", err)
                return
            }
//            if self.results.count < self.characterCount {
//                self.hasMoreContent = false
//            }
            self.characters = results
//            self.results += results!.results
//            self.characterCount = (results?.info.count)!
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 32, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RMCell
        
        
        cell.backgroundColor = #colorLiteral(red: 0.9433215261, green: 0.9532694221, blue: 0.948787272, alpha: 1)
        cell.verticalController.characters = characters
        cell.verticalController.collectionView.reloadData()
        
        cell.verticalController.didSelectHandler = { [weak self] results in
            
            let controller = DetailController()
            
            controller.characterId = results.id

            
            
     //       self?.navigationController?.pushViewController(controller, animated: true)
            self?.present(controller, animated: true)
   //         print(self!.characters?.results.first)
  //          controller.title =  results.name
  //          controller.characterId = self?.characters?.results
   //         print(results.id)
        }
        
        
        return cell
    }

    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
