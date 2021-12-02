//
//  ContentView.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/18/21.
//

import SwiftUI
import MapKit

struct ScripturesMappedView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.778389,
                                       longitude: 35.234736),
        span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
    var body: some View {
        NavigationView{
            VolumesView()
                .navigationBarTitle("Scriptures")
            Map(coordinateRegion: $region)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScripturesMappedView()
    }
}
