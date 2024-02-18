//
//  HomeTabVC.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import UIKit

protocol HomeTabViewInterface {
    var presenter: HomeTabPresenterInterface? { get set }
    var username: String? { get set }
    
    func setupView(with username: String)

}

class HomeTabVC: UITabBarController, HomeTabViewInterface {
    
    var presenter: HomeTabPresenterInterface?
    var username: String?
    
    func setupView(with username: String) {
        
        let HomeRouter = HomeRouter.start()
        let HomeVC = HomeRouter.entry
        let HomeTab = UINavigationController(rootViewController: HomeVC!)
        
        let NewsRouter = NewsRouter.start()
        let NewsVC = NewsRouter.entry
        let NewsTab = UINavigationController(rootViewController: NewsVC!)
        
        let ProfileRouter = ProfileRouter.start(with: username)
        let ProfileVC = ProfileRouter.entry
        let ProfileTab = UINavigationController(rootViewController: ProfileVC!)
        
        HomeTab.tabBarItem.title = "Home"
        HomeTab.tabBarItem.image = UIImage.init(systemName: "house.fill")
        
        NewsTab.tabBarItem.title = "News"
        NewsTab.tabBarItem.image = UIImage.init(systemName: "newspaper.fill")
        
        ProfileTab.tabBarItem.title = "Profile"
        ProfileTab.tabBarItem.image = UIImage.init(systemName: "person.fill")
        
        viewControllers = [HomeTab,NewsTab,ProfileTab]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
