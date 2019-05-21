//
//  LocationProvider.swift
//  ViewController
//
//  Created by ichi on 2019/05/20.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import Foundation
import CoreLocation

/// A protocol to specify what is a location provider.
protocol LocationProvider {
    var isUserAuthorized: Bool { get }
    func requestWhenInUseAuthorization()
    func requestLocation()
}

extension CLLocationManager: LocationProvider {
    var isUserAuthorized: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}
