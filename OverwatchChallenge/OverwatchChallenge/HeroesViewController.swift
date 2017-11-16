//
//  HeroesViewController.swift
//  OverwatchChallenge
//
//  Created by victordiehl on 16/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import Foundation
import UIKit

class HeroesViewController: UIViewController {
    
    
    var player: PlayerStats!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlayerData()
    }
    
    func loadPlayerData() {
        let urlString = "https://owapi.net/api/v3/u/TheMrMachine-1431/heroes"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                let alertController = UIAlertController(title: "Erro de conexão", message: "Verifique sua conexão e tente novamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Voltar", style: .default) {
                    UIAlertAction in
                    self.performSegue(withIdentifier: "backToSearch", sender: self)
                }
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
//                self.activityIndicator.stopAnimating()
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 404 {
                    let alertController = UIAlertController(title: "Usuário não encontrado", message: "Verifique o nickname digitado", preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "Voltar", style: .default) {
                        UIAlertAction in
                        self.performSegue(withIdentifier: "backToSearch", sender: self)
                    }
                    alertController.addAction(action)
                    
                    self.present(alertController, animated: true, completion: nil)
//                    self.activityIndicator.stopAnimating()
                    
                } else {
                    do {
                        let result = try JSONDecoder().decode(HeroeStats.self, from: data)
//                        self.player = result
                        
                        DispatchQueue.main.async {
                            print(result.us?.heroes.playtime.competitive.mercy!)
                            
//                            self.prestigeLabel.text = "Prestige \(result.us?.stats.competitive.overall_stats.prestige ?? 0)"
//                            self.comprankLabel.text = result.us?.stats.competitive.overall_stats.comprank?.description ?? "0"
//                            self.levelLabel.text = result.us?.stats.competitive.overall_stats.level?.description ?? "0"
//                            self.gamesWonLabel.text = result.us?.stats.competitive.overall_stats.games?.description ?? "0"
//                            self.nicknameLabel.text = self.playerID
//                            self.winrateLabel.text = result.us?.stats.competitive.overall_stats.win_rate?.description ?? "0"
//
//                            switch(result.us?.stats.competitive.overall_stats.tier){
//                            case nil:  self.comprankImage.image = #imageLiteral(resourceName: "bronze")
//                            case "bronze"?: self.comprankImage.image = #imageLiteral(resourceName: "bronze")
//                            case "silver"?: self.comprankImage.image = #imageLiteral(resourceName: "silver")
//                            case "gold"?: self.comprankImage.image = #imageLiteral(resourceName: "gold")
//                            case "platinum"?: self.comprankImage.image = #imageLiteral(resourceName: "platinum")
//                            case "diamond"?: self.comprankImage.image = #imageLiteral(resourceName: "diamond")
//                            case "master"?: self.comprankImage.image = #imageLiteral(resourceName: "master")
//                            case "grandmaster"?: self.comprankImage.image = #imageLiteral(resourceName: "grandmaster")
//                            default: self.comprankImage.image = #imageLiteral(resourceName: "bronze")
//
//                            }
//
//                            self.downloadAvatarImageFromURL(avatar: (result.us?.stats.competitive.overall_stats.avatar)!)
//                            self.downloadLevelImageFromURL(level: (result.us?.stats.competitive.overall_stats.rank_image)!)
//                            self.activityIndicator.stopAnimating()
//                            self.tableView.reloadData()
//
                        }
                        
                    } catch let jsonError {
                        print(jsonError)
                    }
                    
                }
            }
            }.resume()
    }
    
}
