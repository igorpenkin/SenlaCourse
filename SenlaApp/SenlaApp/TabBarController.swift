//
//  TabBarController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 26.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isOpaque = true
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemBlue
        tabBar.backgroundColor = .systemYellow
        setupTabBar()
    }
}

private extension TabBarController {
    
    func setupTabBar() {
        let navCContent = NavigationController(rootViewController: ContentViewController())
        let navCInfo = NavigationController(rootViewController: InfoViewController())
        let navCBrowse = NavigationController(rootViewController: BrowseViewController())
        
        let configuration = UIImage.SymbolConfiguration(
            pointSize: 24, weight: .semibold
        )
        
        navCContent.tabBarItem = UITabBarItem(
            title: "Content",
            image: UIImage(systemName: "folder"),
            tag: 1
        )
        navCContent.tabBarItem.selectedImage = UIImage(systemName: "folder.fill", withConfiguration: configuration)
        
        navCInfo.tabBarItem = UITabBarItem(
            title: "Info",
            image: UIImage(systemName: "pencil.circle"),
            tag: 1)
        navCInfo.tabBarItem.selectedImage = UIImage(systemName: "pencil.circle.fill", withConfiguration: configuration)
        
        navCBrowse.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "network"),
            tag: 1)
        navCBrowse.tabBarItem.selectedImage = UIImage(systemName: "network", withConfiguration: configuration)
        
        setViewControllers([
            navCContent, navCInfo, navCBrowse
        ], animated: false)
    }
}
