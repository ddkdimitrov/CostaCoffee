//
//  MapStoresViewModel.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 8.09.22.
//

import Foundation

/*
 1. Preferable using the ViewModel protocol inside the same file to be more clear
 2. With MapStoriesViewModelProtocol im doing abstraction that helps to the client to know which basic methods should use.
 3. Making encapsulation of the others methods/properties that the client hasn`t have an access
 - In this demo  version point 3/2 are not too much requirement but the demo project is created by following the good practices
 commented by: Dimitar
 */

protocol MapStoresViewModelProtocol {
    var defaultCenteredLocation: (latitude:Double, longitude: Double) {get}
    var stores:[Store]? {get}
}

class MapStoresViewModel: MapStoresViewModelProtocol {
    
    internal var defaultCenteredLocation = (latitude:51.509865, longitude: -0.118092)
    internal var stores:[Store]? {
        if let stores = city.stores, stores.count > 0 {
            return stores
        }
        return nil
    }
    
    private var city:City
    
    init(city:City){
        self.city = city
        let centeredLocation = getCenteredLocationData()
        defaultCenteredLocation = (centeredLocation.latitude, centeredLocation.longitude)
    }
    
    private func getCenteredLocationData() -> (latitude:Double, longitude: Double){
        if let stores = self.stores {
            let latitude = stores[0].latitude.toDouble()
            let longitude = stores[0].longitude.toDouble()
            return (latitude, longitude)
        }
        return (latitude:51.509865, longitude: -0.118092)
    }
}
