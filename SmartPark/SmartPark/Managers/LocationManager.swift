//
//  LocationManager.swift
//  SmartPark
//
//  Created by Henry Westphal on 7/4/25.
//
import SwiftUI
import MapKit
import Observation

@Observable class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    var region: MKCoordinateRegion = MKCoordinateRegion()
    
    override init() {
        super.init()
        self.manager.delegate = self
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
            self.manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
    }
}
