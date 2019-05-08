//
//  Aviatrix.swift
//  AviatrixApp
//
//  Edited by Zach Howarth on 5/8/2019.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    var author : String
    var currentLocation = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    
    init(authorName : String) {
        author = authorName
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        
        fuelLevel = 5000.0
        
        return gallonsNeeded
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(target: destination, current: currentLocation)
        let fuelUsed = Double(distanceTraveled) / milesPerGallon
        fuelLevel -= fuelUsed
        currentLocation = destination
    }
    
    func distanceTo(target : String, current : String) -> Int {
        let data = AviatrixData()
        return data.knownDistances[current]![target]!
    }
    
    func knownDestinations() -> [String] {
        let data = AviatrixData()
        return Array(data.knownDistances.keys)
    }
}
