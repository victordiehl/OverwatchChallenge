//
//  Player.swift
//  OverwatchChallenge
//
//  Created by Raphael Braun on 10/11/2017.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

struct PlayerStats: Decodable {
    var us: Continent?
    var eu: Continent?
    var kr: Continent?
}

struct Continent: Decodable {
    var stats: GameMode
}

struct GameMode: Decodable {
    var competitive: Game
    var quickplay: Game
}

struct Game: Decodable {
    var overall_stats: OverallStats
    var game_stats: GameStats
    var competitive: Bool
}

struct OverallStats: Decodable {
    var avatar: String
    var ties: Int?
    var wins: Int?
    var tier: String?
    var rank_image: String?
    var level: Int?
    var comprank: Int?
    var losses: Int?
    var games: Int?
    var win_rate: Double?
    var prestige: Int?
}

struct GameStats: Decodable {
    var multikills: Int?
    var medals_bronze: Int?
    var objective_kills: Int?
    var time_played: Double?
    var games_played: Int?
    var games_lost: Int?
    var final_blows: Int?
    var offensive_assists: Int?
    var games_won: Int?
    var eliminations: Int?
    var medals_gold: Int?
    var solo_kills: Int?
    var kill_streak_best: Int?
    var medals_silver: Int?
    var deaths: Int?
    var kpd: Double?
    var multikill_best: Int?
    var medals: Int?
}
