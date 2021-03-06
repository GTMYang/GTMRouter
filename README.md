
<p align="center">
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://raw.githubusercontent.com/GTMYang/GTMRouter/master/logo.png"></a>
</p>

<p align="center">
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/badge/platform-ios-lightgrey.svg"></a>
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/github/license/johnlui/Pitaya.svg?style=flat"></a>
<a href="https://github.com/GTMYang/GTMRouter"><img src="https://img.shields.io/badge/language-Swift%203-orange.svg"></a>
</p>

<br>

GTMRouter
===================
`GTMRouter` 用Swift实现的视图控制器路由组件，简单易用！！！


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

## Vesrion 1.3.5

This version requires Xcode 9.0 and Swift 4.

# 使用帮助

Firstly, import `GTMRouter`.

```swift
import GTMRouter
```

## 界面跳转
```swift
    // push方式打开
    GTMRouter.push(url: "router://GTMRouterExample/ViewControllerB")
    // present方式打开
    GTMRouter.present(url: "router://GTMRouterExample/ViewControllerB")
```

## url传参数
```swift
     GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?id=1&name=GTMYang&ctitle=bunengzhongwen"）
```

## 字典传参数
```swift
let params:[String:Any] = ["image": UIImage(named: "logo.png") as Any]
GTMRouter.push(url: "router://GTMRouterExample/ViewControllerC?id=1&name=GTMYang&ctitle=bunengzhongwen", parameter: params)
```

## 自定义Helper
```swift
///  Helper协议
public protocol GRHelper {
    var navigationController: UINavigationController? {get}
    var topViewController: UIViewController? {get}
}
```

有时候因为项目的个性化默认的Helper满足不了需求，这是可以自定义Helper类实现GRHelper协议
然后通过
```swift
/// 注入自己的Helper类
GTMRouter.setHelper(yourHelper)
```
## 网页跳转
```swift
/// 需要自定义自己的webViewController的工厂类（实现WebVCFactory）
///  WebVCFactory协议
public protocol WebVCFactory {
    func createWebVC(with urlString: String) -> UIViewController
}

/// 然后调用func setWebVCFactory(factory: WebVCFactory)方法将工厂类注入
/// 如果要支持http的url需要设置WebViewController的工厂类
///
/// - Parameters:
/// - factory: 用来生成Web容器控制器的工厂类（需要实现WebVCFactory协议）
public func setWebVCFactory(factory: WebVCFactory) {
    Router.shared.webVCFactory = factory
}
```

## 参数实例变量必须用@objc修饰
因为苹果在Swift 4 中苹果修改了自动添加 @objc 的逻辑：一个继承 NSObject 的 swift 类不再默认给所有函数添加 @objc。只在实现 OC 接口和重写 OC 方法时才自动给函数添加 @objc 标识。

#缺点与不足
参数不支持一些类型：Optional<Int>, Optional<Float>, Optional<Double>, Optional<Bool>
因为是使用的oc的setValue(val, forKey: key)方式来设置属性值的

*如果您有好的改进方式，麻烦赐教*



#参与开源
欢迎提交 issue 和 PR，大门永远向所有人敞开。

#开源协议
本项目遵循 MIT 协议开源，具体请查看根目录下的 [LICENSE](https://raw.githubusercontent.com/GTMYang/GTMRouter/master/LICENSE) 文件。


