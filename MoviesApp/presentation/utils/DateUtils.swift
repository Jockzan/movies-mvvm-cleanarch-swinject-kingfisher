//
//  DateUtils.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

extension String {
    func convertToMediumDateFormat() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            return outputFormatter.string(from: date)
        }
        
        return self
    }
}
