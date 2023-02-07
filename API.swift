//
//  API.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/16/23.
//

import SwiftUI
import MapKit

struct Bike: Codable {
    let bike_id: String
    let set_unlocked: Bool
    let is_unlocked: Bool
    let set_alarm: Bool
    let is_alarm: Bool
    let GPS: [Double]
}

class API: ObservableObject {
    @Published var bike: Bike
    @Published var region: MKCoordinateRegion
    
    init() {
        self.bike = Bike(bike_id: "default", set_unlocked: false, is_unlocked: false, set_alarm: false, is_alarm: false, GPS: [0, 0])
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0,                                                                longitude: 0),
                                         latitudinalMeters: CLLocationDistance(1000),
                                         longitudinalMeters: CLLocationDistance(1000))
    }
    
    func getData() {
        let bike_id: String = "ur_mom"
        
        guard let url = URL(string: "http://100.67.15.206:8080/" + bike_id + "/info") else {
            print("ERROR: Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("ERROR: Invalid request (\(error.localizedDescription))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("ERROR: Invalid response")
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    print("ERROR: No data received")
                    return
                }
                
                DispatchQueue.main.async { [self] in
                    do {
                        let JSON = try JSONDecoder().decode(Bike.self, from: data)
                        self.bike = JSON
                        
                        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.bike.GPS[0],           longitude: self.bike.GPS[1]),
                                                         latitudinalMeters: CLLocationDistance(250),
                                                         longitudinalMeters: CLLocationDistance(250))
                    }
                    catch {
                        print("ERROR: Unable to decode data")
                    }
                }
            }
        }

        task.resume()
    }
    
    func postData() {
        let bike_id: String = "ur_mom"
        let body: [String: Bool] = ["set_unlocked": true] // this is hardcoded, fix later
        
        guard let url = URL(string: "http://100.67.15.206:8080/" + bike_id + "/lock") else {
            print("ERROR: Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        }
        catch {
            print("ERROR: Unable to encode data")
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("ERROR: Invalid request (\(error.localizedDescription))")
                return
            }
//            guard let response = response as? HTTPURLResponse else {
//                print("ERROR: Invalid response")
//                return
//            }
//
//            if response.statusCode == 200 {
//                guard let data = data else {
//                    print("ERROR: No data received")
//                    return
//                }
//
//                do {
//                    let response = try JSONDecoder().decode([String: Bool].self, from: data)
//                    print(response)
//                }
//                catch {
//                    print("ERROR: Unable to decode response")
//                }
//            }
        }
        
        task.resume()
    }
}
