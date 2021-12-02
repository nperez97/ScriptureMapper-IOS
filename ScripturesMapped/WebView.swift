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
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let html = html {
            uiView.loadHTMLString(html, baseURL: nil)
        } else if let request = request {
            uiView.load(request)
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(html: nil, request: URLRequest(url: URL(string: "https://www.byu.edu")!))
    }
}
