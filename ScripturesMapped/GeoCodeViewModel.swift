//
//  ViewModel.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import Foundation

class GeoCodeViewModel: ObservableObject, GeoPlaceCollector {
    
    @Published var geoPlaces = [GeoPlace]()
    
    init() {
        ScriptureRenderer.shared.injectGeoPlaceCollector(self)
    }
    
    func setGeocodedPlaces(_ places: [GeoPlace]?) {
        if let places = places {
            // TODO: only copy over the unique geoplaces
            geoPlaces = places
            
            geoPlaces.forEach{ place in
                print(place.placename)
            }
        }
    }
    
}

// SEE VIDEO FOR PSEUDO CODE -- 2:17 mark -- Place pins on map
