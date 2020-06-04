//
//  TabBarController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

fileprivate struct Controller {
    let title: String
    let viewController: UIViewController
    
    init(title: String, viewController: UIViewController) {
        self.title = title
        self.viewController = viewController
    }
}

class TabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupTabBarShadow()
        setupTabBar()
    }
    
    fileprivate func setupTabBarShadow() {
        tabBar.layer.shadowOpacity = 0.12
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.masksToBounds = false
        tabBar.barStyle = .black
        tabBar.isTranslucent = true
      
    }
    
    private func setupTabBar() {
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.tintColor = .systemBlue
        
        let layout = UICollectionViewFlowLayout()
        
        let controllers: [Controller] = [
            Controller(title: "Home", viewController: HomeController(collectionViewLayout: layout)),
            Controller(title: "Category", viewController: CategoryController()),
            Controller(title: "Account", viewController: AccountController()),
            Controller(title: "Bag", viewController: BagController())
        ]
   
        viewControllers = controllers.map { self.setupTabBarControllers(controller: $0) }
     }
    
    private func setupTabBarControllers(controller: Controller) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller.viewController )
        navController.tabBarItem = UITabBarItem(title: controller.title, image: UIImage(named: "\(controller.title.lowercased())_icon"), selectedImage: nil)
        return navController
    }

}
