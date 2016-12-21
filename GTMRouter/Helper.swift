//
//  Helper.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

class Helper {
    
    /// 合并两个字典
    ///
    /// - Parameters:
    ///   - dic0: dic0
    ///   - dic1: dic1
    /// - Returns: 合并后的dic
    class func merge(dic0: [String: Any], dic1: [String: Any]?) -> [String: Any] {
        var dic = dic0
        if dic1 != nil {
            for (key, value) in dic1! {
                dic.updateValue(value, forKey: key)
            }
        }
        return dic
    }

    /// 当前栈顶视图控制器
    static var currentTopController: UIViewController {
        get {
            let rootViewController = UIApplication.shared.keyWindow?.rootViewController
            return Helper.currentTopViewController(rootViewController: rootViewController!)
        }
    }
    
    /// 获取视图控制器的栈顶视图控制器
    ///
    /// - Parameter rootViewController: 根视图控制器
    /// - Returns: 栈顶视图控制器
    static func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }
}
