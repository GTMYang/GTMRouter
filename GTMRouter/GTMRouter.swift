//
//  GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation


/// push方式打开视图（UIViewController, web page, other app）
///
/// - Parameters:
///   - url: router://host(TargetName)/path(controller)?param1=v1&param2=v2
///   - parameter: url里面不能包含的参数，从这里传
public func push(url: String, parameter: [String: Any]? = nil) {
    Router.shared.push(url: url, parameter: parameter)
}


/// 模态窗口方式打开视图（UIViewController, web page）
///
/// - Parameters:
///   - url: router://host(TargetName)/path(controller)?param1=v1&param2=v2
///   - parameter:  url里面不能包含的参数，从这里传
public func pop(url: String, parameter: [String: Any]? = nil) {
    Router.shared.pop(url: url, parameter: parameter)
}
