//
//  UIViewController+GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/20.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

extension UIViewController {
    
    // 注入url参数
    func initQueryParameters(parameters: [String: String]) {
        let children = Mirror(reflecting: self).children.filter { $0.label != nil }
        for child in children {
            if let key = child.label, let val = parameters[key] {
                let propertyType = type(of: child.value)
                
                switch propertyType {
                case _ as String.Type, _ as Optional<String>.Type:
                    self.setValue(val, forKey: key)
                case _ as Int.Type:
                    self.setValue(val.intValue, forKey: key)
                case _ as Optional<Int>.Type:
                    assert(false, "GTMRouter --> url参数不支持Optional<Int>类型，改成Int类型，或者使用字典方式传参")
                    
                case _ as Float.Type:
                    self.setValue(val.floatValue, forKey: key)
                case _ as Optional<Float>.Type:
                    assert(false, "GTMRouter --> url参数不支持Optional<Float>类型，改成Int类型，或者使用字典方式传参")
                    
                case _ as Double.Type:
                    self.setValue(val.doubleValue, forKey: key)
                case _ as Optional<Double>.Type:
                    assert(false, "GTMRouter --> url参数不支持Optional<Double>类型，改成Int类型，或者使用字典方式传参")
                    
                case _ as Bool.Type:
                    self.setValue(val.boolValue, forKey: key)
                case _ as Optional<Bool>.Type:
                    assert(false, "GTMRouter --> url参数不支持Optional<Bool>类型，改成Int类型，或者使用字典方式传参")
                    
                default:
                    break
                }
            }
        }
    }
    
    // 注入dic参数
    func initliazeDicParameters(parameters: [String: Any]) {
        let children = Mirror(reflecting: self).children.filter { $0.label != nil }
        for child in children {
            if let key = child.label, let val = parameters[key] {
                self.setValue(val, forKey: key)
            }
        }
    }
}
