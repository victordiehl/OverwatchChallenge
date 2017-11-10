//
//  ViewController.swift
//  OverwatchChallenge
//
//  Created by victordiehl on 07/11/17.
//  Copyright © 2017 victordiehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aplicationIcon: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var helpTextView: UITextView!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "https://owapi.net/api/v3/u/TheMrMachine-1431/stats"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
         
//            let dataAsString = String(data: data, encoding: .utf8)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                print(json)
            } catch let jsonErr {
                
            }

        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchUser(_ sender: Any) {
    }
    

}

