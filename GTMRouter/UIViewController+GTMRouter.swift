//
//  UIViewController+GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/20.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func initliazeParameters(parameters: [String: Any]) {
        let children = Mirror(reflecting: self).children.filter { $0.label != nil }
        for child in children {
            if let key = child.label, let val = parameters[key] {
                self.setValue(val, forKey: key)
            }
        }
    }
}
