//
//  Router.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation

public class Router {
    
    static let shared: Router = {
       return Router()
    }()
    
    func push(url: String, parameter: [String: Any]?) {
       self.open(urlString: url, parameter: parameter, modal: false)
    }
    
    func pop(url: String, parameter: [String: Any]?) {
        self.open(urlString: url, parameter: parameter, modal: true)
    }
    
    // MARK: - Private
    func open(urlString: String, parameter: [String: Any]?, modal: Bool) {
        
        if let url = urlString.asURL(), let target = url.host {
            // parameter
            var params = url.queryDtionary
            if let extParams = parameter {
                params = Helper.merge(dic0: params, dic1: extParams)
            }
            
            // controller
            let path = url.path.replacingOccurrences(of: "/", with: "")
            let className = "\(target).\(path)"
            let cls: AnyClass? = NSClassFromString(className)
            if let controller = cls as? UIViewController.Type {
                let viewController: UIViewController = controller.init()
                viewController.initliazeParameters(parameters: params)
                
                if modal {
                    Helper.currentTopController.present(viewController, animated: true, completion: nil)
                } else {
                    Helper.currentTopController.navigationController?.pushViewController(viewController, animated: true)
                }
            } else {
                assert(false, "Router ---> \(className) 必须是UIViewController类型或者其子类型")
            }
        } else {
            assert(false, "Router ---> url.host不能为空，必须为类所在的Target Name")
        }
    }
    
}
