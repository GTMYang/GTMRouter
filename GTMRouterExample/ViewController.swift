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
        btn.setTitle("ViewControllerB", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextBTouch), for: .touchUpInside)
        
        return btn
    }()
    
    let nextCButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("ViewControllerC", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextCTouch), for: .touchUpInside)
        
        return btn
    }()
    
    let nextDButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("ViewControllerD", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextDTouch), for: .touchUpInside)
        
        return btn
    }()
    
    let nextWebButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("WebViewController", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onNextWebTouch), for: .touchUpInside)
        
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "GTMRouter Demo"
        
        self.view.addSubview(self.label)
        self.label.frame = self.view.bounds
        let h = self.view.bounds.size.height, w = self.view.bounds.size.width
        self.view.addSubview(self.nextBButton)
        self.view.addSubview(self.nextCButton)
        self.view.addSubview(self.nextDButton)
        self.view.addSubview(self.nextWebButton)
        self.nextDButton.frame = CGRect(x: 0, y: h-100, width: w, height: 50)
        self.nextCButton.frame = CGRect(x: 0, y: h-150, width: w, height: 50)
        self.nextBButton.frame = CGRect(x: 0, y: h-200, width: w, height: 50)
        self.nextWebButton.frame = CGRect(x: 0, y: h-250, width: w, height: 50)
        
        
        // 支持网页
        GTMRouter.setWebVCFactory(factory: WebViewControllerFactory())
    }

    
    // MARK: - Events
    @objc func onNextBTouch() {
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerB")
    }
    @objc func onNextCTouch() {
        let params:[String:Any] = ["image": UIImage(named: "logo.png") as Any]
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?ip=1&fp=1.2345&dp=12222.2345&bp=true&name=GTMYang,你好", parameter: params)
    }
    @objc func onNextDTouch() {
        GTMRouter.push(url: "router://GTMRouterExample/ViewControllerD")
    }
    
    @objc func onNextWebTouch() {
        GTMRouter.push(url: "https://www.baidu.com", parameter: ["title": "测试网页传参数"])
    }

}

