//
//  Result.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 08.01.20.
//  Copyright © 2020 Michael Irimus. All rights reserved.
//

import Foundation

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APPError)
}
