//
//  JObj.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 08.01.20.
//  Copyright © 2020 Michael Irimus. All rights reserved.
//

import Foundation

struct JObjElement: Codable, Identifiable {
    let id: Int
    let name: String
    let cancel: Int
    let info, props: String
    let locID: Int
    let orgID: String
    let jObjRepeat: Int
    let zeit: String
    let dauer: Int
    let von, bis, loc, strasse: String
    let plz: String
    let ort: Ort
    let lat, lon: Int

    enum CodingKeys: String, CodingKey {
        case id, name, cancel, info, props
        case locID = "locId"
        case orgID = "orgId"
        case jObjRepeat = "repeat"
        case zeit, dauer, von, bis, loc, strasse, plz, ort, lat, lon
    }
}

enum Ort: String, Codable {
    case vösendorf = "Vösendorf"
    case wien = "Wien"
}

typealias JObj = [JObjElement]
