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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPlayerData()
    }

    func loadPlayerData() {
        let urlString = "https://owapi.net/api/v3/u/\(playerID)/stats"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            do {
                let result = try JSONDecoder().decode(PlayerStats.self, from: data)
                self.player = result

                DispatchQueue.main.async {
                    self.downloadAvatarImageFromURL(avatar: (result.us?.stats.competitive.overall_stats.avatar)!)
                    self.downloadLevelImageFromURL(level: (result.us?.stats.competitive.overall_stats.rank_image)!)

                    self.tableView.reloadData()
                }

            } catch let jsonError {
                print(jsonError)
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
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - TableView configuration

extension StatsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let today = Calendar.current.date(byAdding: .hour, value: -3, to: Date())!
//
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.textAlignment = .center
//
//        let dateFormatter = DateHelper.createDateFormatter(local: "pt_BR", format: "EEEE, dd' de 'MMMM")
//        let sectionTitle = dateFormatter.string(from: today)
//
//        if(ptSections[section] == sectionTitle) {
//            header.contentView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.5058823529, blue: 0.4588235294, alpha: 1)
//            header.textLabel?.textColor = UIColor.white
//        } else {
//            header.contentView.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1)
//            header.textLabel?.textColor = UIColor.black
//        }
    }

}

extension StatsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayerCell
        cell.player = self.player
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }



}
