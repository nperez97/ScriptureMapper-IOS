//
//  MapOpenView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/6/21.
//

import SwiftUI

struct MapOpenView: View {
    @EnvironmentObject var viewModel: GeoCodeViewModel
        
    var bookName: String
    var chapter: Int
    var onDismiss: () -> ()
    
    var body: some View {
        NavigationView {
            MapView(region: viewModel.region)
                .navigationTitle("\(bookName) \(chapter)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            onDismiss()
                        }, label: {
                            Text("Close")
                        })
                    }
                }
        }
    }
}
