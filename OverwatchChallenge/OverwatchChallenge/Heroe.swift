//
//  Heroe.swift
//  OverwatchChallenge
//
//  Created by victordiehl on 16/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import Foundation
import UIKit

struct HeroeStats: Decodable {
    var us: HeroeContinent?
    var eu: HeroeContinent?
    var kr: HeroeContinent?
}

struct HeroeContinent: Decodable {
    var heroes: Heroes
}

struct Heroes: Decodable {
    var playtime: HeroeGameMode
}

struct HeroeGameMode: Decodable {
    var quickplay: HeroList
    var competitive: HeroList

}

struct HeroList: Decodable {
    var junkrat: Double?
    var reaper: Double?
    var orisa: Double?
    var roadhog: Double?
    var mccree: Double?
    var torbjorn: Double?
    var bastion: Double?
    var sombra: Double?
    var zenyatta: Double?
    var hanzo: Double?
    var reinhardt: Double?
    var zarya: Double?
    var mei: Double?
    var genji: Double?
    var winston: Double?
    var soldier76: Double?
    var mercy: Double?
    var pharah: Double?
    var ana: Double?
    var lucio: Double?
    var doomfist: Double?
    var tracer: Double?
    var dva: Double?
    var symmetra: Double?
    var widowmaker: Double?
}
