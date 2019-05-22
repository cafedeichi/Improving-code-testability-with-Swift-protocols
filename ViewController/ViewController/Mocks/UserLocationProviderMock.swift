//
//  UserLocationProviderMock.swift
//  ViewControllerTests
//
//  Created by ichi on 2019/05/22.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import UIKit

struct UserLocationMock: UserLocation {
    var coordinate: Coordinate {
        return Coordinate(latitude: 51.509865, longitude: -0.118092)
    }
}

/// Using these mocks, who we can inject whatever results we need, we will simulate how an UserLocationProvider works. So we will put focus in our real target, the ViewController.
class UserLocationProviderMock: UserLocationProvider {
    
    var locationBlockLocationValue: UserLocation?
    var locationBlockErrorValue: UserLocationError?
    
    func findUserLocation(then: @escaping UserLocationCompletionBlock) {
        then(locationBlockLocationValue, locationBlockErrorValue)
    }
}
