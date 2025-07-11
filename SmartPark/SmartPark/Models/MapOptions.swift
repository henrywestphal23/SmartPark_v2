//
//  MapOptions.swift
//  SmartPark
//
//  Created by Henry Westphal on 7/4/25.
//

import Foundation
import MapKit
import SwiftUI

enum MapOptions: String, Identifiable, CaseIterable {
    case standard
    case hybrid
    case imagery
    
    var id: String {
        self.rawValue
    }
    
    var mapStyle: MapStyle {
        switch self {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        }
    }
}
