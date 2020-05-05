//
//  AboutViewController.swift
//  ElementApp
//
//  Created by Даниил on 05.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tastesTapArea: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var aboutViews: [AboutView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRecognizer()
        
        scroll.delegate = self
        
        aboutViews = createAboutViews()
        setupAboutViewScroll(aboutViews: aboutViews)
        
        pageControl.numberOfPages = aboutViews.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupAboutViewScroll(aboutViews: aboutViews)
    }
    
    private func configureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.tastesTapArea.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func tapHandler() {
        navigateToTastes()
    }
    
    private func navigateToTastes() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TastesViewController") as! TastesViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupAboutViewScroll(aboutViews : [AboutView]) {
        let height = view.frame.height * 0.5
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        scroll.contentSize = CGSize(width: view.frame.width * CGFloat(aboutViews.count), height: height)
        scroll.isPagingEnabled = true
        
        for i in 0 ..< aboutViews.count {
            aboutViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: height)
            scroll.addSubview(aboutViews[i])
        }
    }
    
    private func createAboutViews() -> [AboutView] {
        
        let aboutView = AboutView()
        aboutView.aboutImageView.image = UIImage(named: "MainLogo")
        aboutView.aboutLabel.text = "ELEMENT — табак для кальяна, созданный на основе природных ингредиентов"
        
        let hour = AboutView()
        hour.aboutImageView.image = UIImage(named: "hour")
        hour.aboutLabel.text = "Средняя длительность курения — 60 минут, насыщенный вкус и крепость сохраняется на протяжении всего процесса курения"
        
        let smoke = AboutView()
        smoke.aboutImageView.image = UIImage(named: "smoke")
        smoke.aboutLabel.text = "Благодаря качественному табачному листу и его варке, ELEMENT любит жар. Жаростойкость — выше среднего, он легко восстанавливает вкус при продуве и охлаждении чаши"
        
        let use = AboutView()
        use.aboutImageView.image = UIImage(named: "use")
        use.aboutLabel.text = "ELEMENT мелко нарезан, без мусора и лишнего сиропа. Не нужно быть профессионалом — табак можно забить в любую чашу и курить"
        
        let pack = AboutView()
        pack.aboutImageView.image = UIImage(named: "pack")
        pack.aboutLabel.text = "Для сохранения вкусовых свойств продукта используется трехслойная пленка, обеспечивающая защиту от света и влаги"
        
        let soft = AboutView()
        soft.aboutImageView.image = UIImage(named: "soft")
        soft.aboutLabel.text = "При производстве табачной смеси не используется жидкий никотин, поэтому табак мягко курится и не «бьет по горлу». Такой эффект также достигается благодаря увлажнению табачного листа"
        
        let acz = AboutView()
        acz.aboutImageView.image = UIImage(named: "acz")
        acz.aboutLabel.text = "Акциз - гарантия стабильного качества и вкуса. Акцизный табак проходит санитарно-эпидемиологический контроль, что подтверждает его безопасность"
        
        
        return [aboutView, hour, smoke, use, pack, soft, acz]
    }
    
}

extension AboutViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
