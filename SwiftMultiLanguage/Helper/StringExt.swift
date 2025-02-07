//
//  StringExt.swift
//  SwiftMultiLanguage
//
//  Created by Jasper Hui on 7/2/2025.
//

import Foundation

extension String {
    func translated ()-> String{
        if let path = Bundle.main.path(forResource: LocalizDefaultLanguage, ofType: "lproj"),
            let bundle = Bundle(path: path){
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
            return self
        
    }
}
