//
//  ViewControllerWithoutCL.swift
//  ViewController
//
//  Created by ichi on 2019/05/22.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import UIKit

/// Before to start with the tests, let’s see how our ViewController looks like using UserLocationProvider instead of CLLocationManager. Looking this code, we conclude that now, our ViewController, has less code, fewer responsibilities and is more testable.
class ViewControllerWithoutCL: UIViewController {
    
    var locationProvider: UserLocationProvider?
    var userLocation: UserLocation?
    
    init(locationProvider: UserLocationProvider) {
        self.locationProvider = locationProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func requestUserLocation() {
        locationProvider?.findUserLocation { [weak self] location, error in
            if error == nil {
                self?.userLocation = location
            } else {
                print("User can not be located 😔")
            }
        }
    }
}
