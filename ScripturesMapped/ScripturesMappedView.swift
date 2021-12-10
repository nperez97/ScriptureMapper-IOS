//
//  ContentView.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/18/21.
//

import SwiftUI
import MapKit

struct ScripturesMappedView: View {
    
    @EnvironmentObject var viewModel: GeoCodeViewModel
    
    
    var body: some View {
        NavigationView{
            VolumesView()
            MapView(region: viewModel.region)
                    .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScripturesMappedView().environmentObject(GeoCodeViewModel())
    }
}
