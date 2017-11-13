//
//  ViewController.swift
//  OverwatchChallenge
//
//  Created by victordiehl on 07/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var aplicationIcon: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var helpTextView: UITextView!
    
    override func viewDidLoad() {
        navBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchUser(_ sender: Any) {
    }

    func navBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.view.tintColor = #colorLiteral(red: 1, green: 0.6123600006, blue: 0.009494521655, alpha: 1)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! StatsViewController
        destinationViewController.playerID = textField.text!
    }
    
    @IBAction func backToViewController(_ sender: UIStoryboardSegue) {
        let vc = sender.source as! StatsViewController
    }
}


