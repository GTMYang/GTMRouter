//
//  String+GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

extension String {

    public var escaped: String {
        get {
            let legalURLCharactersToBeEscaped: CFString = ":&=;+!@#$()',*" as CFString
            return CFURLCreateStringByAddingPercentEscapes(nil, self as CFString!, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
        }
    }
    
    public func asURL() -> URL? {
        let utf8Str = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let urlString = utf8Str, let url = URL(string: urlString) else {
            print("GTMRouter ---> 字符串转URL出错，请检查URL字符串")
            return nil
        }
        return url
    }
}
