//
//  ViewControllerWithoutCLTests.swift
//  ViewControllerTests
//
//  Created by ichi on 2019/05/22.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import XCTest

@testable import ViewController

class ViewControllerWithoutCLTests: XCTestCase {
    
    var sut: ViewControllerWithoutCL!
    var locationProvider: UserLocationProviderMock!
    
    override func setUp() {
        super.setUp()
        locationProvider = UserLocationProviderMock()
        sut = ViewControllerWithoutCL(locationProvider: locationProvider)
    }
    
    override func tearDown() {
        sut = nil
        locationProvider = nil
        super.tearDown()
    }
    
    func testRequestUserLocation_NotAuthorized_ShouldFail() {
        // Given
        locationProvider.locationBlockLocationValue = UserLocationMock()
        locationProvider.locationBlockErrorValue    = UserLocationError.canNotBeLocated
        
        // When
        sut.requestUserLocation()
        
        // Then
        XCTAssertNil(sut.userLocation)
    }
    
    func testRequestUserLocation_Authorized_ShouldReturnUserLocation() {
        // Given
        locationProvider.locationBlockLocationValue = UserLocationMock()
        
        // When
        sut.requestUserLocation()
        
        // Then
        XCTAssertNotNil(sut.userLocation)
    }
}
