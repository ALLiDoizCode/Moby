//
//  Currency.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

extension Int {
    var currency: String {
        let result = NumberFormatter.localizedString(from: NSNumber(value: self), number: NumberFormatter.Style.currency)
        let endIndex = result.index(result.endIndex, offsetBy: -3)
        let truncated = result.substring(to: endIndex)
        
        return truncated
    }
    
}
