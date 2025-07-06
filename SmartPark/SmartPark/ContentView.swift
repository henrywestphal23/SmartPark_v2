//
//  ContentView.swift
//  SmartPark
//
//  Created by Henry Westphal on 7/4/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = LocationManager.shared
    @State private var selectedMapOption: MapOptions = .standard
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $position) {
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
                
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
            }
            .mapStyle(selectedMapOption.mapStyle)
            .onChange(of: locationManager.region) {
                withAnimation {
                    position = .region(locationManager.region)
                }
            }
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }.pickerStyle(.segmented)
            .background(.white)
            .padding([.top], 60)
            
            
        }

    }
}

#Preview {
    ContentView()
}
