//
//  ChapterContentView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import SwiftUI

struct ChapterContentView: View {
    
    @EnvironmentObject var viewModel: GeoCodeViewModel
    @State private var showMap = false
    
    var book: Book
    var chapter: Int
    private var html: String 
    
    init(book: Book, chapter: Int) {
        self.book = book
        self.chapter = chapter
        
        html = ScriptureRenderer.shared.htmlForBookId(book.id, chapter: chapter)
    }
    
    var body: some View {
        WebView(html: html, request: nil)
            .injectNavigationHandler { geoPlaceId in
                showMap = true
                print("User Selected \(geoPlaceId)")
                viewModel.setCurrentGeoPlace(placeId: geoPlaceId)
                viewModel.setRegion(geoPlaces: viewModel.currentGeoPlaces)
            }
            .navigationBarTitle(title())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Group {
                    if !viewModel.isDetailViewVisible {
                        Button(action: {
                            showMap = true
                        }, label: {
                            Image(systemName: "map")
                        })
                    }
                }
            )
            .onAppear {
                viewModel.setGeocodedPlaces(ScriptureRenderer.shared.geoPlaces(for: book, chapter: chapter))
                viewModel.setRegion(geoPlaces: viewModel.geoPlaces)
            }
            .sheet(isPresented: $showMap) {
                MapOpenView(bookName: book.fullName, chapter: chapter, onDismiss: {
                    showMap = false
                })
                    .onAppear {
                        viewModel.setRegion(geoPlaces: viewModel.geoPlaces)
                    }
                    .edgesIgnoringSafeArea(.bottom)
            }
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
        //NavigationView{
            ChapterContentView(
                book: GeoDatabase.shared.bookForId(106),
                chapter: 10
            )
        //}
    }
}
