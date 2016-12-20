//
//  Helper.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

class Helper {
    
    /// 获取 url 中的 query 字典
    ///
    /// - Parameter url: url
    /// - Returns: query 字典
    class func getQueryDictionary(url: String) -> [String: Any] {
        var dic = [String: Any]();
        // var dic = [:] as Dictionary<String, AnyObject?>?
        let query = URL.init(string: url)?.query
        if query != nil {
            let queryArray = (query?.components(separatedBy: "&"))! as Array<String>
            
            for index in 0 ..< queryArray.count {
                let queryComponent = queryArray[index]
                let compArr = queryComponent.components(separatedBy: "=") as Array<String>
                if compArr.count >= 2 {
                    dic.updateValue(compArr[1], forKey: compArr[0])
                }
            }
        }
        return dic
    }
    
    /// 合并两个字典
    ///
    /// - Parameters:
    ///   - dic0: dic0
    ///   - dic1: dic1
    /// - Returns: 合并后的dic
    class func mergeDictionary(dic0: [String: Any], dic1: [String: Any]?) -> [String: Any] {
        var dic = dic0
        if dic1 != nil {
            for (key, value) in dic1! {
                dic.updateValue(value, forKey: key)
            }
        }
        return dic
    }
    
    // stolen from Alamofire
    static func escape(_ string: String) -> String {
        let legalURLCharactersToBeEscaped: CFString = ":&=;+!@#$()',*" as CFString
        return CFURLCreateStringByAddingPercentEscapes(nil, string as CFString!, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
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
