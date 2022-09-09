//
//  MapStoresViewController.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 8.09.22.
//

import UIKit
import MapKit

/**
 1. Using locationManager service for authorization and User location.
 2. Using MapKit for displaying the Stores objects into the Map and setting the initial regions.
 */
class MapStoresViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    public var locationManager:LocationManager!
    public var mapStoresViewModel:MapStoresViewModelProtocol!
    
    deinit {
        print("MapStoresViewController Deinitialization")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Stores locations"
        locationManager.checkLocationService()
        let region = locationManager.centralViewBasedOnGivenLocation(latitude: mapStoresViewModel.defaultCenteredLocation.latitude,
                                                                     longitude: mapStoresViewModel.defaultCenteredLocation.longitude)
        
        mapView.setRegion(region, animated: true)
        
        if let stores = mapStoresViewModel.stores {
            createAnnotationsLocations(stores: stores)
        }
    }
    
    private func createAnnotationsLocations(stores:[Store]){
        stores.forEach { store in
            let annotation = MKPointAnnotation()
            annotation.title = store.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: store.latitude.toDouble(),
                                                           longitude: store.longitude.toDouble())
            mapView.addAnnotation(annotation)
        }
    }
}



extension MapStoresViewController: LocationManagerProtocol {
    func didUpdateLocations(region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
    }
}
