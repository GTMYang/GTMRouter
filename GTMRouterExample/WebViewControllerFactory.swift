//
//  WebViewControllerFactory.swift
//  GTMRouterExample
//
//  Created by 骆扬 on 2018/6/26.
//  Copyright © 2018年 luoyang. All rights reserved.
//

import UIKit
import GTMRouter

class WebViewControllerFactory: WebVCFactory {
    
    func createWebVC(with urlString: String) -> UIViewController {
        let webVC = WebViewController()
        webVC.urlString = urlString
        
        return webVC
    }
}
