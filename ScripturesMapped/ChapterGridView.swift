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
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: ChapterConstants.spacing), count: ChapterConstants.count),
                spacing: ChapterConstants.spacing
            ){
                ForEach(1...(book.numChapters ?? 0), id: \.self) { chapter in
                    ZStack{
                        RoundedRectangle(cornerRadius: ChapterConstants.cornerRadius)
                            .foregroundColor(.brown)
                            .shadow(radius: ChapterConstants.radius, x: 1, y: 1)
                        NavigationLink("\(chapter)") {
                            ChapterContentView(book: book, chapter: chapter)
                        }
                        .isDetailLink(false)
                        .padding(.vertical, ChapterConstants.verticalPadding)
                        .foregroundColor(.black)
                    }
                }
             }
        }
        .navigationTitle("\(book.fullName)")
        .padding(.horizontal, ChapterConstants.horizontalPadding)
    }
    
    // MARK: - Constants
    private struct ChapterConstants {
        static let spacing: CGFloat = 8
        static let count: Int = 5
        static let cornerRadius: CGFloat = 6
        static let radius: CGFloat = 2
        static let verticalPadding: CGFloat = 10
        static let horizontalPadding: CGFloat = 4
    }
}
