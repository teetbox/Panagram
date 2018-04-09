//
//  StringExtension.swift
//  Panagram
//
//  Created by Matt Tian on 09/04/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import Foundation

extension String {
    
    func isAnagramOf(_ s: String) -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        
        return lowerSelf.sorted() == lowerOther.sorted()
    }
    
    func isPalindrom() -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let reversedSelf = String(lowerSelf.reversed())
        
        return lowerSelf == reversedSelf
    }
    
}
