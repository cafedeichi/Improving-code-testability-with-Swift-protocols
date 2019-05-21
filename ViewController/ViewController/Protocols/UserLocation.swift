//
//  UserLocation.swift
//  ViewController
//
//  Created by ichi on 2019/05/20.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import Foundation
import CoreLocation

typealias Coordinate = CLLocationCoordinate2D

/// A protocol with only the variables or functions to abstract CLLocation.
protocol UserLocation {
    var coordinate: Coordinate { get }
}

extension CLLocation: UserLocation { }
