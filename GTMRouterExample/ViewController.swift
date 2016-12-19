//
//  ViewController.swift
//  GTMRouterExample
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import UIKit
import GTMRouter

class ViewController: UIViewController {
    
    let label: UILabel = {
        let lab = UILabel()
        lab.text = "A"
        lab.textAlignment = .center
        lab.textColor = UIColor.red
        lab.font = UIFont.systemFont(ofSize: 38)
        
        return lab
    }()
    let nextButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextTouch), for: .touchUpInside)
        
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.label)
        self.label.frame = self.view.bounds
        self.view.addSubview(self.nextButton)
        let h = self.view.bounds.size.height, w = self.view.bounds.size.width
        self.nextButton.frame = CGRect(x: 0, y: h-100, width: w, height: 50)
    }

    
    // MARK: - Events
    func onNextTouch() {
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerB")
    }

}

