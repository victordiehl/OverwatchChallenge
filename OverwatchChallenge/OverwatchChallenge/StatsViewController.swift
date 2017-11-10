//
//  StatsViewController.swift
//  OverwatchChallenge
//
//  Created by Raphael Braun on 10/11/2017.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var playerID: String = "zza-11231"
    var compStats = [String]()
    var quickStats = [String]()

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var comprankImage: UIImageView!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var prestigeLabel: UILabel!
    @IBOutlet weak var comprankLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let urlString = "https://owapi.net/api/v3/u/\(playerID)/stats"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            do {
                let result = try JSONDecoder().decode(Overwatch.self, from: data)
                DispatchQueue.main.async {

                    self.gamesWonLabel.text = result.us?.stats.competitive.game_stats.games_won?.description

                    self.downloadAvatarImageFromURL(avatar: (result.us?.stats.competitive.overall_stats.avatar)!)
                    self.downloadLevelImageFromURL(level: (result.us?.stats.competitive.overall_stats.rank_image)!)


                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.multikills?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.medals_bronze.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.medals_silver.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.medals_gold.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.objective_kills.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.time_played.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.games_played?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.games_lost?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.games_tied?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.final_blows?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.offensive_assists?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.games_won?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.eliminations.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.solo_kills.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.kill_streak_best.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.deaths.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.kpd.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.multikill_best?.description)!)
                    //                    self.compStats.append((result.us?.stats.competitive.game_stats.medals.description)!)
                    //
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.multikills?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.medals_bronze.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.medals_silver.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.medals_gold.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.objective_kills.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.time_played.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.games_played?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.games_lost?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.games_tied?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.final_blows?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.offensive_assists?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.games_won?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.eliminations.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.solo_kills.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.kill_streak_best.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.deaths.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.kpd.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.multikill_best?.description)!)
                    //                    self.quickStats.append((result.us?.stats.competitive.game_stats.medals.description)!)



                }
                //                print("result:", result.us?.stats.quickplay.game_stats.games_won)
            } catch let jsonErr {
                print(jsonErr)
            }
            }.resume()
    }

    func downloadAvatarImageFromURL(avatar: String) {
        let session = URLSession(configuration: .default)
        let imageURL = URL(string: avatar)
        let getImage = session.dataTask(with: imageURL!) { (data, response, error) in

            if let e = error {
                print("error \(e)")

            } else {
                DispatchQueue.main.async {

                    if (response as? HTTPURLResponse) != nil {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            self.avatarImage.image = image
                        } else {
                            print("No image found")
                        }
                    } else {
                        print("No response from sever")
                    }
                }
            }
            }.resume()
    }

    func downloadLevelImageFromURL(level: String) {
        let session = URLSession(configuration: .default)
        let imageURL = URL(string: level)
        let getImage = session.dataTask(with: imageURL!) { (data, response, error) in

            if let e = error {
                print("error \(e)")

            } else {
                DispatchQueue.main.async {

                    if (response as? HTTPURLResponse) != nil {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            self.levelImage.image = image
                        } else {
                            print("No image found")
                        }
                    } else {
                        print("No response from sever")
                    }
                }
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
