//
//  WebViewController.swift
//  GTMRouterExample
//
//  Created by 骆扬 on 2018/6/26.
//  Copyright © 2018年 luoyang. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
       public var isTreatMemeryCrushWithReload = false
    
    var urlString: String?
    private var webUrl: URL? {
        return urlString?.url()
    }
    public var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupWkWebView()
        loadWebPage()
    }

    
    func setupWkWebView() {
        
        // init weakScriptHandler
        let configuration = WKWebViewConfiguration()    // 配置
        configuration.processPool = WKProcessPool() // WkWebView 实例间共享Cookies
        configuration.preferences.minimumFontSize = 10
        configuration.preferences.javaScriptEnabled = true
        configuration.allowsInlineMediaPlayback = true  // 允许视频播放回退
        configuration.userContentController = WKUserContentController()     // 交互对象
     //   configuration.userContentController.add(self.weakScriptHandler, name: "GTMWebKitAPI")
        let wkWebV = WKWebView(frame: .zero, configuration: configuration)     // WKWebView
       // wkWebV.uiDelegate = self
        wkWebV.navigationDelegate = self
        wkWebV.allowsBackForwardNavigationGestures = true
        self.view.addSubview(wkWebV)
      //  wkWebV.frame = self.view.bounds//CGRect(x: 0, y: 0, width: 320, height: 640)
        self.webView = wkWebV
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.webView?.frame = self.view.bounds
    }
    
    
    
    // MARK: - Private
    func loadWebPage() {
        guard let url = self.webUrl else {
            fatalError("GTMWebKit ----->没有为GTMWebViewController提供网页的URL")
        }
        
        self.loadWithUrl(url: url)
    }
    
    func loadWithUrl(url: URL) {
        self.webView?.load(URLRequest.init(url: url))
    }

    
    
    // MARK: - WKNavigationDelegate
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    // MARK: Initiating the Navigation
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // MARK: Responding to Server Actions
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
        print(navigation.description)
    }
    // Authentication Challenges
    public func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        var disposition: URLSession.AuthChallengeDisposition = URLSession.AuthChallengeDisposition.performDefaultHandling
        var credential: URLCredential?
        
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            disposition = URLSession.AuthChallengeDisposition.useCredential
            credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        }
        
        completionHandler(disposition, credential)
    }
    // MARK: Tracking Load Progress
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("GTMWebKit ----->webView didFinish")
     
    }
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        // 如果出现频繁刷新的情况，说明页面占用内存确实过大，需要前端作优化处理
        if self.isTreatMemeryCrushWithReload {
            webView.reload() // 解决内存消耗过度出现白屏的问题
        }
    }
    // MARK: Permitting Navigation
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
    
        
        //        self.updateButtonItems() // 更新导航按钮状态
        decisionHandler(.allow)
    }
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        print("GTMWebKit ----->decidePolicyFor navigationResponse")
        decisionHandler(.allow)
    }
    // MARK: Reacting to Errors
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        let nserror = error as NSError
        if nserror.code == NSURLErrorCancelled {
            return
        }
    }
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let nserror = error as NSError
        if nserror.code == NSURLErrorCancelled {
            return
        }
    }
}

public protocol URLConvertible {
    func url() -> URL?
}

extension String: URLConvertible {
    public func url() -> URL? {
        return URL.init(string: self)
    }
}

extension URL: URLConvertible {
    public func url() -> URL? {
        return self
    }
}

