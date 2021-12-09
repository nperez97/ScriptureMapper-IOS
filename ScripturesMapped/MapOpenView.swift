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
                .navigationBarTitle("\(bookName) \(chapter)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            onDismiss()
                        }, label: {
                            Text("Close")
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.setRegion(geoPlaces: viewModel.geoPlaces)
                        }, label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        })
                    }
                }
            
            
            
            
//                .navigationBarItems(leading: Button(action: {
//                    onDismiss()
//                }, label: {
//                    Text("Close")
//                }), trailing: Button(action: {
//                    viewModel.setRegion(geoPlaces: viewModel.geoPlaces)
//                }, label: {
//                    Image(systemName: "arrow.triangle.2.circlepath")
//                }))
        }
    }
}
