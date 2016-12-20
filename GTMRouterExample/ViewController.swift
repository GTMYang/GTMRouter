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
    let nextBButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("go to B", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextBTouch), for: .touchUpInside)
        
        return btn
    }()
    
    let nextCButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("go to C", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextCTouch), for: .touchUpInside)
        
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.label)
        self.label.frame = self.view.bounds
        let h = self.view.bounds.size.height, w = self.view.bounds.size.width
        self.view.addSubview(self.nextBButton)
        self.nextBButton.frame = CGRect(x: 0, y: h-100, width: w, height: 50)
        self.view.addSubview(self.nextCButton)
        self.nextCButton.frame = CGRect(x: 0, y: h-200, width: w, height: 50)
    }

    
    // MARK: - Events
    func onNextBTouch() {
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerB")
    }
    func onNextCTouch() {
        let params:[String:Any] = ["image": UIImage(named: "logo.png") as Any]
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?id=1&name=GTMYang&ctitle=bunengzhongwen", parameter: params)
    }

}
