//
//  WebControllerFactory.swift
//  GTMRouter
//
//  Created by 骆扬 on 2018/6/26.
//  Copyright © 2018年 luoyang. All rights reserved.
//

import Foundation

public protocol WebVCFactory {
    func createWebVC(with urlString: String) -> UIViewController
}
