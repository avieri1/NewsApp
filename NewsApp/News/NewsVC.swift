//
//  NewsVC.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import UIKit

protocol NewsViewInterface {
    var presenter: NewsPresenterInterface? { get set }
    var result: NewsModel? { get }
    func setupView()
    func showView(with result: NewsModel)
}

class NewsVC: UIViewController, NewsViewInterface, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var result: NewsModel?
    
    var presenter: NewsPresenterInterface?
    
    func setupView() {
        collectionView.register(UINib(nibName: NewsCell.identifier, bundle: nil), forCellWithReuseIdentifier: NewsCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
           collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        presenter?.fetchDatas(with: "id")
        
        title = "News"
    }
    
    func showView(with result: NewsModel) {
        DispatchQueue.main.async {
            self.result = result
            self.collectionView.reloadData()
        }
    }
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.notifyViewDidLoad()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        
        cell.titleLbl.text = result?.articles?[indexPath.item].title
        cell.secondary1Lbl.text = "Published At: \(result?.articles?[indexPath.item].publishedAt?.convertToDate() ?? "")"
        cell.secondary2Lbl.text = result?.articles?[indexPath.item].author
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewPushToDetail(with: result?.articles?[indexPath.item].url ?? "")
    }
    

}
