//
//  AboutView.swift
//  ElementApp
//
//  Created by Даниил on 05.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    @IBOutlet var content: UIView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("AboutView", owner: self, options: nil)
        addSubview(content)
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
