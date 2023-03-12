//
//  DetailCell.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 11.03.2023.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    let nameLabel = UILabel(text: "Rick Sanchez", font: .boldSystemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 12)
    
    let lastLocation = UILabel(text: "Citadel of Ricks", font: .systemFont(ofSize: 16),numberOfLines: 0)
    
    let statusLabel = UILabel(text: "Alive", font: .systemFont(ofSize: 16))
    
    
    let episodeLabel = UILabel(text: """
                                Episod:
                                Earth (C-137)
                                """, font:.systemFont(ofSize: 16),numberOfLines: 0)
    
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     //   backgroundColor = .red
        
        imageView.backgroundColor = .blue
        imageView.constrainWidth(180)
        imageView.constrainHeight(180)
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            lastLocation,
            episodeLabel,
            statusLabel
            ])
            
        labelsStackView.spacing = 12
        labelsStackView.axis = .vertical
     
    let verticalStack = VerticalStackView(arrangeSubviews: [
        nameLabel,
        imageView,
    ],spacing: 32)
    let stackView = UIStackView(arrangedSubviews: [
            verticalStack,
            labelsStackView
            ])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 16))
                                          
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
