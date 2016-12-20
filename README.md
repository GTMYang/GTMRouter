
<p align="center">
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://raw.githubusercontent.com/GTMYang/GTMRouter/master/logo.png"></a>
</p>

<p align="center">
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/badge/platform-ios-lightgrey.svg"></a>
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/github/license/johnlui/Pitaya.svg?style=flat"></a>
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/badge/language-Swift%203-orange.svg"></a>
<a href="https://travis-ci.org/GTMYang/GTMRouter"><img src="https://img.shields.io/travis/johnlui/Pitaya.svg"></a>
</p>

<br>

GTMRouter
===================
`GTMRouter` 用Swift实现的视图控制器路由组件


# Demo
直接下载代码，里面有Demo

# Installation

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `GTMRouter` in your `Podfile`.

```ruby
use_frameworks!

pod 'GTMRouter'
```

Then, run the following command.

```bash
$ pod install
```


## Manual

Copy `GTMRouter` folder to your project. That's it.

_**Note:** Make sure that all files in `GTMRouter` included in Compile Sources in Build Phases._

# 版本

## Vesrion 1.0.0

This version requires Xcode 8.0 and Swift 3.

# 使用帮助

Firstly, import `GTMRouter`.

```swift
import GTMRouter
```

## 界面跳转
```swift
    // push方式
    GTMRouter.push(url: "router://GTMRouterExample/ViewControllerB")
    // 模态窗口方式打开
    GTMRouter.pop(url: "router://GTMRouterExample/ViewControllerB")
```

## url传参数（目前不支持中文参数，中文参数可以通过下面字典传参数方式传递）
```swift
     GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?id=1&name=GTMYang&ctitle=bunengzhongwen"）
```

## 字典传参数
```swift
let params:[String:Any] = ["image": UIImage(named: "logo.png") as Any]
GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?id=1&name=GTMYang&ctitle=bunengzhongwen", parameter: params)
```

约定
- 视图控制器必须实现GTMRouterParameterInitble协议

GTMRouterParameterInitble

```swift
//
//  GRProtocol.swift
//  GTMRouter
//
//  Created by luoyang on 2016/12/19.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation


public protocol GTMRouterParameterInitble {

/// 参数初始化器
/// url中的参数全部默认String类型，其他类型需要在初始化器里自己转换
/// - Parameter parameters: 参数字典
init(parameters: [String: Any])
}

```






#参与开源
欢迎提交 issue 和 PR，大门永远向所有人敞开。

#开源协议
本项目遵循 MIT 协议开源，具体请查看根目录下的 [LICENSE](https://raw.githubusercontent.com/GTMYang/GTMRouter/master/LICENSE) 文件。


