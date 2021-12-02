//
//  ChapterGridView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import SwiftUI

struct ChapterGridView: View {
    var book: Book
    
    var body: some View {
        //TODO: -- Use geometry reader
        ScrollView {
            LazyVGrid(columns: Array(
                                    repeating: GridItem(.flexible(), spacing: 8),
                                    count: 6
                                ),
                      spacing: 8) {
                ForEach(1...(book.numChapters ?? 0), id: \.self) { chapter in
                    NavigationLink("\(chapter)") {
                        ChapterContentView()
                    }
                    .isDetailLink(false)
                }
            }
        }
    }
}

//struct ChapterGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChapterGridView(book: "Old")
//    }
//}
