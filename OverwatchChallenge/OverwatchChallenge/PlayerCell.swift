//
//  PlayerCell.swift
//  OverwatchChallenge
//
//  Created by Raphael Braun on 10/11/2017.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var multikillLabel: UILabel!
    @IBOutlet weak var timeplayedLabel: UILabel!
    @IBOutlet weak var gamesplayedLabel: UILabel!
    @IBOutlet weak var finalblowsLabel: UILabel!
    @IBOutlet weak var offensiveassistsLabel: UILabel!
    @IBOutlet weak var eliminationsLabel: UILabel!
    @IBOutlet weak var solokillsLabel: UILabel!
    @IBOutlet weak var killstreakbestLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var kpdLabel: UILabel!
    @IBOutlet weak var medalsLabel: UILabel!


    var player: PlayerStats? {
        didSet {
            configureCell()
        }
    }

    func configureCell() {
        multikillLabel.text = player?.us?.stats.competitive.game_stats.multikills?.description ?? "N/A"
        timeplayedLabel.text = player?.us?.stats.competitive.game_stats.time_played?.description ?? "N/A"
        gamesplayedLabel.text = player?.us?.stats.competitive.game_stats.games_played?.description ?? "N/A"
        finalblowsLabel.text = player?.us?.stats.competitive.game_stats.final_blows?.description ?? "N/A"
        offensiveassistsLabel.text = player?.us?.stats.competitive.game_stats.offensive_assists?.description ?? "N/A"
        eliminationsLabel.text = player?.us?.stats.competitive.game_stats.eliminations?.description ?? "N/A"
        solokillsLabel.text = player?.us?.stats.competitive.game_stats.solo_kills?.description ?? "N/A"
        killstreakbestLabel.text = player?.us?.stats.competitive.game_stats.multikill_best?.description ?? "N/A"
        deathsLabel.text = player?.us?.stats.competitive.game_stats.deaths?.description ?? "N/A"
        kpdLabel.text = player?.us?.stats.competitive.game_stats.kpd?.description ?? "N/A"
        medalsLabel.text = player?.us?.stats.competitive.game_stats.medals?.description ?? "N/A"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
