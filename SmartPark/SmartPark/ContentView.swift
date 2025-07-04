//
//  ContentView.swift
//  SmartPark
//
//  Created by Henry Westphal on 7/4/25.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static var coffee: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 37.3318, longitude: -121.8863)
    }
    static var oakland: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 37.8044, longitude: -122.2711)
    }
}

struct ContentView: View {
    var body: some View {
        Map {
            Annotation("Coffee", coordinate: .coffee) {
                Image(systemName: "cup.and.saucer.fill")
                    .padding(4)
                    .foregroundColor(.white)
                    .background(.indigo)
                    .cornerRadius(4.0)
            }
            
            Annotation("Oakland", coordinate: .oakland) {
                Image(systemName: "city.fill")
                    .padding(4)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(4.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
