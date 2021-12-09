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
                                    count: 5
                                ),
                      spacing: 8) {
                            ForEach(1...(book.numChapters ?? 0), id: \.self) { chapter in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 6)
                                        .foregroundColor(.brown)
                                        .shadow(radius: 2, x: 1, y: 1)
                                    NavigationLink("\(chapter)") {
                                        ChapterContentView(book: book, chapter: chapter)
                                    }
                                    .isDetailLink(false)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.black)
                                }
                            }
                    }
        }
        .navigationTitle("\(book.fullName)")
    }
}

//struct ChapterGridView_Previews: PreviewProvider {
//    var book: Book
//
//    static var previews: some View {
//        ChapterGridView(book: book)
//    }
//}
