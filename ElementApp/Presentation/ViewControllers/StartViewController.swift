//
//  StartViewController.swift
//  ElementApp
//
//  Created by Даниил on 02.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var actionArea: UIView!
    @IBOutlet weak var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRecognizer()
        configureActionLabel()
        
        mainImageView.image = UIImage(named: "MainLogo")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.actionArea.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func tapHandler() {
        let pageController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        self.navigationController?.pushViewController(pageController, animated: true)
    }
    
    private func configureActionLabel() {
        actionLabel.text = "Нажми сюда \n Открой новый мир"
        actionLabel.numberOfLines = 2
        actionLabel.textAlignment = .center
    }
    
}
