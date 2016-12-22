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
    
    var ip: Int=0
    var fp: Float=0
    var dp: Double=0
    var bp: Bool=false
    var name: String?
    var image: UIImage?

    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var flaotLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
    @IBOutlet weak var boolLabel: UILabel!
    @IBOutlet weak var stringLabel: UILabel!
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

        intLabel.text =     "Int参数：     \(ip)"
        flaotLabel.text =   "Float参数：   \(fp)"
        doubleLabel.text =  "Double参数：  \(dp)"
        boolLabel.text =    "Bool参数：    \(bp)"
        stringLabel.text =  "String参数：  \(name ?? "")"
        imageV.image = image
    }

}

