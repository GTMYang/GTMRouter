//
//  NavProvider.swift
//  GTMRouter
//
//  Created by 骆扬 on 2018/5/4.
//  Copyright © 2018年 luoyang. All rights reserved.
//

import Foundation

public protocol GRHelper {
    
    var navigationController: UINavigationController? {get}
    var topViewController: UIViewController? {get}
}

class DefaultHelper: GRHelper {
    /// 找到topViewController
    var topViewController: UIViewController? {
        return navigationController?.topViewController
    }
    /// 找到 UINavigationController
    var navigationController: UINavigationController? {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            if rootVC.isKind(of: UINavigationController.self) {
                return rootVC as? UINavigationController
            }
            if rootVC.isKind(of: UITabBarController.self) {
                let tabbarVC = rootVC as! UITabBarController
                if tabbarVC.selectedViewController!.isKind(of: UINavigationController.self) {
                    return tabbarVC.selectedViewController as? UINavigationController
                }
            }
        }
        return nil
    }
}
