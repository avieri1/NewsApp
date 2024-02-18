//
//  ProfileVC.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import UIKit

protocol ProfileViewInterface {
    var presenter: ProfilePresenterInterface? { get set }
    var username: String? { get set }

    func setupView()

}

class ProfileVC: UIViewController, ProfileViewInterface {
    
    var username: String?
    
    var presenter: ProfilePresenterInterface?
    
    func setupView() {
        mainLbl.text = "Username: \(username ?? "")"
        leftLbl.text = "Name:"
        rightLbl.text = "Magnus Digital"
    }
    

    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.notifyViewDidLoad()
    }

    @IBAction func logOutBtnClicked(_ sender: Any) {
        presenter?.viewDidLogout()
    }
}
