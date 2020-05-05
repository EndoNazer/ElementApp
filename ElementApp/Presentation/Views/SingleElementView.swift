//
//  SingleElementView.swift
//  ElementApp
//
//  Created by Даниил on 02.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class SingleElementView: UIView {
    
    @IBOutlet var content: UIView!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var elementLogoImageView: UIImageView!
    @IBOutlet weak var whitePlaceView: UIView!
    
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("SingleElementView", owner: self, options: nil)
        addSubview(content)
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        whitePlaceView.layer.cornerRadius = 12
        
        configureRecognizer()
    }
    
    private func configureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.whitePlaceView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func tapHandler() {
        action?()
    }
    
}
