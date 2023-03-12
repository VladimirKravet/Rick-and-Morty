//
//  LocationFooterCell.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 11.03.2023.
//

import UIKit

class LocationFooterCell: UICollectionViewCell {

    var characterResults: Results! {
        didSet {
            nameLabel.text = characterResults.name
            locationNameLabel.text = characterResults.status
            episodeLabel.text = characterResults.origin.name
            imageView.sd_setImage(with: URL(string: characterResults?.image ?? ""))
            
        }
    }
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.backgroundColor = .red
            iv.widthAnchor.constraint(equalToConstant: 128).isActive = true
            iv.heightAnchor.constraint(equalToConstant: 128 ).isActive = true
            iv.layer.cornerRadius = 12
            iv.clipsToBounds = true
            iv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

            return iv
        }()
        
        let nameLabel: UILabel = {
            let label = UILabel(text: "Rick Sanchez", font: .boldSystemFont(ofSize: 24))
            label.textColor = .orange
            return label
        }()
        
        let locationNameLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Citadel of Ricks"
            label.font = .systemFont(ofSize: 14)
            return label
        }()
        
        let episodeLabel: UILabel = {
            let label = UILabel(text: """
            Episod:
            Earth (C-137)
            """, font: .systemFont(ofSize: 14), numberOfLines: 0)

            return label
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            let labelsStackView = UIStackView(arrangedSubviews: [
                nameLabel,
                locationNameLabel,
                episodeLabel
            ])
            labelsStackView.spacing = 4
            labelsStackView.axis = .vertical
            
            let stackView = UIStackView(arrangedSubviews: [
                imageView,
                labelsStackView
            ])
            stackView.spacing = 12
            stackView.alignment = .center

            
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
