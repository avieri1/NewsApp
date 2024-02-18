//
//  NewsCell.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import UIKit

class NewsCell: UICollectionViewCell {
    static let identifier = String(describing: NewsCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var secondary1Lbl: UILabel!
    @IBOutlet weak var secondary2Lbl: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.cornerRadius = 12
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
    }

}
