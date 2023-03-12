//
//  LocationCell.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 11.03.2023.
//

import UIKit


class LocationFooter: UICollectionReusableView {
    
    
    let verticalLocationController = VerticalLocationController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(verticalLocationController.view)
        verticalLocationController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
