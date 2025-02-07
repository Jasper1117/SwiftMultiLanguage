//
//  MLLabel.swift
//  SwiftMultiLanguage
//
//  Created by Jasper Hui on 6/2/2025.
//

import UIKit

class MLLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment:NSTextAlignment, fontSize:CGFloat, text:String){
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    func configure(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
