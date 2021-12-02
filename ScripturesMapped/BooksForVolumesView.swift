//
//  BooksForVolumesView.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/30/21.
//

import SwiftUI

struct BooksForVolumesView: View {
    var volumeId: Int
    var volumeName: String
    
    var body: some View {
        List {
            ForEach (GeoDatabase.shared.booksForParentId(volumeId)) { book in
                NavigationLink(book.fullName) {
                    if let numChapters = book.numChapters, numChapters > 1 {
                        ChapterGridView(book: book)
                    }
                    else {
                        ChapterContentView(viewModel: GeoCodeViewModel(), book: book, chapter: book.numChapters == nil ? 0 : 1) // e.g. Enos, WoM. Goes straight to text
                    }
                }
                .isDetailLink(false)
            }
        }
        .listStyle(.plain)
        .navigationBarTitle(volumeName)
    }
}

struct BooksForVolumesView_Previews: PreviewProvider {
    static var previews: some View {
        BooksForVolumesView(volumeId: 1, volumeName: "Old Testament")
    }
}
