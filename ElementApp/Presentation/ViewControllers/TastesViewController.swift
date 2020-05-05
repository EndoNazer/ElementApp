//
//  TastesViewController.swift
//  ElementApp
//
//  Created by Даниил on 05.05.2020.
//  Copyright © 2020 Даниил. All rights reserved.
//

import UIKit


class TastesViewController: UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var tasteViews: [TasteView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.delegate = self
        
        tasteViews = createTasteViews()
        setupTasteViewScroll(tasteViews: tasteViews)
        
        pageControl.numberOfPages = tasteViews.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupTasteViewScroll(tasteViews: tasteViews)
    }
    
    private func setupTasteViewScroll(tasteViews : [TasteView]) {
        let height = view.frame.height + 45
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        scroll.contentSize = CGSize(width: view.frame.width * CGFloat(tasteViews.count), height: height)
        scroll.isPagingEnabled = true
        
        for i in 0 ..< tasteViews.count {
            tasteViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: height)
            scroll.addSubview(tasteViews[i])
        }
    }
    
    private func createTasteViews() -> [TasteView] {
        
        let irishCream = TasteView()
        irishCream.mainImageView.image = UIImage(named: "irishCream")
        
        let peach = TasteView()
        peach.mainImageView.image = UIImage(named: "peach")
        
        let raspberry = TasteView()
        raspberry.mainImageView.image = UIImage(named: "raspberry")
        
        let lemongrass = TasteView()
        lemongrass.mainImageView.image = UIImage(named: "lemongrass")
        
        let kashmir = TasteView()
        kashmir.mainImageView.image = UIImage(named: "kashmir")
        
        let cherry = TasteView()
        cherry.mainImageView.image = UIImage(named: "cherry")
        
        let blueberry = TasteView()
        blueberry.mainImageView.image = UIImage(named: "blueberry")
        
        let basil = TasteView()
        basil.mainImageView.image = UIImage(named: "basil")
        
        let grapefruit = TasteView()
        grapefruit.mainImageView.image = UIImage(named: "grapefruit")
        
        let currant = TasteView()
        currant.mainImageView.image = UIImage(named: "currant")
        
        let watermelonHolls = TasteView()
        watermelonHolls.mainImageView.image = UIImage(named: "watermelonHolls")
        
        let fir = TasteView()
        fir.mainImageView.image = UIImage(named: "fir")
        
        let lychee = TasteView()
        lychee.mainImageView.image = UIImage(named: "lychee")
        
        let kalamansi = TasteView()
        kalamansi.mainImageView.image = UIImage(named: "kalamansi")
        
        let cactusFig = TasteView()
        cactusFig.mainImageView.image = UIImage(named: "cactusFig")
        
        let pear = TasteView()
        pear.mainImageView.image = UIImage(named: "pear")
        
        let belgianWaffle = TasteView()
        belgianWaffle.mainImageView.image = UIImage(named: "belgianWaffle")
        
        let feijoa = TasteView()
        feijoa.mainImageView.image = UIImage(named: "feijoa")
        
        let wildberryMors = TasteView()
        wildberryMors.mainImageView.image = UIImage(named: "wildberryMors")
        
        let lemon = TasteView()
        lemon.mainImageView.image = UIImage(named: "lemon")
        
        let mango = TasteView()
        mango.mainImageView.image = UIImage(named: "mango")
        
        let nutsMix = TasteView()
        nutsMix.mainImageView.image = UIImage(named: "nutsMix")
        
        let moroz = TasteView()
        moroz.mainImageView.image = UIImage(named: "moroz")
        
        let thyme = TasteView()
        thyme.mainImageView.image = UIImage(named: "thyme")
        
        let cola = TasteView()
        cola.mainImageView.image = UIImage(named: "cola")
        
        return [irishCream, peach, raspberry, lemongrass, kashmir, cherry, blueberry, basil, grapefruit, currant, watermelonHolls, fir, lychee, kalamansi, cactusFig, pear, belgianWaffle, feijoa, wildberryMors, lemon, mango, nutsMix, moroz, thyme, cola]
    }
    
}

extension TastesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
