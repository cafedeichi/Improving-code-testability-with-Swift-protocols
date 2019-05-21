//
//  UserLocationServices.swift
//  ViewController
//
//  Created by ichi on 2019/05/20.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import Foundation
import CoreLocation

/// UserLocationService has his location provider, but he will not know who he is, for him it does not matter, he  only needs the user’s location when he requests it, the rest is not his responsibility.
class UserLocationService: NSObject, UserLocationProvider {
    
    fileprivate var provider: LocationProvider
    fileprivate var locationCompletionBlock: UserLocationCompletionBlock?
    
    init(with provider: LocationProvider) {
        self.provider = provider
        super.init()
    }
    
    func findUserLocation(then: @escaping UserLocationCompletionBlock) {
        self.locationCompletionBlock = then
        if provider.isUserAuthorized {
            provider.requestLocation()
        } else {
            provider.requestWhenInUseAuthorization()
        }
    }
}

/// The extension to conform CLLocationManagerDelegate protocol, is needed because we are going to use CoreLocation. But how we will see in the tests, we don’t really need it to verify that our class works fine.
extension UserLocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            provider.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        if let location = locations.last {
            locationCompletionBlock?(location, nil)
        } else {
            locationCompletionBlock?(nil, .canNotBeLocated)
        }
    }
}
