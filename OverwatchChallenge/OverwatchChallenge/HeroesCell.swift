//
//  HeroesCell.swift
//  OverwatchChallenge
//
//  Created by victordiehl on 16/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class HeroesCell: UITableViewCell {

    @IBOutlet weak var heroesImageView: UIImageView!
    @IBOutlet weak var heroesNameLabel: UILabel!
    @IBOutlet weak var timePlayedLabel: UILabel!
    
    
    var player: PlayerStats? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {

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
