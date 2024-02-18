//
//  DetailVC.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import UIKit
import WebKit

protocol DetailViewInterface {
    var presenter: DetailPresenterInterface? { get set }
    func setupView()
    func show(with detailLink: String)
}

class DetailVC: UIViewController, DetailViewInterface, WKNavigationDelegate {
    
    var presenter: DetailPresenterInterface?
    var webView: WKWebView!
    
    func setupView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func show(with detailLink: String) {
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: detailLink.asUrl!))
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .overFullScreen
        presenter?.notifyViewDidLoad()
    }


}
