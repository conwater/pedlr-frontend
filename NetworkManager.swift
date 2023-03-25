//
//  NetworkManager.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct Bike: Codable {
    let bike_id: String
    let set_unlock: Bool
    let is_unlock: Bool
    let set_alarm: Bool
    let is_alarm: Bool
    let GPS: [Double]
}

class NetworkManager {
    static let instance = NetworkManager()
    
    let bike_id = "ur_mom"
    
    func getData() async throws -> Bike {
        // sets the URL
        guard let url = URL(string: "http://100.67.15.206:8080/" + bike_id + "/info")
        else {
            throw ErrorHandler.badURL
        }
        
        // makes the GET request and decodes
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let bike = try JSONDecoder().decode(Bike.self, from: data)
            return bike
        }
        catch {
            throw ErrorHandler.badServerResponse
        }
    }
    
    func postData(set: String, to: Bool) async throws {
        // post data to "unlock" or "alarm"
        let body = ["set_" + set: to]

        // sets the URL
        guard let url = URL(string: "http://100.67.15.206:8080/" + bike_id + "/" + set)
        else {
            throw ErrorHandler.badURL
        }
        
        // formats the POST request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        // encodes
        do {
            request.httpBody = try JSONEncoder().encode(body)
        }
        catch {
            throw ErrorHandler.invalidRequest
        }
        
        // makes the POST request
        do {
            let (_) = try await URLSession.shared.data(for: request)
        }
        catch {
            throw ErrorHandler.badServerResponse
        }
    }
}
