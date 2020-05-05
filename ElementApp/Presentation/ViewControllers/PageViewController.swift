//
//  PageViewController.swift
//  ElementApp
//
//  Created by Даниил on 01.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var singleElementViews: [SingleElementView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.delegate = self
        
        singleElementViews = createSingleElementViews()
        setupSingleElementViewScroll(singleElementViews: singleElementViews)
        
        pageControl.numberOfPages = singleElementViews.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSingleElementViewScroll(singleElementViews: singleElementViews)
    }
    
    private func setupSingleElementViewScroll(singleElementViews : [SingleElementView]) {
        let height = view.frame.height + 45
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        scroll.contentSize = CGSize(width: view.frame.width * CGFloat(singleElementViews.count), height: height)
        scroll.isPagingEnabled = true
        
        for i in 0 ..< singleElementViews.count {
            singleElementViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scroll.frame.height)
            scroll.addSubview(singleElementViews[i])
        }
    }
    
    private func createSingleElementViews() -> [SingleElementView] {
        
        let air = SingleElementView()
        air.gifImageView.loadGif(name: ElementType.Air.rawValue)
        air.elementLogoImageView.image = UIImage(named: ElementType.Air.rawValue + "Logo")
        air.gifImageView.alpha = 0
        air.elementLogoImageView.alpha = 0
        UIView.animate(withDuration: 1) {
            air.gifImageView.alpha = 1
            air.elementLogoImageView.alpha = 1
        }
        air.action  = { [weak self] in
            guard let `self` = self else { return }
            self.navigateToSingleElement(type: .Air)
        }
        
        let water = SingleElementView()
        water.gifImageView.loadGif(name: ElementType.Water.rawValue)
        water.elementLogoImageView.image = UIImage(named: ElementType.Water.rawValue + "Logo")
        water.action  = { [weak self] in
            guard let `self` = self else { return }
            self.navigateToSingleElement(type: .Water)
        }
        
        let earth = SingleElementView()
        earth.gifImageView.loadGif(name: ElementType.Earth.rawValue)
        earth.elementLogoImageView.image = UIImage(named: ElementType.Earth.rawValue + "Logo")
        earth.action  = { [weak self] in
            guard let `self` = self else { return }
            self.navigateToSingleElement(type: .Earth)
        }
        
        let fire = SingleElementView()
        fire.gifImageView.loadGif(name: ElementType.Fire.rawValue)
        fire.elementLogoImageView.image = UIImage(named: ElementType.Fire.rawValue + "Logo")
        fire.action  = { [weak self] in
            guard let `self` = self else { return }
            self.navigateToSingleElement(type: .Fire)
        }
        
        return [air, water, earth, fire]
    }
    
    private func navigateToSingleElement(type: ElementType) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SingleElementViewController") as! SingleElementViewController
        controller.type = type
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
