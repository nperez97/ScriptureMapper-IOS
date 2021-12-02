//
//  ChapterContentView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import SwiftUI

struct ChapterContentView: View {
    
    var viewModel: GeoCodeViewModel
    var book: Book
    var chapter: Int
    
    private var html: String {
        ScriptureRenderer.shared.htmlForBookId(book.id, chapter: chapter)
    }
    
    var body: some View {
        WebView(html: html, request: nil)
            .navigationBarTitle(title())
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private func title() -> String {
        if chapter > 0 {
            return "\(book.fullName) \(chapter)"
        } else {
            return book.fullName
        }
    }
}

struct ChapterContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChapterContentView(
                viewModel: GeoCodeViewModel(),
                book: GeoDatabase.shared.bookForId(201),
                chapter: 0
            )
        }
    }
}
