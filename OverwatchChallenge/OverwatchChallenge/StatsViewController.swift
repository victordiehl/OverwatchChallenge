//
//  StatsViewController.swift
//  OverwatchChallenge
//
//  Created by Raphael Braun on 10/11/2017.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var playerID = "zza-11231"
    var player: PlayerStats!

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var comprankImage: UIImageView!

    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var prestigeLabel: UILabel!
    @IBOutlet weak var comprankLabel: UILabel!
    @IBOutlet weak var winrateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        loadPlayerData()
    }

    func loadPlayerData() {
        let urlString = "https://owapi.net/api/v3/u/\(playerID)/stats"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 404 {
                } else {
                    do {
                        let result = try JSONDecoder().decode(PlayerStats.self, from: data)
                        self.player = result

                        DispatchQueue.main.async {

                            self.prestigeLabel.text = "Prestige \(result.us?.stats.competitive.overall_stats.prestige ?? 0)"
                            self.comprankLabel.text = result.us?.stats.competitive.overall_stats.comprank?.description ?? "0"
                            self.levelLabel.text = result.us?.stats.competitive.overall_stats.level?.description ?? "0"
                            self.gamesWonLabel.text = result.us?.stats.competitive.overall_stats.games?.description ?? "0"
                            self.nicknameLabel.text = self.playerID
                            self.winrateLabel.text = result.us?.stats.competitive.overall_stats.win_rate?.description ?? "0"
                            
                            switch(result.us?.stats.competitive.overall_stats.tier){
                            case nil:  self.comprankImage.image = #imageLiteral(resourceName: "bronze")
                            case "bronze"?: self.comprankImage.image = #imageLiteral(resourceName: "bronze")
                            case "silver"?: self.comprankImage.image = #imageLiteral(resourceName: "silver")
                            case "gold"?: self.comprankImage.image = #imageLiteral(resourceName: "gold")
                            case "platinum"?: self.comprankImage.image = #imageLiteral(resourceName: "platinum")
                            case "diamond"?: self.comprankImage.image = #imageLiteral(resourceName: "diamond")
                            case "master"?: self.comprankImage.image = #imageLiteral(resourceName: "master")
                            case "grandmaster"?: self.comprankImage.image = #imageLiteral(resourceName: "grandmaster")
                            default: self.comprankImage.image = #imageLiteral(resourceName: "bronze")
                            
                            }
                            

                            self.downloadAvatarImageFromURL(avatar: (result.us?.stats.competitive.overall_stats.avatar)!)
                            self.downloadLevelImageFromURL(level: (result.us?.stats.competitive.overall_stats.rank_image)!)

                            self.tableView.reloadData()
                        }

                    } catch let jsonError {
                        print(jsonError)
                    }
                }
            }
        }.resume()
    }

    func downloadAvatarImageFromURL(avatar: String) {
        let session = URLSession(configuration: .default)
        let imageURL = URL(string: avatar)

        session.dataTask(with: imageURL!) { (data, response, error) in

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

        session.dataTask(with: imageURL!) { (data, response, error) in

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
    }
}

//MARK: - TableView configuration

extension StatsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayerCell
        cell.player = self.player
        return cell
    }

}
