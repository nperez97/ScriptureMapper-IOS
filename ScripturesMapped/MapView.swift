//
//  MapView.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/6/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var viewModel: GeoCodeViewModel
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State var region: MKCoordinateRegion
    
    //region if compact //viewmodel.region if not
    var body: some View {
        Map(coordinateRegion: viewModel.isDetailViewVisible ? $viewModel.region : $region,
            annotationItems: viewModel.geoPlaces) { geoPlace in
                MapAnnotation(
                    coordinate: geoPlace.coordinate,
                    anchorPoint: CGPoint(x: 0.5, y: 1)) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color(red: 0.7, green: 0.1, blue: 0.1))
                        //.shadow(radius: 2, x: 1, y: 1)
                    Text("\(geoPlace.placename)")
                        .background(.white)
            }
        }
        // TODO: - Finish making this work
        .edgesIgnoringSafeArea(.all)
        .onChange(of: horizontalSizeClass) { newSizeClass in
            viewModel.isDetailViewVisible = newSizeClass == .regular
            print("Ipad or max?: \(viewModel.isDetailViewVisible)")
        }
        .onAppear {
            // checks if ipad or max phone. if so, true
            viewModel.isDetailViewVisible = horizontalSizeClass == .regular
            print("Detail view Visible \(viewModel.isDetailViewVisible)")
        }
    }
    
}

