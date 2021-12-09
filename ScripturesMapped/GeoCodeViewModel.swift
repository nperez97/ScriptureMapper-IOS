//
//  ViewModel.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import Foundation

class GeoCodeViewModel: ObservableObject, GeoPlaceCollector {
    
    @Published var geoPlaces = [GeoPlace]()
    @Published var isDetailViewVisible = false
    
    init() {
        //ScriptureRenderer.shared.injectGeoPlaceCollector(self)
    }
    
    func setGeocodedPlaces(_ places: [GeoPlace]?) {
        var newPlaces = [GeoPlace]() // new empty array of unique places
        let delta = 0.00000001
        
        
        if let places = places {
            // TODO: only copy over the unique geoplaces
            geoPlaces = places
        }
        
        geoPlaces.forEach{ place in
            
            //compare latitdues and longititude. check if two pins are super close to each other
            if let index = newPlaces.firstIndex(where: { abs($0.latitude - place.latitude) < delta && abs($0.longitude - place.longitude) < delta }) {
                // if place already added, then add new name
                if !newPlaces[index].placename.contains(place.placename) {
                    newPlaces[index].placename.append(", \(place.placename)")
                }
            } else {
                newPlaces.append(place)
            }
        }
        
        geoPlaces = newPlaces
    }
    
    func setCurrentGeoPlace(placeId: Int) {
        //TODO
    }
    
    func setRegion(geoPlaces: [GeoPlace]) {
        //TODO
    }
    
    
}

// SEE VIDEO FOR PSEUDO CODE -- 2:17 mark -- Place pins on map
