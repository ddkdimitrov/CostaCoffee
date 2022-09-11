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
    internal var locationManager:LocationManager!
    internal var mapStoresViewModel:MapStoresViewModelProtocol!
    
    deinit {
        print("MapStoresViewController Deinitialization")
    }
}



//MARK: Life cycle methods
extension MapStoresViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Stores locations"
        
        //Authorization
        locationManager.checkLocationService()
        
        //Set default map region
        setDefaultMapRegion()
        
        //Adding Stores objects on the map
        if let stores = mapStoresViewModel.stores {
            createAnnotationsLocations(stores: stores)
        }
        
        didUpdateLocations()
    }
}



//Setup Map region and Annotations objects
extension MapStoresViewController {
    //Set All Stores for the given City
    private func createAnnotationsLocations(stores:[Store]){
        stores.forEach { store in
            let annotation = MKPointAnnotation()
            annotation.title = store.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: store.latitude.toDouble(),
                                                           longitude: store.longitude.toDouble())
            mapView.addAnnotation(annotation)
        }
    }
    
    /*
     Set new user region after updating the User location
     Using closure for binding between the LocationManager and the ViewController
     */
    private func didUpdateLocations(){
        locationManager.didUpdateLocations = { [weak self] region in
            //Im not using it for the example
            //self?.mapView.setRegion(region, animated: true)
        }
    }
    
    //Set default map region
    private func setDefaultMapRegion(){
        let region = locationManager.centralViewBasedOnGivenLocation(latitude: mapStoresViewModel.defaultCenteredLocation.latitude,
                                                                     longitude: mapStoresViewModel.defaultCenteredLocation.longitude)
        mapView.setRegion(region, animated: true)
    }
}
