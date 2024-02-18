//
//  SplashScreenVC.swift
//  NewsApp
//
//  Created by aldo on 18/02/24.
//

import UIKit

class SplashScreenVC: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4))
        imageView.image = UIImage(named: "Splash_Img")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: {
            self.imageView.alpha = 1
        }){ _ in
            let LoginRouter = LoginRouter.start()
            let initVC = LoginRouter.entry
            
            let navCtrl = UINavigationController(rootViewController: initVC!)

            guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                return
            }
            
            guard let window = firstScene.windows.first else {
                return
            }
            
            let rootViewController = window.rootViewController

            navCtrl.view.frame = (rootViewController?.view.frame)!
            navCtrl.view.layoutIfNeeded()

            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                window.rootViewController = navCtrl
            })
        }

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
    }

}
