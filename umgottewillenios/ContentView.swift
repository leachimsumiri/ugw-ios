//
//  ContentView.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 07.10.19.
//  Copyright © 2019 Michael Irimus. All rights reserved.
//

import SwiftUI
import Foundation
import CoreLocation
import MapKit

var compose = UIImage(named: "square.and.pencil")
var composeImageView = UIImageView(image: compose)

var objects : JObj = []

let globalLat : Int = 48157083;
let globalLon : Int = 16382141;

var globalLoc:CLLocationCoordinate2D! = CLLocationCoordinate2D(latitude: 48157083, longitude: 16382141)

weak var mainMap: MKMapView!

func apiCall() -> Void {
    
    let url = "http://37.221.194.244:8080/v1/api/schedule/gps/\(globalLat)/\(globalLon)"
    
    dataRequest(with: url, objectType: JObj.self) { (result: Result) in switch result {
         case .success(let obj):
            print(obj[0].id)
            print(obj)
            objects = obj
             //self.generateTableViewConnections2()
             DispatchQueue.main.async{
                // self.tableView.delegate = self
                 //self.tableView.dataSource = self
                 //self.tableView.reloadData()
         }
         case .failure(let error):
             print(error)
         }
     }
}

struct ListRow: View {
    var name: String
    var von: String
    var zeit: String
    var loc: String
    var dist: Int
    
    var body: some View {
        VStack(alignment: .leading) {
                   Text("\(name)")
                       .font(.headline)
                   HStack {
                       Text("\(von), \(zeit)")
                           .font(.subheadline)
                       Spacer()
                       Text("\(loc), \(dist)km")
                           .font(.subheadline)
                   }
               }
               .padding()
    }
}

func calcDistance(item:JObjElement) -> Double{
    let coordinateGlobal = CLLocation(latitude: Double(globalLat)/1000000, longitude: Double(globalLon)/1000000)
    let coordinateCurr = CLLocation(latitude: Double(item.lat)/1000000, longitude: Double(item.lon)/1000000)
    let distanceInMeters = coordinateGlobal.distance(from: coordinateCurr)//(from: coordinateCurr)
    return Double(distanceInMeters/1000).rounded()
}

struct ContentView2: View {
    var body: some View {
        return List(objects) { JObjElement in
            ListRow(name: JObjElement.name, von: JObjElement.von, zeit: JObjElement.zeit, loc: JObjElement.loc, dist: Int(calcDistance(item: JObjElement)))
        }
    }
}


struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(){
            ContentView2()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Events")
                    }
                }
                .tag(0)
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
