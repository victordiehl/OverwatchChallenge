//
//  secondScreenViewController.swift
//  OverwatchChallenge
//
//  Created by Lucas Vieira Ribeiro on 09/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class secondScreenViewController: UIViewController {

    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var gamesTrophy: UIImageView!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var lostLabel: UILabel!
    @IBOutlet weak var tieLabel: UILabel!
    @IBOutlet weak var rankImage: UIImageView!
    @IBOutlet weak var rankPoints: UILabel!
    @IBOutlet weak var prestigeLabel: UILabel!
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var statsTableView: UITableView!
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
