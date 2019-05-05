//
//  TrailerAPI.swift
//  MovieTrailer-500782152
//
//  Created by Jasdeep on 04-05-19.
//  Copyright © 2019 Tanveer. All rights reserved.
//

import Foundation
import Alamofire

final class TrailerAPI {
    static var baseURL = "https://appstubs.triple-it.nl/"
    
    static func getTrailers() -> DataRequest {
        
        var parameters: [String: String] = [:]
        parameters["language"] = NSLocalizedString("Language", comment: "");
        return Alamofire.request(baseURL + "trailers", method: .get, parameters: parameters)
    }
}
