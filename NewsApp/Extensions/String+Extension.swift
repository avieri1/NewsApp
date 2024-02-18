//
//  String+Extension.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
    
    func convertToDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+07:00")
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd-MM-yy"
            let formatedStringDate = dateFormatter.string(from: dt)
            return formatedStringDate
        }
        
        return "01-01-01"
    }
}
