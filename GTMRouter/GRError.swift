//
//  GRError.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

public enum GRError: Error {
    case invalidURL(url: String)
//    case invalidOpenWay(way: String, forUrl: String)
//    case notFound(controller: String, forUrl: String)
    
    
    func localizedDescription() -> String {
        switch self {
        case .invalidURL(let url):
            return "url字符串格式错误[\(url)]"
//        case .invalidOpenWay(let way, let url):
//            return "不支持的\(way)方式打开[\(url)]"
//        case .notFound(let controller, _):
//            return "未找到[\(controller)]"
        }
    }
}
