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
public func present(url: String, parameter: [String: Any]? = nil) {
    Router.shared.present(url: url, parameter: parameter)
}

/// 通过urlString获取UIViewController实例
///
/// - Parameters:
///   - url: router://host(TargetName)/path(controller)?param1=v1&param2=v2
///   - parameter:  url里面不能包含的参数，从这里传
public func controller(from urlString: String, parameter: [String: Any]? = nil) -> UIViewController? {
    return Router.shared.controller(from: urlString, parameter: parameter)
}

/// 某些特殊情况DefaultHelper不能满足项目的个性化需求
/// 这时用户可以通过该方法注入自己的查找navigationController和topViewController的帮助类
///
/// - Parameters:
///   - helper: 用来查找navigationController和topViewController的帮助类（不设置的话使用 DefaultHelper）
public func setHelper(helper: GRHelper) {
    Router.shared.helper = helper
}

/// 如果要支持http的url需要设置WebViewController的工厂类
///
/// - Parameters:
/// - factory: 用来生成Web容器控制器的工厂类（需要实现WebVCFactory协议）
public func setWebVCFactory(factory: WebVCFactory) {
    Router.shared.webVCFactory = factory
}
