//
//  URL+GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/21.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

extension URL {
    
    var queryParameters: [String : String] {
        get {
            var dic = [String: String]();
            
            guard let queryStr = query else {
                return [:]
            }
            let queryArray = (queryStr.components(separatedBy: "&")) as Array<String>
            
            for index in 0 ..< queryArray.count {
                let queryComponent = queryArray[index]
                let compArr = queryComponent.components(separatedBy: "=") as Array<String>
                if compArr.count >= 2 {
                    let key = compArr[0]
                    let val = compArr[1].removingPercentEncoding
                    dic.updateValue(val ?? "", forKey: key)
                }
            }
            return dic
        }
    }
}
