//
//  WebView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import SwiftUI
import MapKit
import WebKit

struct WebView: UIViewRepresentable {
    
    let html: String?
    let request: URLRequest?
    
    private let coordinator = Coordinator()
    
    // int is our geoplace id. escaping lets compiler know it needs longer life
    func injectNavigationHandler(_ handler: @escaping (Int) -> Void) -> some View {
        coordinator.navigationHandler = handler
        
        return self
    }
    
    func makeCoordinator() -> Coordinator {
        coordinator
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = coordinator
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let html = html {
            uiView.loadHTMLString(html, baseURL: nil)
        } else if let request = request {
            uiView.load(request)
        }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var navigationHandler: ((Int) -> Void)? = nil
        
        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            if let url = navigationAction.request.url, url.absoluteString.starts(with: WebView.placeUrl) {
                let geoPlaceId = Int(url.absoluteString.substring(fromOffset: WebView.placeUrl.count)) ?? 0
                
                if let handler = navigationHandler {
                    handler(geoPlaceId)
                }
                                     
                decisionHandler(.cancel)
                return
            }
                                     
            decisionHandler(.allow)
        }
    }
    
    static let placeUrl = "https://scriptures.byu.edu/mapscrip/"
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(html: nil, request: URLRequest(url: URL(string: "https://www.byu.edu")!))
    }
}
