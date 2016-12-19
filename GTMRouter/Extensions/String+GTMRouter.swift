//
//  String+GTMRouter.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

extension String {
    
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw GRError.invalidURL(url: self) }
        return url
    }
}
