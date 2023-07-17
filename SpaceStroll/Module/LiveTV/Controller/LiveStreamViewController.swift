//
//  LiveStreamViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 5.07.2023.
//

import UIKit
import WebKit

final class LiveStreamViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var webView1: WKWebView!
    @IBOutlet fileprivate weak var webView2: WKWebView!
    @IBOutlet fileprivate weak var webView4: WKWebView!
    @IBOutlet fileprivate weak var webView3: WKWebView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Live Stream"
        
        registerWebView1()
        registerWebView2()
        registerWebView3()
        registerWebView4()
    }
    
    // MARK: - RegisterWebView

    // WebView1
    private func registerWebView1() {
        let url = URL(string: "https://www.youtube.com/embed/4_OT4xFrjmM?loop=1&playlist=4_OT4xFrjmM")!
        let request = URLRequest(url: url)
        webView1.load(request)
    }
    
    // WebView2

    private func registerWebView2() {
        let url = URL(string: "https://www.youtube.com/embed/21X5lGlDOfg?loop=1&playlist=21X5lGlDOfg")!
        let request = URLRequest(url: url)
        webView2.load(request)
    }
 
    // WebView3

    private func registerWebView3() {
        let url = URL(string: "https://www.youtube.com/embed/nkUFDgc7loE?loop=1&playlist=nkUFDgc7loE")!
        let request = URLRequest(url: url)
        webView3.load(request)
    }
    
    // WebView4

    private func registerWebView4() {
        let url = URL(string: "https://www.youtube.com/embed/mhJRzQsLZGg?loop=1&playlist=mhJRzQsLZGg")!
        let request = URLRequest(url: url)
        webView4.load(request)
    }
}
