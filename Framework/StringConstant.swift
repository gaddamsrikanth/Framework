//
//  StringConstant.swift
//  Framework
//
//  Created by Developer88 on 7/25/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import Foundation

extension String {
    
    func localized(lang:String) -> String {
    
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
}
