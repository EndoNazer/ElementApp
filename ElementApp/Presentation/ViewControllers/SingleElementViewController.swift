//
//  SingleElementViewController.swift
//  ElementApp
//
//  Created by Даниил on 03.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

enum ElementType: String {
    case Air = "Air"
    case Earth = "Earth"
    case Fire = "Fire"
    case Water = "Water"
}


class SingleElementViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreTapArea: UIView!
    
    var type: ElementType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.layer.cornerRadius = 15
        configureViews()
        configureRecognizer()
    }
    
    private func configureViews() {
        switch type {
        case .Air:
            let description = "Воздух - самая легкая из линеек Element. Пока еще не вышла, но, надеемся, очень скоро будет радовать нас своим насыщенным вкусом и легкостью покура!"
            setImageAndDescription(image: UIImage(named: "MainLogo"), description: description)
            mainImageView.alpha = 0.5
        case .Earth:
            let description = "Земля - крепкая линейка Element. Аромат табака ярок и насыщен, не пропадает после продолжительного курения. Жаролюбив и жаростоек. Спокойно восстанавливается после перегрева. Советую оценить микс из личи, арбузного холса и груши ;)"
            setImageAndDescription(image: UIImage(named: "SingleEarth"), description: description)
        case .Fire:
            let description = "Огонь - самая крепкая из линеек Element. Пока еще не вышла. Ждем чего-то сногсшибательного как по вкусу, так и по крепкости :)"
            setImageAndDescription(image: UIImage(named: "MainLogo"), description: description)
            mainImageView.alpha = 0.5
        case .Water:
            let description = "Вода - средняя линейка Element. Прекрасный выбор для любителей одновременно вкусного кальяна и приятных ощущений от накура. Одно прекрасно дополняет другое. Взяв 4 25-х угля можно получить кальян, который мягко вскружит голову и будет приятно удивлять вкусными аромками. Главное - не забывать продувать ;) Советую попробовать грейпфрут и помело 50 на 50 с персиком!"
            setImageAndDescription(image: UIImage(named: "SingleWater"), description: description)
        case .none:
            print("whoops")
        }
    }
    
    private func setImageAndDescription(image: UIImage?, description: String) {
        mainImageView.image = image
        descriptionLabel.text = description
    }
    
    private func configureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.moreTapArea.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func tapHandler() {
        navigateToAbout()
    }
    
    private func navigateToAbout() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
