//
//  HomeVC.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import UIKit

protocol HomeViewInterface {
    var presenter: HomePresenterInterface? { get set }

    func setupView()

}

class HomeVC: UIViewController, HomeViewInterface {
    
    var presenter: HomePresenterInterface?
    
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setupView() {
        titleLbl.text = "Selamat Datang di NewsApp"
        contentLbl.text = "Aplikasi ini ditujukan untuk pengguna yang ingin melihat berita terbaru yang ada di Indonesia"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.notifyViewDidLoad()

        // Do any additional setup after loading the view.
    }

}
