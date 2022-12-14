//
//  CitiesViewModel.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 8.09.22.
//

import Foundation

/*
 1. Preferable using the ViewModel protocol inside the same file to be more clear
 2. With CitiesViewModelAbstractionProtocol im doing abstraction that helps to the client to know which basic methods should use.
 3. Making encapsulation of the others methods/properties that the client hasn`t have an access
 - In this demo  version point 3/2 are not too much requirement but the demo project is created by following the good practices
 commented by: Dimitar
 */
protocol CitiesViewModelAbstractionProtocol {
    func getStores() async
    var cities:[City] {get}
}

class CitiesViewModel: CitiesViewModelAbstractionProtocol {
    
    var cities:[City]
    var apiErrorHandler: ((ApiErrorManager.Errors) -> ())?
    private let storesApiInst = ApiClient.StoreOperation.inst
    
    init(cities:[City]) {
        self.cities = cities
    }
    
    internal func getStores() async {
        do {
            let cities = try await storesApiInst.getStoresByCities()
            self.cities = cities
            
        }catch (let apiError){
            guard let customErr = apiError as? ApiErrorManager.Errors else { return }
            apiErrorHandler?(customErr)
        }
    }
}
