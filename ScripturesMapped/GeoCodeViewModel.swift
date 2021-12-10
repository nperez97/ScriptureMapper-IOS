//
//  ViewModel.swift
//  ScripturesMapped
//
//  Created by IS543 on 12/1/21.
//

import Foundation
import MapKit

class GeoCodeViewModel: ObservableObject, GeoPlaceCollector {
    
    @Published var geoPlaces = [GeoPlace]()
    @Published var isDetailViewVisible = false
    @Published var currentGeoPlaces = [GeoPlace]()
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.778389, longitude: 35.234736), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
    
    init() {
        //ScriptureRenderer.shared.injectGeoPlaceCollector(self)
    }
    
    func setGeocodedPlaces(_ places: [GeoPlace]?) {
        var newPlaces = [GeoPlace]() // new empty array of unique places
        let delta = 0.00000001
        
        
        if let places = places {
            
            geoPlaces = places
        }
        
        geoPlaces.forEach{ place in
            
            //compare latitudes and longitudes. check if two pins are super close to each other
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
        currentGeoPlaces = []
        
        if let place = GeoDatabase.shared.geoPlaceForId(placeId) {
            currentGeoPlaces.append(place)
        }
    }
    
    func setRegion(geoPlaces: [GeoPlace]) {
        if geoPlaces.count == 0 {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.778389, longitude: 35.234736), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
            
            print(region)
            
            return
        }
        
        
        let maxLng = (geoPlaces.max { $0.longitude < $1.longitude })?.longitude ?? 0
        let maxLat = (geoPlaces.max { $0.latitude < $1.latitude })?.latitude ?? 0
        let minLng = (geoPlaces.min { $0.longitude < $1.longitude })?.longitude ?? 0
        let minLat = (geoPlaces.min { $0.latitude < $1.latitude })?.latitude ?? 0
        
        var spanLong: Double {
            if geoPlaces.count < 2 {
                return 0.2
            }
            else {
                return abs(maxLng - minLng) * margin
            }
        }
                
        var spanLat: Double {
            if geoPlaces.count < 2 {
                return 0.2
            }
            else {
                return abs(maxLat - minLat) * margin
            }
        }
        
        
        let centerLong = (maxLng - minLng) / 2 + minLng
        let centerLat = (maxLat - minLat) / 2 + minLat
        let margin = 1.1
        
        //print(centerLat, centerLong)
        
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: centerLat, longitude: centerLong), span: MKCoordinateSpan(latitudeDelta: spanLat, longitudeDelta: spanLong))
        
        //print(region)
    }
    
    
}

