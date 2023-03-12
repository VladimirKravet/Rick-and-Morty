//
//  BaseTabBarController.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 11.03.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
  //      viewControllers = [ createNavController(viewController: BaseController(), title: "Rick and Morty") ]
        
    }
    fileprivate func createNavController(viewController: UIViewController, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        // navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
    }
}
