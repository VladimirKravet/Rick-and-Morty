//
//  RMCell.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 10.03.2023.
//

import UIKit

class RMCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Ricky and Morty", font: .boldSystemFont(ofSize: 26))
    
    
    let verticalController = RMVerticalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
 //       backgroundColor = .green
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 32, left: 16, bottom: 0, right: 16))

    
        addSubview(verticalController.view)
        verticalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
