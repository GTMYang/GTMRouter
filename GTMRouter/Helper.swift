//
//  Helper.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

public class Helper {

    /// 当前栈顶视图控制器
    public static var currentTopController: UIViewController {
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

