//
//  UserLocationProvider.swift
//  ViewController
//
//  Created by ichi on 2019/05/20.
//  Copyright © 2019 Rhizome Inc. All rights reserved.
//

import Foundation

enum UserLocationError: Swift.Error {
    case canNotBeLocated
}

typealias UserLocationCompletionBlock = (UserLocation?, UserLocationError?) -> Void

/// A protocol that provides the user's location when requested it.
/// Whoever conforms this protocol could be the provider.
/// This protocol specifies a method to request the user’s location and the result will be through the callbacks.
protocol UserLocationProvider {
    func findUserLocation(then: @escaping UserLocationCompletionBlock)
}

