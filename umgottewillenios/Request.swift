//
//  Request.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 08.01.20.
//  Copyright © 2020 Michael Irimus. All rights reserved.
//

import Foundation

func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
    
    let dataURL = URL(string: url)!
    let session = URLSession.shared
    let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
    
    let task = session.dataTask(with: request, completionHandler: { data, response, error in
        
        guard error == nil else {
            completion(Result.failure(APPError.networkError(error!)))
            return
        }
        
        guard let data = data else {
            completion(Result.failure(APPError.dataNotFound))
            return
        }
        
        do {
            //create decodable object from received data
            let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
            //jsonResponse = (decodedObject as! JObj)
            completion(Result.success(decodedObject))
        } catch let error {
            print("error in decoding")
            completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
        }
    })
    
    task.resume()
}
