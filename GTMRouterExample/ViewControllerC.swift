//
//  ViewControllerC.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/20.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import UIKit
import GTMRouter

class ViewControllerC: UIViewController {
    
    var id: String?
    var name: String?
    var ctitle: String?
    var image: UIImage?

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    /// 参数初始化器
    /// url中的参数全部默认String类型，其他类型需要在初始化器里自己转换
    /// - Parameter parameters: 参数字典
//    required init(parameters: [String: Any]) {
//        id = parameters["id"] as! String
//        name = parameters["name"] as! String
//        ctitle = parameters["ctitle"] as! String
//        image = parameters["image"] as! UIImage
//        
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idLabel.text = "id = \(id)"
        nameLabel.text = "name = \(name)"
        titleLabel.text = "ctitle = \(ctitle)"
        imageV.image = image
    }

}

