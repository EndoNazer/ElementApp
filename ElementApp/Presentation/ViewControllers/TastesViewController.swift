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
        let irishCream = configureTasteView(imageName: "irishCream", tasteDescription: "Яркий сливочно — кофейный аромат ирландского крема, терпкий и благородный вкус, который не оставит вас равнодушным")
        
        let peach = configureTasteView(imageName: "peach", tasteDescription: "Это нежная бархатистая мякоть спелого персика. Он в меру сладок, насыщен и ненавязчив. Отлично курится как в соло, так и во фруктовых миксах")

        let raspberry = configureTasteView(imageName: "raspberry", tasteDescription: "Ярко выраженный аромат ягод малины с удивительными нотками сладкого, домашнего варенья позволит вам окунуться в воспоминания летних каникул у бабушки в деревне, где можно было вдоволь насладиться этими прекрасными ягодами")

        let lemongrass = configureTasteView(imageName: "lemongrass", tasteDescription: "Обладает ярким лимонным вкусом с лёгким оттенком имбиря, отдающим свежестью, благодаря леденцовым ноткам")
        
        let kashmir = configureTasteView(imageName: "kashmir", tasteDescription: "Пряный, насыщенно-душистый аромат специй, который никого не оставит равнодушным")
        
        let cherry = configureTasteView(imageName: "cherry", tasteDescription: "Вкус спелой, сочной, сладкой мякоти вишни, который дополняет небольшая терпкость косточки")
        
        let blueberry = configureTasteView(imageName: "blueberry", tasteDescription: "Ароматный кисло-сладкий вкус сочных ягод черники")
        
        let basil = configureTasteView(imageName: "basil", tasteDescription: "Душистый, свежий, чуть сладковатый, вкус только что сорванного базилика с пряными и немного терпкими нотками")
        
        let grapefruit = configureTasteView(imageName: "grapefruit", tasteDescription: "Микс, в котором пикантная горчинка грейпфрута органично сочетается с лёгкой сладостью помело")
        
        let currant = configureTasteView(imageName: "currant", tasteDescription: "Насыщенный сладкий вкус чёрной смородины и яркая бодрящая кислинка красной — это баланс между лёгкостью и насыщенностью, мягкостью и терпкостью")
        
        let watermelonHolls = configureTasteView(imageName: "watermelonHolls", tasteDescription: "Тонкий летний вкус арбуза в сочетании с приятным и освежающим холодком")
        
        let fir = configureTasteView(imageName: "fir", tasteDescription: "Сибирская пихта — это яркий и насыщенный хвойно-смолистый аромат, который погружает вас в гущу леса")
        
        let lychee = configureTasteView(imageName: "lychee", tasteDescription: "Экзотический фрукт лакомый, сладкий, с небольшой кислинкой и клубничным послевкусием. Невесомый, сложный, экстравагантный")
        
        let kalamansi = configureTasteView(imageName: "kalamansi", tasteDescription: "Приятная цитрусовая кислинка, свежесть и лёгкость в миксе из лимона, кумквата и лайма")
        
        let cactusFig = configureTasteView(imageName: "cactusFig", tasteDescription: "Довольно редкий фрукт, напоминающий, по некоторым мнениям, перезрелый арбуз. Свежий и сладкий, легкий и сочный")
        
        let pear = configureTasteView(imageName: "pear", tasteDescription: "Натуральная нежность сахарной груши с сочной мякотью. Летняя и такая манящая...")
        
        let belgianWaffle = configureTasteView(imageName: "belgianWaffle", tasteDescription: "Изумительная сладость вафель со сливочно-карамельным топпингом, нотками ванили и сахара. Всё это вызывает в памяти запахи свежей выпечки")
        
        let feijoa = configureTasteView(imageName: "feijoa", tasteDescription: "Сладкая свежесть и лёгкая приторность в сбалансированной комбинации из ананаса, киви и зелёной недоспелой клубники")
        
        let wildberryMors = configureTasteView(imageName: "wildberryMors", tasteDescription: "В центре микса насыщенный букет из спелых лесных ягод. Преобладание клюквы дает кислинку, а брусника и морошка делают аромат богаче")
        
        let lemon = configureTasteView(imageName: "lemon", tasteDescription: "Яркий, но не обжигающий вкус лимона, с терпкими нотками цедры. Освежающий, бодрящий — лимон настоящий")
        
        let mango = configureTasteView(imageName: "mango", tasteDescription: "Уникальное сочетание сочного сладкого манго с лёгкой травянистой ноткой")
        
        let nutsMix = configureTasteView(imageName: "nutsMix", tasteDescription: "Сбалансированный микс из разных видов орехов: тут и лёгкая сладость кешью, и неповторимый вкус арахиса в сочетании с обжаренным фундуком")
        
        let moroz = configureTasteView(imageName: "moroz", tasteDescription: "Эффект дикого холода, который любой микс сделает ледяным. Советуем добавлять 10-30% на забивку")
        
        let thyme = configureTasteView(imageName: "thyme", tasteDescription: "Благодаря чабрецу обладает ярко выраженным, немного горьковатым вкусом с оригинальными, пряными нотками, а бергамот добавит приятную кислинку")
        
        let cola = configureTasteView(imageName: "cola", tasteDescription: "Сладкий вкус легендарного напитка, в меру карамельный, с легким пряным послевкусием")
        
        return [irishCream, peach, raspberry, lemongrass, kashmir, cherry, blueberry, basil, grapefruit, currant, watermelonHolls, fir, lychee, kalamansi, cactusFig, pear, belgianWaffle, feijoa, wildberryMors, lemon, mango, nutsMix, moroz, thyme, cola]
    }
    
    private func configureTasteView(imageName: String, tasteDescription: String) -> TasteView {
        let tasteView = TasteView()
        let image = UIImage(named: imageName)
        tasteView.mainImageView.image = image
        tasteView.action = { [weak self] in
            guard let `self` = self else { return }
            self.navigateToSingleTaste(image: image, tasteDescription: tasteDescription)
        }
        return tasteView
    }
    
    private func navigateToSingleTaste(image: UIImage?, tasteDescription: String) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SingleTasteViewController") as! SingleTasteViewController
        controller.tasteImage = image
        controller.tasteDescription = tasteDescription
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension TastesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
