//
//  LocationManager.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 8.09.22.
//

import Foundation
import CoreLocation
import MapKit

/*
 1. In that case we are using LocationManagerProtocol for binding between the LocationManager and the Controller that we use it.
 2. Applying class abstraction by a protocol LocationManagerProtocol here.
 3. Encapsulation of all data that have to be private.
 4. The main purpose of that class (to be separated) was to be reusable.
 commented by: Dimitar
 */


protocol LocationManagerProtocol {
    func centralViewBasedOnGivenLocation(latitude:Double, longitude:Double) -> MKCoordinateRegion
}

class LocationManager: NSObject {
    
    internal var didUpdateLocations:((MKCoordinateRegion) -> ())?
    private let locationManager = CLLocationManager()
    private let distanceMetres:CLLocationDistance = 15000
    
    
    internal func checkLocationService(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
    }
    
    internal func centralViewBasedOnGivenLocation(latitude:Double, longitude:Double) -> MKCoordinateRegion {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: distanceMetres, longitudinalMeters: distanceMetres)
        return region
    }
    
    private func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization(){
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break //Do something...
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break //Do something...
        case .authorizedAlways:
            break //Do something...
        default:
            break
        }
    }
}



extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let region = self.centralViewBasedOnGivenLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        didUpdateLocations?(region)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
