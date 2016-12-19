//
//  GRProtocol.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation


public protocol GTMRouterParameterInitble {
   
    /// 参数初始化器
    /// url中的参数全部默认String类型，其他类型需要在初始化器里自己转换
    /// - Parameter parameters: 参数字典
    init(parameters: [String: Any])
}
