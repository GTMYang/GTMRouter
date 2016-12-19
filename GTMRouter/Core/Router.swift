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
        do {
            let url = try urlString.asURL()
            if let target = url.host {
                // parameter
                var params = Helper.getQueryDictionary(url: urlString)
                if let extParams = parameter {
                    params = Helper.mergeDictionary(dic0: params, dic1: extParams)
                }
                
                // controller
                let path = url.path
                let className = "\(target).\(path)"
                let cls: AnyClass? = NSClassFromString(className)
                if let controller = cls as? UIViewController.Type {
                    var viewController: UIViewController?
                    if let parameterInitbleController = cls as? GTMRouterParameterInitble.Type {
                        viewController = parameterInitbleController.init(parameters: params) as? UIViewController
                    } else {
                        viewController = controller.init()
                    }
                    guard let controller = viewController else {
                        assert(true, "Router ---> 未能创建\(className)的实例")
                        return
                    }
                    if modal {
                        Helper.currentTopController.present(controller, animated: true, completion: nil)
                    } else {
                        Helper.currentTopController.navigationController?.pushViewController(controller, animated: true)
                    }
                } else {
                    assert(true, "Router ---> \(className) 必须是UIViewController类型或者其子类型")
                }
            } else {
                assert(true, "Router ---> url.host不能为空，必须为类所在的Target Name")
            }
        } catch {
            assert(true, error.localizedDescription)
        }
    }
    
}
