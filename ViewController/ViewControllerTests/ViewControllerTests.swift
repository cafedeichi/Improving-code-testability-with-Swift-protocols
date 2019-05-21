//
//  ViewControllerTests.swift
//  ViewControllerTests
//
//  Created by ichi on 2019/05/20.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import XCTest
import CoreLocation

@testable import ViewController

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController(locationProvider: CLLocationManager())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    /// Here the problems begin to appear… CLLocationManager manages the request and it is not a synchronous process, so when we check the stored location is still nil. Also, we may not have authorization to request the location, in this case, the location will also be nil.
    func testRequestUserLocation() {
        sut.requestUserLocation()
        XCTAssertNotNil(sut.userLocation)
    }
    
}
