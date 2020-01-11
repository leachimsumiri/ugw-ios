//
//  UIViewController.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 08.01.20.
//  Copyright © 2020 Michael Irimus. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = globalLoc!
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        let newPin=MKPointAnnotation()
        newPin.coordinate = coordinate
        view.addAnnotation(newPin)
        
        for object in objects{
            let currCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(object.lat)/1000000), longitude: CLLocationDegrees(Double(object.lon)/1000000))
            let pin=MKPointAnnotation()
            pin.coordinate = currCoordinate
            view.addAnnotation(pin)
        }
    }
}

struct MapView_Preview: PreviewProvider {    
    static var previews: some View {
        MapView()
    }
}
