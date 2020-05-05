//
//  SingleTasteViewController.swift
//  ElementApp
//
//  Created by Даниил on 05.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class SingleTasteViewController: UIViewController {
    
    @IBOutlet weak var tasteImageView: UIImageView!
    @IBOutlet weak var tasteDescriptionLabel: UILabel!
    
    var tasteImage: UIImage?
    var tasteDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasteImageView.image = tasteImage
        tasteDescriptionLabel.text = tasteDescription
    }
    
}
