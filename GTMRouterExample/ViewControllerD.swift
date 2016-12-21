//
//  ViewControllerD.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/20.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import UIKit

class ViewControllerD: UIViewController {
    
    
    let label: UILabel = {
        let lab = UILabel()
        lab.text = "D"
        lab.textAlignment = .center
        lab.textColor = UIColor.green
        lab.font = UIFont.systemFont(ofSize: 38)
        
        return lab
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.label)
        self.label.frame = self.view.bounds
    }
    
}
