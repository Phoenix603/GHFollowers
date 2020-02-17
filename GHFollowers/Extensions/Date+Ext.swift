//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/15/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MMM yyyy"
        dataFormatter.timeZone = .current
        
        return dataFormatter.string(from: self)
    }
}     
